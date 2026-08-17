# Plan: Find easy duplicates in mp3_downloads

**Date:** 2026-08-16
**Directory:** `/home/jim/mp3_downloads` (~5092 files, mostly `.ogg`, some `.mp3`/`.m4a`/`.ogx`)

## Goal
Find "easy" duplicate audio files — same song downloaded multiple times. Not all duplicates, only cheap ones.

## Definition of a duplicate (agreed)
- Same **canonical song name** (after normalization) **AND**
- **Byte-identical file size** (exact-size only — conservative, near-zero false positives)

## Steps

### Step 1 — Normalize filenames (in-memory, cheap)
For each file build a canonical key:
- lowercase
- strip extension (also handles copies that lost their extension, e.g. `Mush_Mouth_08Sep2020` with no `.ogg`)
- strip trailing batch-date suffixes (`_08Sep2020`, `_2021-12-13_`, `_15Feb2026`, `_08Jul2023`, `_02Feb2022`, ...)
- collapse separators (`_`, `-`, `.`, spaces) so `ABBE_LANE_&_XAVIER...` ≡ `ABBE LANE & XAVIER...`

### Step 2 — Group by (canonical name, exact byte size)
- Groups with ≥2 files are duplicate clusters (~341 files by initial probe)
- Handles double extensions (`.wmv_...`, `.mp4_...` embedded in names)

### Step 3 — Verify each cluster with content hash (cheap)
- MD5 only the candidate files (~341 of 5092), not the whole library
- Report only groups whose hashes actually match, so a size collision never produces a false duplicate

### Step 4 — Write report
- `duplicate_report.md` in the project root listing each cluster: file paths, byte sizes, mtimes, hash match status
- No files deleted, no files moved

## Housekeeping
- Init git in `/home/jim/mp3_downloads`, commit pre-report baseline
- Create `project.md` symlink → `~/dotfiles/opencode/projects/`
- Record plan/decisions in `project.md`
- Commit report + `project.md` at end

## Non-goals
- No deletion/moving of files (report only)
- No fuzzy name matching (fuzzy = expensive, more false positives)
- No size tolerance above 0% (exact byte size only)