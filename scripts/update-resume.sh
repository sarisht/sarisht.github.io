#!/usr/bin/env bash
#
# One-shot resume update:
#   1. git pull the sarisht.github.io repo
#   2. compile Sarisht-Resume/cv_6.tex
#   3. copy the PDF to static/uploads/resume.pdf
#   4. commit & push (which triggers the GitHub Pages deploy)
#
# Usage:  ./scripts/update-resume.sh        (works from any directory)
#
# Note: the LaTeX source (Sarisht-Resume/) is gitignored and must exist locally.
#
set -euo pipefail

# Ensure a macOS MacTeX/TeX Live install is on PATH (no-op if already there).
export PATH="/Library/TeX/texbin:$PATH"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
RESUME_DIR="$REPO_ROOT/Sarisht-Resume"
OUT="$REPO_ROOT/static/uploads/resume.pdf"

command -v latexmk >/dev/null || { echo "error: latexmk not found — install MacTeX/TeX Live."; exit 1; }
[ -f "$RESUME_DIR/cv_6.tex" ] || { echo "error: $RESUME_DIR/cv_6.tex not found."; exit 1; }

echo "==> [1/4] git pull"
git -C "$REPO_ROOT" pull --ff-only

echo "==> [2/4] compile cv_6.tex"
( cd "$RESUME_DIR" && latexmk -pdf -interaction=nonstopmode -halt-on-error cv_6.tex && latexmk -c cv_6.tex )

echo "==> [3/4] copy to static/uploads/resume.pdf"
cp "$RESUME_DIR/cv_6.pdf" "$OUT"

echo "==> [4/4] commit & push"
if git -C "$REPO_ROOT" diff --quiet -- static/uploads/resume.pdf; then
  echo "resume.pdf is unchanged — nothing to publish."
  exit 0
fi
git -C "$REPO_ROOT" add static/uploads/resume.pdf
git -C "$REPO_ROOT" commit -m "Update resume.pdf (compiled from cv_6.tex)"
git -C "$REPO_ROOT" push
echo "==> done — live at https://sarisht.github.io/uploads/resume.pdf once the Pages deploy finishes."
