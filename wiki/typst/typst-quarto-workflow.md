---
Title: Typst-Quarto workflow
Topic: typst
Updated: 2026-11-09
Sources: tech_notes (in-place notes, 2026-10-26; 320_main.qmd undated)
Raw: [260_typst_cheat.pdf](../../tech_notes/260_typst_cheat.pdf); [320_main.qmd](../../tech_notes/320_main.qmd)
---

# Typst-Quarto workflow

Decision record from the tail of the typst cheat notes (dated 2026-10-26; the workflow section is dated "last update: 8/30/2026"): how typst content and quarto sources relate, what renders to what, and where files live. The typst syntax of that cheat sheet is compiled in [Typst basics](typst-basics.md).

## Single source of truth

"Generally, use *.qmd* for single source of truth" — the *.qmd* "remains latest version". Since gfm displays better on github, generate the markdown twin with `quarto render <file.qmd> --to gfm`.

## Typst via Quarto, not raw .typ

"(7/26) Decision made NOT to use raw typst files." The easiest route is to embed `{=typst}` chunks in *.qmd* files and render those as quarto files: `quarto render <filename.qmd> --to typst`.

## Render matrix

| From → To | Command | Notes |
| --- | --- | --- |
| .qmd → pdf | `quarto render *.qmd --to typst` | Preferred: a *.qmd* with `format: typst` — "format: typst works better than using latex, lualatex engines". If latex engines are needed, use `format: pdf`. |
| .qmd → html | `quarto render *.qmd --to html` | Use `format: html`; "typst engine does not support html". |
| .typ → pdf / html | the `typst` CLI | "At present use cli **typst**". |
| .typ → markdown | `pandoc file.typ -t markdown -o file.md` | Source flags a PROBLEM: often much cleanup, and lingering typst commands left in the output can badly trip a later quarto render. |
| .md → pdf (wrapper) | `quarto render 320_main.qmd --to typst` | Keep editing plain markdown; render on demand. Source: "PURPOSE:" — "Create/edit files in simple markdown *.md*"; "When need pdf, run this file." ("Not perfect, but simple"). The wrapper embeds the md verbatim: `#let t = read("322_LLM_agents_NOTES.md")` + `#raw(t, block: true)`. |

## Where files live (tech_notes layout, at 8/26)

- `tech_notes/` — most *.qmd* files, with or without embedded typst.
- `tech_notes/typst-quarto/` — typst content inside *.qmd* files: math, typst NOTES, experiments, templates.
- `docs/` — specially saved rendered files (normally render output lands in the same directory as the source).
- `qmd/`, `typst/` — older files, marked TODO prune/review; the older .typ files "should be embedded in *.qmd".
- Outside the notes tree: `~/code/publish-project` — not for NOTES, but "final" or "wip" workproduct.

Templates follow the import pattern: "This is main 905_use_template.qmd. It imports the template template.typ" (the `apply-template` show-rule usage is in [Typst basics](typst-basics.md)).

## See Also

- [Typst basics](typst-basics.md) — typst syntax from the same cheat family
- [Quarto HTML decoration (SCSS, callouts, chunk classes)](../quarto/quarto-html-decorate.md) — html-side decoration and publishing
- [Typst diagrams and a computational graph](typst-diagrams.md) — Fletcher diagrams, Graphviz `dot` alternative
