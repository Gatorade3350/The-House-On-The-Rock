# The House On The Rock — GitHub Pages deployment

This repository contains a static export in the `Old` folder.

What I added
- GitHub Actions workflow: [.github/workflows/deploy-pages.yml](.github/workflows/deploy-pages.yml)
- `.nojekyll` at the repo root to prevent Jekyll processing

How it works
- On push to `main`, the workflow publishes the `Old` folder to the `gh-pages` branch.

Next steps (you)
1. Commit and push these changes to GitHub:

```bash
git add .github/ .nojekyll README.md
git commit -m "Add Pages deployment workflow"
git push origin main
```

2. After the workflow runs, enable GitHub Pages in the repository settings (if not auto-enabled) and choose the `gh-pages` branch as the source.

If your default branch is not `main`, edit `.github/workflows/deploy-pages.yml` to trigger on your branch name.
