# Instructor Runbook: GitHub & C++ Environment Warm-Up

This runbook replaces the retired GitHub Classroom flow with a template repository and one collaborator-invited private/public repository per student.

## 1. Configure the template repository

1. Push this repository’s updated files to `AmalChUm/cpp-onboarding-warmup`.
2. On GitHub, open **Settings → General**.
3. If the class policy allows public templates, set the repository visibility to **Public**.
4. Enable **Template repository**.
5. Confirm that `main` contains:
   - `src/warmup.hpp` and `src/warmup.cpp`;
   - `tests/warmup_tests.cpp`;
   - `.github/workflows/warmup_ci.yml`; and
   - the student and instructor documentation.

If repositories must remain private, keep the template private and use an organization-approved provisioning workflow instead. The student flow below assumes each student receives collaborator access to a standalone repository.

## 2. Collect exact GitHub usernames

At the start of the session, collect each student’s exact GitHub username, for example through a one-question Canvas check-in. Save one username per line in a local `students.txt` file. Do not commit that file to this repository.

## 3. Provision one repository per student

Review the script before running it. It creates repositories and sends collaborator invitations, so run it only with the intended `students.txt` and GitHub account.

```bash
#!/usr/bin/env bash
set -euo pipefail

OWNER="AmalChUm"
TEMPLATE="${OWNER}/cpp-onboarding-warmup"

while IFS= read -r STUDENT || [ -n "$STUDENT" ]; do
  STUDENT="$(echo "$STUDENT" | tr -d '[:space:]')"
  [ -z "$STUDENT" ] && continue

  REPO="cpp-onboarding-warmup-${STUDENT}"
  echo "Creating ${OWNER}/${REPO} for ${STUDENT}..."
  gh repo create "${OWNER}/${REPO}" --template "${TEMPLATE}" --public
  gh api -X PUT "/repos/${OWNER}/${REPO}/collaborators/${STUDENT}" \
    -f permission=push --silent
done < students.txt

echo "All warm-up repositories and collaborator invitations sent."
```

If the class requires private repositories, replace `--public` with `--private` and confirm that the owner’s organization permits the intended collaborator access.

## 4. Send students the runbook

Post [`docs/VSCode-Workflow.md`](VSCode-Workflow.md) in Canvas together with the invitation instructions. Students should:

1. accept the collaborator invitation;
2. disable AI extensions if the experimental condition requires it;
3. clone their assigned repository;
4. create `feat/warmup`;
5. implement and test the three functions;
6. push the branch and open a PR into `main`;
7. wait for **Warm-Up CI Check**;
8. merge the PR; and
9. submit the merged PR URL in Canvas.

## 5. Instructor smoke test

Use a test student account or teaching assistant account to verify the complete path:

```bash
git clone https://github.com/AmalChUm/cpp-onboarding-warmup-TEST-USERNAME.git
cd cpp-onboarding-warmup-TEST-USERNAME
git checkout -b feat/warmup
./scripts/check-env.sh
make test
```

The starter tests should compile but fail assertions because the TODO functions return placeholder values. After implementing the functions, `make test` and the GitHub Action should end with:

```text
Warm-up build and tests passed!
```

## 6. Important operational notes

- Do not ask students to fork or push to the template repository.
- The collaborator invite is sent to the exact GitHub username; spelling matters.
- The template’s `.github-classroom.yml` is retained only as a deprecation note and is not used by this workflow.
- The current sandbox is Linux; validate any Windows-specific WSL/MSYS2 setup on a Windows machine before class if Windows students will use local toolchains.
