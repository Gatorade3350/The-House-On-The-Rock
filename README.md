# The House On The Rock

This repository contains a static homepage copy of House on the Rock for GitHub Pages.

## Files

- `index.html` — root entrypoint for GitHub Pages
- `Website` — raw saved HTML snapshot used to create `index.html`
- `.nojekyll` — prevents GitHub Pages from ignoring files and directories that begin with an underscore
- `.github/workflows/deploy-pages.yml` — GitHub Actions workflow to publish the site to `gh-pages`

## Debugger setup

The integrated browser is configured to use a local web server:

1. Run the `Serve Website` task in VS Code.
2. Start the `Open Website` debug configuration.

This opens `http://127.0.0.1:8000/index.html` in the integrated browser.

## GitHub Pages deployment

Push to the `main` branch. The workflow will deploy the repository root to the `gh-pages` branch automatically.

If your repository uses a different default branch, update `.github/workflows/deploy-pages.yml` accordingly.
