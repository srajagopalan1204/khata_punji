# 10 — Scaffold & PRs (Create/Refresh SOPs Across Repos)

**Purpose:** Create or refresh SOP files in every target repo and open PRs automatically.  
**Run location:** From the root of **`khata_punji`**.

## One-time auth setup (per machine/Codespace)
```bash
unset GITHUB_TOKEN GH_TOKEN
gh auth login            # GitHub.com → HTTPS → device login
gh auth setup-git
git config --global user.name  "Your Name"
git config --global user.email "you@example.com"
```

## Run the scaffold
```bash
./scripts/scaffold_sops.sh
```
- Opens PR `chore/sop-scaffold` as needed.
- Repos with "No changes" already had the structure.

## Merge the PRs
**Web:** open each PR and click **Merge pull request**  
**CLI (batch):**
```bash
while read -r r; do
  [ -z "$r" ] && continue
  if gh pr view -R "srajagopalan1204/$r" "chore/sop-scaffold" &>/dev/null; then
    gh pr merge -R "srajagopalan1204/$r" "chore/sop-scaffold" --merge --delete-branch || echo "merge skipped: $r"
  fi
done < scripts/repos.txt
```

## Refresh local working clones (optional tidy)
```bash
./scripts/refresh_local_clones.sh
```

## Update the central handbook index
- Re-generate or append entries in `handbook/Repos/*.md` and links in `handbook/Index.md` (you already have a loop for this).

## Troubleshooting
- **Auth issues**:  
  ```bash
  unset GITHUB_TOKEN GH_TOKEN
  gh auth login && gh auth setup-git
  ```
- **Non-fast-forward push**:  
  ```bash
  git fetch origin && git rebase origin/main && git push
  ```
