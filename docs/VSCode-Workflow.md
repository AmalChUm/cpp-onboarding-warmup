# C++ Onboarding Warm-Up: VS Code Workflow

This warm-up rehearses the exact workflow used in class on **Thursday, November 19**. It is practice, not a graded AI-versus-no-AI task. Complete the workflow and open your Pull Request during today’s onboarding session.

## Before class: run the environment check

The biggest source of delay is a missing compiler or build tool. Before class, or at the start of the session, open VS Code and choose **Terminal → New Terminal**. From the repository root, run:

```bash
./scripts/check-env.sh
```

You can also check the individual tools:

```bash
git --version
g++ --version
make --version
```

The environment check reports missing commands and whether your Git name and email are configured.

### If a tool is missing

- **Windows:** The easiest class-approved option is GitHub Codespaces (see below). If you are working locally, install WSL and the Ubuntu development tools, or install MSYS2 with the MinGW-w64 GCC toolchain. Do not install software during class without permission.
- **macOS:** Install the Xcode Command Line Tools with `xcode-select --install`, then verify `g++ --version` and `make --version`.
- **Ubuntu/Debian:** Install the class-approved build tools, commonly with `sudo apt update && sudo apt install build-essential`.
- **Managed lab:** Ask lab support which compiler setup is supported; do not change the lab image yourself.

If installation is not practical, use a Codespace. You can still practice Git branches, commits, pushes, and Pull Requests there.

## 1. Start from GitHub Classroom—not the template repository

Use **only the GitHub Classroom invitation link provided by your instructor**. Accept the assignment and wait for GitHub Classroom to create your personal assignment repository.

Do **not** clone `AmalChUm/cpp-onboarding-warmup` directly. That repository is the instructor-owned template; students may not have permission to push to it, and a Pull Request to the template would be the wrong submission location.

After accepting the Classroom assignment, open your newly created assignment repository and choose **Code → HTTPS → Copy**. Use the HTTPS URL for your personal assignment repository in the commands below.

## 2. Optional: use GitHub Codespaces

If local setup is difficult:

1. Open your GitHub Classroom assignment repository.
2. Select **Code → Codespaces → Create codespace on main**.
3. Wait for VS Code in the browser to open.
4. Open **Terminal → New Terminal**.
5. Run `./scripts/check-env.sh`.

The repository includes `.devcontainer/devcontainer.json`, which supplies a C++ development image and the Microsoft C/C++ extension. Codespaces also handles GitHub authentication in the browser. You still need to create a branch, commit, push, and open the Pull Request yourself.

## 3. Clone and open the assignment in VS Code

If you are working locally, open a VS Code terminal and run:

```bash
git clone YOUR-CLASSROOM-ASSIGNMENT-URL
cd YOUR-ASSIGNMENT-REPOSITORY
code .
```

Replace `YOUR-CLASSROOM-ASSIGNMENT-URL` with the URL copied from **your** Classroom assignment repository. If `code .` is not recognized, open VS Code manually and choose **File → Open Folder**, then select the cloned folder.

Run the environment check from the repository root:

```bash
./scripts/check-env.sh
```

## 4. Configure Git identity if needed

A commit needs a name and email. If the environment check prints a warning, configure them with your own information:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

Use the email address associated with your GitHub account or your GitHub-provided no-reply email if your instructor requires that. Check the result with:

```bash
git config --get user.name
git config --get user.email
```

## 5. Create your branch before editing

Never do assignment work directly on `main`. In the VS Code terminal, run:

```bash
git switch -c warmup/YOUR-GITHUB-USERNAME
```

Replace `YOUR-GITHUB-USERNAME` with your actual GitHub username. For example:

```bash
git switch -c warmup/amalstudent
```

If your Git version is too old for `git switch`, use the equivalent command:

```bash
git checkout -b warmup/YOUR-GITHUB-USERNAME
```

Verify the branch:

```bash
git branch --show-current
git status
```

The first command should print your `warmup/...` branch. You can also create a branch through the VS Code interface: click the branch name in the lower-left status bar, choose **Create new branch**, enter `warmup/YOUR-GITHUB-USERNAME`, and press Enter.

## 6. Read the starter code and run the tests

In the VS Code Explorer, open:

- `README.md` for the assignment summary;
- `src/warmup.cpp` for the function you must complete; and
- `tests/test_warmup.cpp` for visible examples.

Run the starter tests in the terminal:

```bash
make test
```

The starter code returns `0`, so two tests should fail. That is expected. You are practicing the workflow, not trying to make the starter pass unchanged.

If `make` is unavailable, use the no-make command:

```bash
mkdir -p build
g++ -std=c++17 -Wall -Wextra -pedantic -g -Isrc src/warmup.cpp tests/test_warmup.cpp -o build/test_warmup
./build/test_warmup
```

Or use the VS Code task: choose **Terminal → Run Task**, then select **C++: build and run tests** or **C++: build and run tests (no make)**.

Test output is easy to scan:

