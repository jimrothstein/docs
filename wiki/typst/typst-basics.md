---
Title: Typst basics
Topic: typst
Updated: 2026-11-09
Sources: tech_notes (in-place notes, undated)
Raw: [120_simple_typst_cheat.qmd](../../tech_notes/120_simple_typst_cheat.qmd)
---

# Typst basics

The source is a mixed Quarto/Typst cheatsheet ("*.qmd file to show Mixed quarto/typst features." — "Includes quarto div, html tricks (legacy)"); its header even carries the title "260_typst_cheat.qmd". Render with `quarto render 260_typst_cheat.qmd --to typst`; "See pdf for rendered snippets". Typst code is embedded in Quarto via ```{=typst} chunks. One chunk notes a real executable example: the `{r}` chunk computes `x*y` ("R Code does execute ??"), while a `{bash}` chunk is labeled "Bash does not work".

## Page and text setup

```typ
#set heading(numbering: "1.")
#set page(
  paper: "us-letter",
  margin: (x: 0.5cm, y: 0.5cm),
)
#set text(
  font: "New Computer Modern",
  size: 15pt,
  fill: black   // gray is too light
)
#outline()
```

The notes comment: "10 is small 15pt is a better!" A template can be applied instead:

```typst
#import "template.typ": apply-template
#show: apply-template.with(name: "Jim's Report")
```

This is the same pattern as 905_use_template.qmd — "This is main 905_use_template.qmd." — "It imports the template template.typ". A label reference `@theTop` is flagged in the notes: "Hmmm, doesn't link to Top".

## Paragraph spacing

Double-space with `#set par(leading: 1.5em, justify: false, spacing: 2.5em)`; reset to default with `leading: 0.65em` (same `spacing: 2.5em`). Line numbering on paragraphs: `#set par.line(numbering: "1.")`, off with `none`.

## Show rules

- Emphasis mapping: "emph is italics, strong is bold".
- Style "math"/"Maths" bold: `#show regex("[Mm]aths?"): it => strong(it)`.
- Heading colors by level: `#show heading.where(level: 2): set text(red)`, level 3 `blue`; reset with `#show heading: set text(black)`.
- Underline all links: `#show link: underline`; e.g. `#link("https://nytimes.com")[the NY Times]`.
- Monospace raw: `#show raw: set text(font: "JetBrains Mono")`; reset block raw to normal size but keep inline raw smaller: `#show raw.where(block: true): set text(1em / 0.8)`.
- Small caps: `#show "project": smallcaps`.
- String rewrite: `#show "XX": text(green)[I am green]`.

## String vs content, types

Content (with markup, can carry styling) is the default; a quoted string (`#"This is not content"`) is raw with no styling. Primitives: none/boolean/float/string; measurements like `2pt`, `10deg`, `2fr`, ratio, colors. Variables can hold any of it:

```typ
#let blind-text = [_Lorem ipsum_ dolor sit amet]  // content
#let funny-font = "MS Comic Sans"                 // string
#let mile = 160934cm                              // absolute length
#let double-space = 2em                           // relative to font size
#let progress = 80%                               // ratio
#let answer = 42                                  // integer
#let truth = false                                // boolean
#let focus = center                               // alignment
```

## Functions

```typ
#let f(name) = "Hello, " + name     // arrow form equivalent: #let f = (name) => "Hello, " + name
#let f(name) = [Hello, #name]       // content argument with []
#let f(name: "no name") = [Hello, #name!]  // default args
```

## Lists and loops

- `#list([A], [B])`; numbered `#enum(start: 2)[A][B]`.
- Custom markers: `#set list(marker: ([•], [--],[+]))` or `#set list(marker: [>])`.
- For loop builds a list: `#for x in "ABC" [- Letter #x]`.
- Term list syntax: `/ *A*: A is ...`.

## Blocks, boxes, shapes

- Info block function: `#let info(body) = block(stroke: (2.5pt + blue), fill: aqua.lighten(50%), ...)` with a divider adding `spacing: 1.8em`.
- Alert function: `#let alert(body, fill: red)` wrapping a `rect(fill: fill, inset: 8pt, radius: 4pt)`.
- Quote block: `#set quote(block: true, attribution: [Typst Examples Book])`.
- Shapes: `#rect(width: 100%, height: 2cm, place(horizon + right, square()))`, `#circle(radius: 50pt, place(horizon + center, circle(circle(fill: blue))))` for concentric circles.
- Symbols with variants: the notes define an `envelope` symbol via `#let envelope = symbol("🖂", ("stamped", ...), ("stamped.pen", ...), ("lightning", ...), ("fly", ...))`; variants accessed as `#envelope.stamped`, `#envelope.stamped.pen`, `#envelope.lightning`, `#envelope.fly`.

## Reading files

```typ
#let t = read("README.md")
#raw(t, block: true)
```

## See Also

- [Simple CLI cheat sheet](../tools/simple-cli-cheatsheet.md) — pandoc md→pdf via typst; the `read()` pattern in use
- [Typst-Quarto workflow](typst-quarto-workflow.md) — .qmd as single source of truth, `{=typst}` over raw .typ, render matrix, where files live
- [Typst diagrams and a computational graph](typst-diagrams.md) — Fletcher `diagram`/`node`/`edge`, math-mode diagrams, chain-rule worked example
- [Typst math and drawing basics](typst-math-drawing.md) — equation numbering, symbol vs unicode math, polygons/rects, `#table`
