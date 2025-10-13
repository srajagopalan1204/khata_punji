#!/usr/bin/env bash
set -euo pipefail

OWNER="srajagopalan1204"
REPOLIST="scripts/repos.txt"
WORKDIR="_scaffold_work"

while read -r r; do
  [ -z "$r" ] && continue
  dir="${WORKDIR}/${r}"

  echo "== ${r} =="

  if [ ! -d "${dir}/.git" ]; then
    echo "  not found locally, cloning..."
    git clone "https://github.com/${OWNER}/${r}.git" "${dir}" || { echo "  clone failed"; continue; }
  fi

  default_branch="$(gh repo view "${OWNER}/${r}" --json defaultBranchRef -q .defaultBranchRef.name 2>/dev/null || echo main)"

  git -C "$dir" fetch origin || { echo "  fetch failed"; continue; }
  if git -C "$dir" rev-parse --verify "$default_branch" >/dev/null 2>&1; then
    git -C "$dir" checkout "$default_branch"
  else
    git -C "$dir" checkout -b "$default_branch" "origin/$default_branch" || git -C "$dir" checkout "$default_branch"
  fi

  git -C "$dir" pull --rebase origin "$default_branch" || {
    echo "  rebase had conflicts; using merge instead"
    git -C "$dir" pull --no-rebase origin "$default_branch" || echo "  pull failed"
  }
done < "$REPOLIST"

echo "Done."
