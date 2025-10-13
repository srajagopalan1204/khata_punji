#!/usr/bin/env bash
set -euo pipefail
OWNER="srajagopalan1204"
LIST="scripts/repos.txt"
DEST="$HOME/repo-mirrors"   # Change this to your backup location (e.g., mounted drive)

mkdir -p "$DEST"
while read -r r; do
  [ -z "$r" ] && continue
  d="${DEST}/${r}.git"
  if [ -d "$d" ]; then
    echo "Updating mirror: ${r}"
    git -C "$d" remote update --prune
  else
    echo "Creating mirror: ${r}"
    git clone --mirror "https://github.com/${OWNER}/${r}.git" "$d"
  fi
done < "$LIST"
echo "Mirrors up to date at: $DEST"
