---
Title: Quarto HTML decoration (SCSS, callouts, chunk classes)
Topic: quarto
Updated: 2026-11-09
Sources: tech_notes (in-place notes, undated)
Raw: [250_quarto_knitr_SCSS_NOTES.qmd](../../tech_notes/250_quarto_knitr_SCSS_NOTES.qmd)
---

# Quarto HTML decoration (SCSS, callouts, chunk classes)

The source's stated purpose: "Collect misc stuff related to quarto and HTML" — quarto, css/SCSS, revealjs, HTML. Markdown alone "does NOT offer all tools (ex: change color)"; best to avoid direct HTML insertion and use SCSS classes, fenced divs, chunk classes, and callouts instead.

## HTML format YAML used by the source

```yaml
format:
    html:
        code-fold: true
        code-summary: "See Code"
        toc: true
        toc-depth: 4
        toc_float: true
        number-sections: true
        html-math-method: katex
        scss: custom.scss
        embed-resources: true ## if standalone, all 1 file
        code-block-bg: true            # chunk outputs
        code-block-border-left: "#31BAE9"
        indent: true
        code-link: true             # hyperlink R functions
        reference-location: margin
output-dir: docs            ## NO indent, also _quarto.yml for entier project
```

Execute options: `error: true` ("include errors in output"), `warning: true`, `collapse: true`.

## Config precedence and div basics

- "Quarto looks to \_quarto.yml in current dir, then in parent dir." — "This takes dominance over any scsc file in yaml in the .qmd file." "(check !!)"
- "`div` means container"; "`::: blocks` are called *fences*" — they comply to a div; `::::{.X}` and `::::{X}` are the same when X is defined in CSS/SCSS.
- Also: `format: revealjs` "works, but only one format: at a time (?)"; for slides choose presentation when creating the document (in RStudio) or `quarto` CLI project creation.

## SCSS: what goes where and how it is applied

In an SCSS file there are: tags (`h1 { ... }`), classes (`.important { ... }`), ids (`#title { ... }`). Once defined, apply it in the .qmd:

- chunk option: `#| class-output: myclass`
- text span: `[render this text]{.highlight}`
- div: `::: {.border} text :::`
- markdown underline: `<u>this is underline</u>` or `::: {.underline}`

Chunk boxing with `class-source` / `class-output` (define `.custombox_*` in SCSS); the notes flag "class-source not working". The old vs new chunk style: OLD `{r style="xxx"; class=""}`, NEW `` {r .name} `` where .name is defined in .CSS or .SCSS. Bootstrap helper classes work too: `class.source="bg-danger", class.output="bg-warning"`, `class.source="bg-success"` (keep data frames with `drop = FALSE`).

SCSS mixins example (labeled "not working" in the notes): `@mixin absolute-center()` with `@include absolute-center();` in `.element-1`/`.element-2`; plus `@mixin square($size)` used as `@include square(60px)`.

Quarto docs on Sass theming: theme files define variables that globally set things like colors and fonts, plus rules for "more fine grained" behavior; to customize an existing Bootstrap theme, provide the base theme and then the custom theme file(s).

CSS units: ".em - height of entire metal type block, not the character alone."; ".rem - size relative to the HTML root tag (\~ 16 px)".

## Callouts, asides, conditional content

Five callout types: `note`, `warning`, `important`, `tip`, and `caution`. Options: title (`title="References, click to expand"`), collapse (`collapse="true"` folded by default, `collapse="false"` collapsible but expanded). Conditional rendering: `::: {.content-visible when-format="html"}` / `when-format="pdf"`. Asides: `::: aside`; hidden blocks: `::: hidden` (or `{.hidden}`). Two columns: `:::::: columns` with `::: {.column width="70%"}` / an empty 10% gap column / 20%.

Chunk options shown: `#| label: example`, `#| code-line-numbers: "|5|6"`, `#| echo: fenced` ("shows these options in output").

## Colored text via knitr (rmarkdown cookbook 5.1)

```r
col = function(text, color){
    if (knitr::is_html_output()) {
        sprintf("<span style='color:%s'> %s </span>", color, text )
    }
}
```

Used inline as `` `r col("Is this red", "red")` ``. Inline styling alternative: spans like `[red]{style="color: red;"}` and `[this line has a yellow background]{style="background-color: yellow"}`; in-file `<style>` blocks can define classes (.myDiv, .blackbox, .greybox, .center) applied via `::: myColor` or header attributes `{.myColor}`.

## Publish a .qmd to connect.posit.cloud

- Copy the desired *.qmd to the folder; run `rsconnect::writeManifest()`; check the resulting manifest.json "is not bloated with excessive packages/dependencies"; commit/push.
- On <https://connect.posit.cloud/jimrothstein>: `Publish` → choose Github, the folder, which *.qmd file.

## Pandoc-only CLI tricks

- `pandoc -D latex` / `pandoc -D html` dump templates; templates look like `$var$` or `$IF$`.
- Trick: "Regardless of content, place 3 back ticks at top/bottom will render document as straight text."
- Small-font ASCII for printing: `\footnotesize` at very top, then `pandoc -f markdown -o out.pdf <file>` or `pandoc -f markdown -V geometry:margin=2cm -o out.pdf <file>`; or `quarto render <file> --to gfm --output <output_file.md>`.

## Related escapes from markdown's limits

- LaTeX embedding: via video tutorial, `quarto extensions` (format: my_extension), or R packages like gt.
- "OR, typst (since 2022) - simpler than latex" — see the Typst basics article.
- Interactive: "javascript widgets or **Shiny**"; to fiddle with code in the browser, use **WebR**.

## See Also

- [Typst basics](../typst/typst-basics.md) — typst-in-quarto chunks as the "simpler than latex" route
- [Positron setup and skills](../python/positron-setup.md) — related Posit tooling config
- [Typst-Quarto workflow](../typst/typst-quarto-workflow.md) — render-target decisions (typst/pdf/html/gfm) and where files live