- `PASS:` means one visible check passed.
- `FAIL:` shows the expected value and the value your program returned.
- `All tests passed.` means the test program returned success.

## 7. Implement the function

Edit `src/warmup.cpp` and implement:

```cpp
int countSpikes(const int readings[], int n);
```

A reading is an interior spike when:

1. it has both a left and right neighbor;
2. it is strictly greater than the integer average of those two neighbors; and
3. it is counted once.

The first and last array elements are never interior readings. Inputs with fewer than three readings should return `0`.

Useful C++ reminders:

- array indices start at `0`;
- the interior indices are `1` through `n - 2`;
- `int` division gives an integer average; and
- `&&` combines conditions.

Do not change the function signature, the test program, or the expected values.

## 8. Compile and test in VS Code

Save the file, then run either:

```bash
make test
```

or, without `make`:

```bash
mkdir -p build && g++ -std=c++17 -Wall -Wextra -pedantic -g -Isrc src/warmup.cpp tests/test_warmup.cpp -o build/test_warmup && ./build/test_warmup
```

You are done with the coding portion when the output ends with:

```text
All tests passed.
```

If you want a clean rebuild and have `make`:

```bash
make clean
make test
```

## 9. Review your changes

Before committing, inspect your work:

```bash
git diff
git status
```

You should see your implementation change in `src/warmup.cpp`. You should not see generated files from `build/`; those are ignored automatically.

## 10. Commit and push your branch

Create a clear commit:

```bash
git add src/warmup.cpp
git commit -m "Complete sensor spike detector warm-up"
```

You can also use VS Code’s Source Control panel:

1. Click the Source Control icon on the left.
2. Review the changed file.
3. Click the plus sign beside `src/warmup.cpp` to stage it.
4. Enter `Complete sensor spike detector warm-up` in the message box.
5. Click **Commit**.

Push the branch:

```bash
git push -u origin warmup/YOUR-GITHUB-USERNAME
```

Or choose **Publish Branch** in the Source Control panel.

On the first push, GitHub may ask you to sign in. Use the GitHub sign-in flow offered by VS Code or your instructor’s approved credential manager. Never paste a password or access token into a file, commit, or chat. If an HTTPS push asks for a password, do not guess; stop and use the approved sign-in method or Codespaces.

If you see `Author identity unknown`, complete the Git identity step above and retry the commit.

## 11. Open the Pull Request

After the push, GitHub usually displays **Compare & pull request**. Select it. If not:

1. open your Classroom assignment repository on GitHub;
2. choose **Pull requests → New pull request**;
3. set **base** to `main` (the destination branch);
4. set **compare** to your `warmup/...` branch (the branch containing your work); and
5. choose **Create pull request**.

Use this title:

```text
Complete C++ onboarding warm-up
```

In the description, include:

```text
## What I changed
- Implemented countSpikes in src/warmup.cpp.

## Verification
- `make test` passes.
- Output ends with: All tests passed.

## Workflow practiced
- Created a feature branch
- Committed and pushed the branch
- Opened this Pull Request into main
```

Do not merge the Pull Request unless your instructor asks you to. The point of today’s exercise is to practice creating the PR.

## Troubleshooting

### `make: command not found`

Use **C++: build and run tests (no make)** from **Terminal → Run Task**, or run the direct `g++` command shown above. If `g++` is also missing, use Codespaces or follow the platform setup options at the top of this guide.

### `g++: command not found`

Use Codespaces, the class-managed lab image, WSL/MSYS2 on Windows, Xcode Command Line Tools on macOS, or the Ubuntu build tools as appropriate. Ask for help before installing software on a managed computer.

### `fatal: not a git repository`

Your terminal is not inside the cloned assignment folder. Run:

```bash
cd YOUR-ASSIGNMENT-REPOSITORY
git status
```

### `src/warmup.cpp` is not listed in `git diff`

Make sure you saved the file and are on your `warmup/...` branch:

```bash
git branch --show-current
git status
```

### Push is rejected or asks for a password

Confirm that you cloned your GitHub Classroom assignment repository, not the instructor template:

```bash
git remote -v
```

Then use the approved GitHub sign-in method, VS Code GitHub authentication, or Codespaces. Do not force-push and do not paste tokens into the terminal history or repository.

### Tests fail

Read the first `FAIL:` line. Compare your loop bounds, neighbor indices, strict comparison, integer average, and handling of arrays shorter than three elements. Do not edit the tests to make them pass.

## Completion checklist

- [ ] Used the GitHub Classroom invitation and opened the personal assignment repository
- [ ] Ran `./scripts/check-env.sh`
- [ ] Opened the assignment in VS Code or Codespaces
- [ ] Created `warmup/<your-github-username>`
- [ ] Implemented `src/warmup.cpp`
- [ ] `make test` or the no-make test command passes
- [ ] Reviewed `git diff`
- [ ] Configured Git name and email if needed
- [ ] Created a commit
- [ ] Pushed the branch to GitHub
- [ ] Opened a Pull Request into `main`
- [ ] Added test verification to the PR description
