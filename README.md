# C++ Onboarding Warm-Up

A low-stakes practice repository for the GitHub Classroom, Git, branching, C++ compilation, testing, and Pull Request workflow used in the Thursday, November 19 class session.

## Warm-up goal

Complete the **Sensor Spike Detector** function in `src/warmup.cpp`. You will practice:

- cloning a classroom repository;
- creating and switching to a feature branch;
- editing and saving C++ in VS Code;
- compiling with `g++`;
- running automated tests;
- committing and pushing a branch; and
- opening a Pull Request into `main`.

This is practice—not a graded debugging experiment. The larger experiment design uses exercises involving arrays, structs, classes, loops, and decision statements; this warm-up intentionally starts with one small array-and-loop problem so the workflow is the focus.

## Quick start

```bash
# from the repository root
make test
```

The starter code is intentionally incomplete, so the tests should fail until you implement `countSpikes`.

## Assignment

Implement:

```cpp
int countSpikes(const int readings[], int n);
```

Count interior readings that are **strictly greater than the integer average** of their immediate neighbors. The first and last readings are never interior readings and must not be counted.

Examples:

- `{1, 2, 1}` → `1`
- `{1, 1, 1, 1}` → `0`
- `{5, 1, 5}` → `0`

Do not change the function signature or the tests. Keep your work on a branch named `warmup/<your-github-username>`.

## Required workflow

1. Create your branch.
2. Implement and test the function.
3. Commit your work with a clear message.
4. Push your branch to GitHub.
5. Open a Pull Request from your branch into `main`.
6. In the PR description, include the output of `make test`.

## VS Code instructions

See [`docs/VSCode-Workflow.md`](docs/VSCode-Workflow.md) for the complete student walkthrough, including prerequisites, terminal commands, VS Code tasks, troubleshooting, and the Pull Request checklist.

## Repository layout

```text
src/warmup.cpp             Your implementation
src/warmup.h               Function declaration
tests/test_warmup.cpp      Small visible test program
.vscode/tasks.json         Build/test tasks for VS Code
Makefile                   Command-line build and test shortcuts
docs/VSCode-Workflow.md   Student instructions
```
