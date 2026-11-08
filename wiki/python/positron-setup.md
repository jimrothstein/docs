---
Title: Positron Setup and Skills
Topic: python
Updated: 2026-11-08
Sources: tech_notes (in-place notes, undated)
Raw: [450_python_NOTES.qmd](../../tech_notes/450_python_NOTES.qmd)
---

# Positron Setup and Skills

Where the Positron editor keeps its configuration, and where Positron-assistant skills live at user and project level (project level overrides user level).

## Configuration paths

- `~/.positron/extensions/` and `argv.json`
- `~/.posit/` containing `ai/` and `assistant/`
- `~/.config/Positron/User/settings.json`

## Positron skills (posit-dev)

Source: <https://github.com/posit-dev/skills> (posit-dev, open-source, r-lib, shiny, quarto).

User-level:

- `~/.posit/assistant/skills/<skill-name>/SKILL.md`
- `~/.agents/skills/<skill-name>/SKILL.md`

Project-level (overrides user-level):

- `.posit/assistant/skills/<skill-name>/SKILL.md`
- `.agents/skills/<skill-name>/SKILL.md`

## See Also

- [Python data packages](python-data-packages.md)
