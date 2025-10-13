# 30 — Backups / Mirror Clones

**Purpose:** Maintain offsite mirrors of all repos.  
**Method:** `git clone --mirror` with periodic `git remote update --prune`.  
**Run location:** Wherever you keep backups. Script lives in `khata_punji/scripts/`.

## Script
See `scripts/mirror_all.sh` in this bundle. Configure `DEST` to a backed-up drive.

## Cadence
- Run monthly (or weekly) and verify mirror timestamps.
