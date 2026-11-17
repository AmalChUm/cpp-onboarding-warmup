#!/usr/bin/env bash
set -u

missing=0

check_command() {
    local command_name="$1"
    local install_hint="$2"
    if command -v "$command_name" >/dev/null 2>&1; then
        printf 'PASS: %-8s %s\n' "$command_name" "$($command_name --version 2>&1 | head -n 1)"
    else
        printf 'FAIL: %-8s not found — %s\n' "$command_name" "$install_hint"
        missing=1
    fi
}

printf '%s\n' 'C++ onboarding environment check'
printf '%s\n' '--------------------------------'
check_command git 'install Git from https://git-scm.com/downloads'
check_command g++ 'install a compiler; see docs/VSCode-Workflow.md'
check_command make 'install make, or use the VS Code no-make task'

user_name="$(git config --get user.name 2>/dev/null || true)"
user_email="$(git config --get user.email 2>/dev/null || true)"
if [[ -n "$user_name" ]]; then
    printf 'PASS: git name  %s\n' "$user_name"
else
    printf '%s\n' 'WARN: git name  is not configured (set it before committing)'
fi
if [[ -n "$user_email" ]]; then
    printf 'PASS: git email %s\n' "$user_email"
else
    printf '%s\n' 'WARN: git email is not configured (set it before committing)'
fi

if [[ "$missing" -eq 0 ]]; then
    printf '%s\n' 'Environment check passed. You can continue to the assignment.'
else
    printf '%s\n' 'One or more required commands are missing. Use the setup alternatives in docs/VSCode-Workflow.md.'
    exit 1
fi
