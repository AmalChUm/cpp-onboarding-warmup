# CSC-175 GitHub & C++ Environment Warm-Up

This low-stakes warm-up practices the GitHub workflow, VS Code editing, C++ compilation, local testing, branching, and Pull Requests used in the Thursday, November 19 lab.

The repository template contains three small TODO functions in `src/warmup.cpp`. Complete them on branch `feat/warmup`, run the local tests, push the branch, open a Pull Request into `main`, wait for the Warm-Up CI Check, and merge.

## Student starting point

This repository is a template. Use the collaborator invitation sent by the instructor to your assigned repository, named like `cpp-onboarding-warmup-YOUR-GITHUB-USERNAME`. Do not fork or work directly in this template repository.

## Quick path

```bash
git clone https://github.com/AmalChUm/cpp-onboarding-warmup-YOUR-GITHUB-USERNAME.git
cd cpp-onboarding-warmup-YOUR-GITHUB-USERNAME
git checkout -b feat/warmup
./scripts/check-env.sh
```

Then implement the three functions in `src/warmup.cpp`, run `make test` or the direct `g++` command in the student guide, push `feat/warmup`, open the Pull Request into `main`, wait for CI, and merge.

## Functions

- `sumEvenNumbers`: return the sum of even values in an integer array.
- `countCharOccurrences`: count how many times a target character appears in a `std::string`.
- `getArrayBounds`: write the smallest and largest array values through reference parameters.

Do not modify `src/warmup.hpp` or `tests/warmup_tests.cpp`.

## Documentation

- [Student step-by-step VS Code guide](docs/VSCode-Workflow.md)
- [Instructor provisioning and setup runbook](docs/INSTRUCTOR-RUNBOOK.md)

## Repository layout

```text
src/warmup.hpp            Function declarations
src/warmup.cpp            Student implementation file
tests/warmup_tests.cpp    Visible assert-based tests
scripts/check-env.sh      Environment check
.github/workflows/        Warm-Up CI Check
.devcontainer/            Optional Codespaces configuration
Makefile                  Local build/test shortcuts
docs/                     Student and instructor runbooks
```
