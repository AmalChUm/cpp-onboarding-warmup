# C++ Onboarding Warm-Up: VS Code Workflow

**Due for today’s onboarding practice:** complete the workflow and open your Pull Request before leaving the session.

This warm-up is designed to rehearse the exact workflow used in class on **Thursday, November 19**. It is practice, not a graded AI-versus-no-AI task.

## 1. Install or verify the tools

You need:

- a GitHub account and access to the classroom repository;
- Git;
- Visual Studio Code;
- the Microsoft **C/C++** extension in VS Code; and
- a C++ compiler with `g++` available in a terminal.

Open VS Code, then open **Terminal → New Terminal**. Run:

```bash
git --version
g++ --version
```

If both commands print version information, continue. If `g++` is missing, ask the instructor before changing computer-lab software.

## 2. Accept or open the warm-up repository

If your instructor gives you a GitHub Classroom invitation, open that link first and accept the assignment. Otherwise, open the repository directly:

<https://github.com/AmalChUm/cpp-onboarding-warmup>

Copy the repository’s HTTPS clone URL from GitHub using **Code → HTTPS → Copy**.

In the VS Code terminal, move to the folder where you keep class work and clone the repository:

```bash
git clone https://github.com/AmalChUm/cpp-onboarding-warmup.git
cd cpp-onboarding-warmup
code .
```

If `code .` is not recognized, open VS Code manually and choose **File → Open Folder**, then select the cloned `cpp-onboarding-warmup` folder.

## 3. Create your branch before editing

Never do your assignment work directly on `main`. In the VS Code terminal, run:

```bash
git switch -c warmup/YOUR-GITHUB-USERNAME
```

Replace `YOUR-GITHUB-USERNAME` with your actual GitHub username. For example:

```bash
git switch -c warmup/amalstudent
```

Verify the branch:

```bash
git branch --show-current
git status
```

The first command should print your `warmup/...` branch.

## 4. Read the starter code and run the tests

In the VS Code Explorer, open:

- `README.md` for the assignment summary;
- `src/warmup.cpp` for the function you must complete; and
- `tests/test_warmup.cpp` for visible examples.

Run the starter tests in the terminal:

```bash
make test
```

The starter code returns `0`, so at least one test should fail. That is expected. You are practicing the workflow, not trying to make the starter pass unchanged.

You can also run the same command through VS Code: open **Terminal → Run Task**, choose **C++: build and run tests**, and read the output in the terminal panel.

## 5. Implement the function

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

## 6. Compile and test in VS Code

Save the file, then run:

```bash
make test
```

You are done with the coding portion when the output ends with:

```text
All tests passed.
```

You should also compile with warnings enabled; the repository’s `Makefile` uses `-Wall -Wextra -pedantic` for you.

If you want a clean rebuild:

```bash
make clean
make test
```

## 7. Review your changes

Before committing, inspect your work:

```bash
git diff
git status
```

You should see your implementation change in `src/warmup.cpp`. You should not see generated files from `build/`; those are ignored automatically.

## 8. Commit and push your branch

Create a clear commit:

```bash
git add src/warmup.cpp
git commit -m "Complete sensor spike detector warm-up"
```

Push the branch and set its upstream tracking branch:

```bash
git push -u origin warmup/YOUR-GITHUB-USERNAME
```

Use the exact branch name you created. If GitHub asks you to authenticate, use the sign-in method provided by your instructor; never paste a password or access token into a file or chat.

## 9. Open the Pull Request

After the push, GitHub usually displays a **Compare & pull request** button. Select it. If not:

1. open the repository on GitHub;
2. choose **Pull requests → New pull request**;
3. set **base** to `main`;
4. set **compare** to your `warmup/...` branch; and
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

Use the VS Code task only if your environment provides `make`; otherwise ask the instructor for the class-approved build command. Do not install software during class without permission.

### `g++: command not found`

The compiler is not available in the current terminal. Ask the instructor or lab support rather than changing the repository.

### `fatal: not a git repository`

Your terminal is not inside the cloned folder. Run:

```bash
cd cpp-onboarding-warmup
git status
```

### `src/warmup.cpp` is not listed in `git diff`

Make sure you saved the file and are on your `warmup/...` branch:

```bash
git branch --show-current
git status
```

### Push is rejected

First check that you are pushing the correct branch:

```bash
git branch --show-current
git remote -v
```

Then ask the instructor if your GitHub account has access. Do not force-push.

### Tests fail

Read the first `FAIL:` line. Compare your loop bounds, neighbor indices, strict comparison, and handling of arrays shorter than three elements. You may ask a classmate or instructor for a conceptual hint, but do not edit the tests to make them pass.

## Completion checklist

- [ ] Repository cloned and opened in VS Code
- [ ] `warmup/<your-github-username>` branch created
- [ ] `src/warmup.cpp` implemented
- [ ] `make test` passes
- [ ] `git diff` reviewed
- [ ] Commit created
- [ ] Branch pushed to GitHub
- [ ] Pull Request opened into `main`
- [ ] PR description includes test verification
