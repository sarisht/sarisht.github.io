/**
 * Decap CMS — GitHub OAuth broker for Cloudflare Workers.
 *
 * GitHub Pages can't hold an OAuth client secret, so Decap's GitHub login needs
 * this tiny broker. It implements the two endpoints Decap expects:
 *   GET /auth      -> redirect the user to GitHub's authorize page
 *   GET /callback  -> exchange the code for a token, hand it back to Decap
 *
 * ---------------------------------------------------------------------------
 * ONE-TIME SETUP
 * ---------------------------------------------------------------------------
 * 1) Create a GitHub OAuth App:
 *      GitHub -> Settings -> Developer settings -> OAuth Apps -> New OAuth App
 *      - Application name:          sarisht.github.io CMS   (anything)
 *      - Homepage URL:             https://sarisht.github.io
 *      - Authorization callback:   https://<your-worker>.workers.dev/callback
 *    Click "Register application", copy the Client ID, then "Generate a new
 *    client secret" and copy that too.
 *
 * 2) Deploy this worker (Cloudflare dashboard -> Workers -> Create -> paste,
 *    or `npx wrangler deploy`). After deploy you get the worker URL; put it in:
 *      - the OAuth App callback (step 1, the /callback URL), and
 *      - static/admin/config.yml -> backend.base_url
 *
 * 3) Add the secrets to the worker (Settings -> Variables, "Encrypt"):
 *      GITHUB_CLIENT_ID      = <client id>
 *      GITHUB_CLIENT_SECRET  = <client secret>
 *
 * Then visit https://sarisht.github.io/admin/ and "Login with GitHub".
 * ---------------------------------------------------------------------------
 */

const AUTHORIZE_URL = "https://github.com/login/oauth/authorize";
const TOKEN_URL = "https://github.com/login/oauth/access_token";
// 'public_repo' is enough for a public repo; use 'repo' if the repo is private.
const SCOPE = "public_repo,user";
const PROVIDER = "github";

function renderResult(status, payload) {
  // Decap's popup handshake: announce, wait for the opener's ack, then send the
  // result back to the opener's origin.
  const content = JSON.stringify(payload);
  return `<!doctype html><html><body><script>
  (function () {
    function receiveMessage(e) {
      window.opener.postMessage(
        'authorization:${PROVIDER}:${status}:${content}',
        e.origin
      );
      window.removeEventListener('message', receiveMessage, false);
    }
    window.addEventListener('message', receiveMessage, false);
    window.opener.postMessage('authorizing:${PROVIDER}', '*');
  })();
  </script></body></html>`;
}

export default {
  async fetch(request, env) {
    const url = new URL(request.url);

    if (url.pathname === "/auth") {
      const params = new URLSearchParams({
        client_id: env.GITHUB_CLIENT_ID,
        redirect_uri: `${url.origin}/callback`,
        scope: SCOPE,
        state: crypto.randomUUID(),
      });
      return Response.redirect(`${AUTHORIZE_URL}?${params.toString()}`, 302);
    }

    if (url.pathname === "/callback") {
      const code = url.searchParams.get("code");
      if (!code) return new Response("Missing ?code", { status: 400 });

      let html;
      try {
        const res = await fetch(TOKEN_URL, {
          method: "POST",
          headers: { "Content-Type": "application/json", Accept: "application/json" },
          body: JSON.stringify({
            client_id: env.GITHUB_CLIENT_ID,
            client_secret: env.GITHUB_CLIENT_SECRET,
            code,
          }),
        });
        const data = await res.json();
        html = data.access_token
          ? renderResult("success", { token: data.access_token, provider: PROVIDER })
          : renderResult("error", { message: data.error_description || data.error || "no token" });
      } catch (err) {
        html = renderResult("error", { message: String(err) });
      }
      return new Response(html, { headers: { "Content-Type": "text/html; charset=utf-8" } });
    }

    return new Response("Decap OAuth broker is running.", {
      headers: { "Content-Type": "text/plain" },
    });
  },
};
