# PS Toolkit — Enterprise Workflow Practice

> **⚠️ Practice repository only.** Exists solely to rehearse the enterprise git/GitHub workflow (commits → PR → review → CI → merge). Contains no real, work, or client data. Not a portfolio project.

A small PowerShell utility toolkit used to practice a production-style contribution workflow.

## Structure
- `src/` — the module functions
- `tests/` — Pester tests that validate the functions
- `.github/workflows/` — CI that runs lint + tests on every PR

## Contributing workflow
1. Branch off `main` (`feature/<short-description>`)
2. Make focused changes with clear commit messages
3. Push the branch and open a Pull Request
4. CI (lint + tests) must pass
5. A reviewer approves
6. Squash-merge into `main`, then delete the branch
