# 00 — Repository Docs Layout (Applies to Every Repo)

**Purpose:** Keep SOPs consistent in every project repo and in the central index.  
**Run location:** Commands are run from the root of **`khata_punji`** unless noted.

## Per-repo structure
```
/docs/
  SOPs/
    00_Index.md
    10_Workflow_SRO.md
    20_Release_Checklist.md
  HOWTOs/
  Playbooks/
README.md  → link to docs/SOPs/00_Index.md
```

## Central index (hub)
```
khata_punji/
  handbook/
    Index.md
    Repos/
      <repo>.md  → links to that repo’s SOPs
```

## Naming
- SOP files: prefix with numbers (`00_`, `10_`, `20_`) so they sort.
- One repo per line in `khata_punji/scripts/repos.txt`.
