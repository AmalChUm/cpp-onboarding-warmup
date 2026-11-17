# C++ Onboarding Warm-Up

A low-stakes practice repository for the GitHub Classroom, Git, branching, C++ compilation, testing, and Pull Request workflow used in the Thursday, November 19 class session.

## Warm-up goal

Complete the **Sensor Spike Detector** function in `src/warmup.cpp`. You will practice:

- accepting a GitHub Classroom assignment;
- creating and switching to a feature branch;
- editing and saving C++ in VS Code;
- compiling with `g++`;
- running automated tests;
- committing and pushing a branch; and
- opening a Pull Request into `main`.

This is practice—not a graded debugging experiment. The larger experiment design uses exercises involving arrays, structs, classes, loops, and decision statements; this warm-up intentionally starts with one small array-and-loop problem so the workflow is the focus.

## Student starting point

Use the **GitHub Classroom invitation link provided by your instructor**. Do not clone this template repository directly: the template is the instructor-owned source repository, and students may not have permission to push to it or open the correct Pull Request there.

If you are setting up the class, configure the Classroom assignment from this repository in the GitHub Classroom web interface. The `.github-classroom.yml` file is only a placeholder for that configuration.

## Quick start

From the student assignment repository created by GitHub Classroom:

```bash
./scripts/check-env.sh
make test
```

The starter code is intentionally incomplete, so the tests should fail until you implement `countSpikes`. If `make` is unavailable, use the VS Code task **C++: build and run tests (no make)**.

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

1. Run the environment check.
2. Create your branch.
3. Implement and test the function.
4. Commit your work with a clear message.
5. Push your branch to GitHub.
6. Open a Pull Request from your branch into `main`.
7. In the PR description, include the output of the test command.

## VS Code instructions

See [`docs/VSCode-Workflow.md`](docs/VSCode-Workflow.md) for the complete student walkthrough, including installation alternatives, Codespaces, VS Code click paths, terminal commands, troubleshooting, and the Pull Request checklist.

## Repository layout

```text
src/warmup.cpp             Your implementation
src/warmup.h               Function declaration
tests/test_warmup.cpp      Small visible test program
scripts/check-env.sh       Pre-class environment check
.vscode/tasks.json         Build/test tasks for VS Code
.devcontainer/             Optional Codespaces configuration
Makefile                   Command-line build and test shortcuts
docs/VSCode-Workflow.md   Student instructions
```
