---
Title: LaTeX/PDF toolchain notes
Topic: latex
Updated: 2026-11-09
Sources: tech_notes (in-place notes, undated)
Raw: [tech_notes/300_tech_notes.qmd](../../tech_notes/300_tech_notes.qmd)
---

# LaTeX/PDF toolchain notes

Pre-Quarto notes (2022–2023) on producing PDFs via LaTeX and pandoc; kept for the vocabulary and troubleshooting recipes.

## Engines, formats, TinyTex

- `tlmgr` controls much of the latex install: fonts, `*.sty`.
- For PDF: pdf2latex, pdflatex — "pandoc will do it, but complain". In R: `tinytex::latexmk()`.
- ENGINE = software (such as **luatex**, tex, pdftex); FORMAT = macros (such as **lualatex**).
- Missing latex `.sty`? With a .tex file run (in R) `tinytex::latemk(*.tex)` to install, or `tlmgr install font`. Fonts installed? `fc-list : family`; also luaotfload (loads fonts).
- (Jan 2022) Missing font/package — TinyTex: update R; `keep_tex: true` in YAML; at the R console `tinytex::lualatex(".... .tex")` or `tinytex::latexmk("*.tex")` — "some times works, sometimes not".
- Lua in a .tex file: see `~/code/publish_project/TEX/`.
- zathura renders PDFs via the open-source poppler library (spelled "popler" in the source).

## TeX history (per the notes)

Original tex was 320 low-level commands (aka primitives); macros are created from these; the actual engine (tex) is hidden from the user. **LuaTex** (engine) is a re-write of the core TEX engine (hard, written in C) that added primitives and is more open — can use tex or lua. **LuaLatex** is a macro package.

## Graphics

"Tikz seems to be most popular way to gaphics vs **pstricks**". **postscript** is a more powerful programming language than tex (pstricks, ghostscript; pdf is a subset of postscript) but using it with latex requires addins (ghostscript, drivers): "Avoid **postscript** and packages pstricks, even if greater capability."

## pandoc and HTML

(pre-Quarto) To produce HTML with pandoc, all latex is IGNORED. The notes call fancy-HTML-from-knitr/pandoc a huge time waste: pandoc "can handle markdown" and "small amounts of latex (math)" — "b/c ppl have added filters or other widgets". "If using Latex, its packages, diagrams with Latex ... must go with PDF." Pandoc flags: `-H header`, `-V or --variable`, `--pdf-engine=xelatex`. Verbatim trick: "Try verbatum; process as a markdown" — pandoc balks at processing straight text if it thinks it sees markdown; if lucky, `!pandoc % -o file.pdf` works.

## See Also

- [Typst-Quarto workflow](../typst/typst-quarto-workflow.md) — the modern replacement path
- [Quarto HTML decoration](../quarto/quarto-html-decorate.md) — pandoc CLI tricks
