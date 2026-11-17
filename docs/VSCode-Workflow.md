# C++ GitHub & Environment Warm-Up: Student Runbook

This warm-up practices the GitHub workflow, VS Code editing, C++ compilation, local testing, branching, and Pull Requests used in the Thursday, November 19 lab.

## Quick path

1. Accept the collaborator invitation to your assigned repository.
2. Disable AI coding extensions if your instructor asks you to work without them.
3. Clone your assigned repository and create branch `feat/warmup`.
4. Implement the three TODO functions in `src/warmup.cpp`.
5. Run the local tests with `make test` or the direct `g++` command.
6. Push `feat/warmup`, open a Pull Request into `main`, wait for CI, and merge.
7. Submit the merged Pull Request URL in Canvas.

## 1. Accept your repository invitation

Your instructor will send a collaborator invitation for a personal repository named like:

```text
cpp-onboarding-warmup-YOUR-GITHUB-USERNAME
```

Accept the invitation from the GitHub email or from:

<https://github.com/AmalChUm/cpp-onboarding-warmup-YOUR-GITHUB-USERNAME/invitations>

Replace `YOUR-GITHUB-USERNAME` with your actual GitHub username.

Do **not** fork the template repository and do not work directly in `AmalChUm/cpp-onboarding-warmup`. Work in your assigned repository, where you have push access.

## 2. Check your environment

Open VS Code and choose **Terminal → New Terminal**. After cloning the repository, run:

```bash
./scripts/check-env.sh
```

You can also check the tools directly:

```bash
git --version
g++ --version
make --version
```

If `g++` or `make` is missing, use the class-approved lab setup or GitHub Codespaces. The repository includes a `.devcontainer/` configuration for a C++ Codespace. On a managed computer, ask before installing software.

If Git reports that your name or email is missing, configure them with your own GitHub-associated information:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

## 3. Clone the repository and create `feat/warmup`

Copy the HTTPS URL from your assigned repository using **Code → HTTPS → Copy**. In the VS Code terminal, run:

```bash
git clone https://github.com/AmalChUm/cpp-onboarding-warmup-YOUR-GITHUB-USERNAME.git
cd cpp-onboarding-warmup-YOUR-GITHUB-USERNAME
git checkout -b feat/warmup
```

Replace the repository URL and folder name with your assigned values.

Confirm that you are on the correct branch:

```bash
git branch --show-current
git remote -v
```

The branch command should print `feat/warmup`, and the remote should point to your personal repository—not the template.

You may create the branch through VS Code instead: click the branch name in the lower-left status bar, choose **Create new branch**, enter `feat/warmup`, and press Enter.

## 4. Understand the three functions

Open `src/warmup.cpp`. Complete the TODOs without changing `src/warmup.hpp` or `tests/warmup_tests.cpp`.

### `sumEvenNumbers`

```cpp
int sumEvenNumbers(const int arr[], int size);
```

Loop through `arr[0]` through `arr[size - 1]` and return the sum of values divisible by 2. If `size` is `0`, return `0`.

### `countCharOccurrences`

```cpp
int countCharOccurrences(const std::string& text, char target);
```

Loop through the string and return how many characters equal `target`.

### `getArrayBounds`

```cpp
void getArrayBounds(const int arr[], int size, int& minVal, int& maxVal);
```

Assuming `size > 0`, initialize both reference outputs from `arr[0]`, then scan the rest of the array and update the minimum and maximum values.

This function intentionally practices pass-by-reference state updates.

## 5. Compile and run tests locally

The recommended command is:

```bash
make test
```

The direct compiler command is:

```bash
g++ -std=c++17 -Wall -Wextra src/warmup.cpp tests/warmup_tests.cpp -o warmup_test
./warmup_test
```

You can also use **Terminal → Run Task** in VS Code and choose:

- **C++: build and run warm-up tests**; or
- **C++: build and run warm-up tests (no make)**.

A successful run ends with:

```text
Warm-up build and tests passed!
```

There should be no compiler errors. The visible tests cover even-number sums, empty input, character counts, and array bounds.

## 6. Review and commit your implementation

Review the only intended student change:

```bash
git diff -- src/warmup.cpp
git status
```

Stage and commit:

```bash
git add src/warmup.cpp
git commit -m "Complete C++ warm-up functions"
```

In VS Code, you can instead use the Source Control panel to review `src/warmup.cpp`, stage it, enter the same commit message, and click **Commit**.

## 7. Push and open the Pull Request

Push the branch:

```bash
git push -u origin feat/warmup
```

If GitHub asks you to authenticate, use the approved VS Code/GitHub sign-in flow or credential manager. Do not paste a password or access token into a file, commit, or chat.

Open your assigned repository on GitHub and choose **Compare & pull request**. If the button is not shown:

1. choose **Pull requests → New pull request**;
2. set **base** to `main`;
3. set **compare** to `feat/warmup`; and
4. choose **Create pull request**.

The base branch is where the change will land; the compare branch is your work.

## 8. Wait for CI and merge

Wait for **Warm-Up CI Check** to finish. It compiles:

```bash
g++ -std=c++17 -Wall -Wextra src/warmup.cpp tests/warmup_tests.cpp -o warmup_test
./warmup_test
```

When the check is green, choose **Merge pull request → Confirm merge**. Do not merge until the CI check passes unless the instructor tells you otherwise.

## 9. Submit on Canvas

Copy the URL of your merged Pull Request, which will look like:

```text
https://github.com/AmalChUm/cpp-onboarding-warmup-YOUR-GITHUB-USERNAME/pull/1
```

Submit that URL in the Canvas assignment box before leaving class.

## Troubleshooting

### I cannot find the invitation

Check your GitHub email and the repository invitations page. Confirm that the instructor has the exact spelling of your GitHub username.

### I cloned the template by mistake

Do not push or open a PR there. Delete the local clone, accept your collaborator invitation, and clone your assigned repository instead.

### `g++: command not found` or `make: command not found`

Use the class-managed lab setup or Codespaces. If `g++` is available but `make` is not, use the direct compiler command or the no-make VS Code task.

### `fatal: not a git repository`

Change into the assigned repository folder and retry:

```bash
cd cpp-onboarding-warmup-YOUR-GITHUB-USERNAME
git status
```

### The Pull Request targets the wrong repository or branch

Close the incorrect PR without merging. Reopen it from your assigned repository with base `main` and compare `feat/warmup`.

### Tests fail

Read the compiler output first. Check the loop bounds, `% 2 == 0`, character comparison, initial `arr[0]` bounds, and reference assignments. Do not edit the tests to make them pass.

## Completion checklist

- [ ] Collaborator invitation accepted
- [ ] AI extensions disabled if instructed
- [ ] Assigned repository cloned
- [ ] `feat/warmup` created
- [ ] Three TODO functions implemented
- [ ] Local tests pass
- [ ] Commit created
- [ ] Branch pushed
- [ ] Pull Request opened into `main`
- [ ] Warm-Up CI Check is green
- [ ] Pull Request merged
- [ ] Merged Pull Request URL submitted in Canvas
