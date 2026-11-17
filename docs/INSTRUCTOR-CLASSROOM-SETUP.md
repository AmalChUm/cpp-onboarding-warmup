# Instructor: GitHub Classroom Setup

The repository `.github-classroom.yml` is intentionally only a placeholder. Configure the assignment in the GitHub Classroom web interface before distributing the student invitation link.

## Create the assignment

1. Sign in to [GitHub Classroom](https://classroom.github.com/) with the instructor GitHub account.
2. Open the classroom organization for this course, or create/select the appropriate classroom when prompted.
3. Choose **New assignment**.
4. Give it a clear name, such as `cpp-onboarding-warmup`.
5. For the starter code repository, choose **Use an existing repository** and select `AmalChUm/cpp-onboarding-warmup`.
6. Use individual repositories unless the onboarding is intentionally team-based.
7. Keep the assignment repository private if students should only see their own work.
8. Use `main` as the default branch and do not require a deadline unless the course needs one.
9. Add or confirm the visible test/build files from the template repository.
10. Create the assignment and copy the generated invitation URL.

## Student-facing distribution

Give students only the generated Classroom invitation URL. Do not ask them to clone `https://github.com/AmalChUm/cpp-onboarding-warmup` directly. Classroom creates a personal assignment repository from the template; that is the repository where each student has push access and opens the Pull Request.

Before class, test the invitation with a student test account or teaching assistant account:

- accept the invitation;
- confirm a personal repository is created;
- confirm the repository contains `README.md`, `src/`, `tests/`, `scripts/`, `.vscode/`, and `.devcontainer/`;
- confirm the student can create and push a branch; and
- confirm a Pull Request can target that personal repository’s `main` branch.

## Recommended onboarding settings

- **Repository visibility:** Private.
- **Assignment type:** Individual assignment.
- **Starter repository:** `AmalChUm/cpp-onboarding-warmup`.
- **Default branch:** `main`.
- **Autograding:** Optional for this low-stakes warm-up; the visible `make test` and no-make command are sufficient for the workflow practice.
- **Deadline:** Optional; if used, communicate the exact date and time separately from the repository instructions.

## Pre-class smoke test

Use the generated student repository, not the template, and verify:

```bash
./scripts/check-env.sh
make test
```

The starter tests should fail two checks until `src/warmup.cpp` is implemented. After completing the function, the tests should end with `All tests passed.`

GitHub Classroom configuration cannot be represented fully by the placeholder `.github-classroom.yml`; organization membership, assignment settings, and the invitation URL are managed in the GitHub Classroom web interface.
