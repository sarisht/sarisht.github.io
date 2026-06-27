#!/usr/bin/env bash
#
# One-shot resume update:
#   1. git pull the resume source (Sarisht-Resume); abort if nothing new
#   2. git pull the sarisht.github.io repo
#   3. compile Sarisht-Resume/cv_6.tex
#   4. copy the PDF to static/uploads/resume.pdf
#   5. commit & push (which triggers the GitHub Pages deploy)
#
# Usage:  ./scripts/update-resume.sh        (works from any directory)
#
# Note: the LaTeX source (Sarisht-Resume/) is gitignored and must exist locally.
#
set -euo pipefail

# Ensure a macOS MacTeX/TeX Live install is on PATH (no-op if already there).
export PATH="/Library/TeX/texbin:$PATH"

# Resolve the real script location even when invoked through a symlink.
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
  SOURCE="$(readlink "$SOURCE")"
  [ "${SOURCE#/}" = "$SOURCE" ] && SOURCE="$DIR/$SOURCE"
done
SCRIPT_DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
RESUME_DIR="$REPO_ROOT/Sarisht-Resume"
OUT="$REPO_ROOT/static/uploads/resume.pdf"

command -v latexmk >/dev/null || { echo "error: latexmk not found — install MacTeX/TeX Live."; exit 1; }
[ -f "$RESUME_DIR/cv_6.tex" ] || { echo "error: $RESUME_DIR/cv_6.tex not found."; exit 1; }

echo "==> [1/5] git pull resume source (Sarisht-Resume)"
before="$(git -C "$RESUME_DIR" rev-parse HEAD)"
git -C "$RESUME_DIR" pull --ff-only
after="$(git -C "$RESUME_DIR" rev-parse HEAD)"
# Local commits not yet on the upstream, and uncommitted edits to *tracked* source
# files (ignore the untracked cv_6.pdf build artifact).
ahead="$(git -C "$RESUME_DIR" rev-list --count '@{u}..HEAD' 2>/dev/null || echo 0)"
dirty="$(git -C "$RESUME_DIR" status --porcelain --untracked-files=no)"
if [ "$before" = "$after" ] && [ "$ahead" -eq 0 ] && [ -z "$dirty" ]; then
  echo "Sarisht-Resume is already up to date with no local changes — nothing to compile. Aborting."
  exit 0
fi

echo "==> [2/5] git pull site repo (sarisht.github.io)"
git -C "$REPO_ROOT" pull --ff-only

# Reproducible build: deterministic PDF timestamp from the source's last commit, so
# an unchanged CV recompiles to identical bytes (the guard below skips no-op runs).
export FORCE_SOURCE_DATE=1
export SOURCE_DATE_EPOCH="$(git -C "$RESUME_DIR" log -1 --format=%ct 2>/dev/null || echo 0)"

echo "==> [3/5] compile cv_6.tex"
( cd "$RESUME_DIR" && latexmk -pdf -interaction=nonstopmode -halt-on-error cv_6.tex && latexmk -c cv_6.tex )

echo "==> [4/5] copy to static/uploads/resume.pdf"
cp "$RESUME_DIR/cv_6.pdf" "$OUT"

echo "==> [5/5] commit & push"
if git -C "$REPO_ROOT" diff --quiet -- static/uploads/resume.pdf; then
  echo "resume.pdf is unchanged — nothing to publish."
  exit 0
fi
git -C "$REPO_ROOT" add static/uploads/resume.pdf
git -C "$REPO_ROOT" commit -m "Update resume.pdf (compiled from cv_6.tex)"
git -C "$REPO_ROOT" push
echo "==> done — live at https://sarisht.github.io/uploads/resume.pdf once the Pages deploy finishes."
