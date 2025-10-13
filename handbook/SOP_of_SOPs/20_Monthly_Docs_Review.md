# 20 — Monthly Docs Review

**Purpose:** Keep SOPs accurate and trusted.  
**Cadence:** Monthly.  
**Run location:** From `khata_punji` for multi-repo loops; edit within each target repo PR.

## Steps
1. Refresh working clones:
   ```bash
   ./scripts/refresh_local_clones.sh
   ```
2. For each repo, review and update:
   - `docs/SOPs/10_Workflow_SRO.md`
   - `docs/SOPs/20_Release_Checklist.md`
   - Set **Last Reviewed** to today’s date.
   - Open a PR from branch `docs/monthly-review-YYYYMM`.
3. Update central: `handbook/Repos/<repo>.md` → **Owners** & **Last full review**.

## Review checklist
- [ ] Links resolve (GitHub paths / external resources)  
- [ ] Owners/roles are current  
- [ ] Rollback/Recovery is actionable  
- [ ] References point to real files/boards/scripts
