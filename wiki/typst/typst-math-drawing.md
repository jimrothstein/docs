---
Title: Typst math and drawing basics
Topic: typst
Updated: 2026-11-09
Sources: tech_notes (in-place notes, undated)
Raw: [400_simple_MATH_notes.qmd](../../tech_notes/400_simple_MATH_notes.qmd)
---

# Typst math and drawing basics

Beginner experiments from the math notes: math-equation syntax, simple shape drawing, and tables. The file renders with Quarto's built-in typst CLI — it "renders as PDF" and "uses quarto via its built-in typst cli to render pdf." (REF: <https://quarto.org/docs/output-formats/typst.html>; see Typst-Quarto workflow).

## Math equations

Turn on equation numbering:

```typst
#set math.equation(numbering: "(1)")
```

Symbol-mode vs unicode — the same linear-algebra statement written both ways. Symbols: `forall v, w in V, alpha in KK: alpha dot (v + w) = alpha v + alpha w`. Unicode, pasted directly: `∀ v, w ∈ V, α ∈ 𝕂: α ⋅ (v + w) = α v + α w`.

Indexed sequences: `$i_1, i_2, dots, i_n$ \` and `$f_1, f_2, dots, f_n$` — `dots` inside math mode produces the ellipsis.

SVD shorthand — "A can be any matrix":

```typst
$A = U Sigma V$
```

## Drawing shapes

- Rectangle with a lightened fill: `#rect( fill: blue.lighten(80%))[ This is a rectangle ]`
- Polygon with stroke: `fill: blue.lighten(80%)`, `stroke: red`, points `(20%, 0pt)`, `(60%, 0pt)`, `(80%, 2cm)`, `(0%, 2cm)`.
- Rounded small rect: `#rect(radius: 15%, height: 15%, width: 10%, fill: yellow)`.
- Regular polygon: `#polygon.regular(vertices: 4)`; a "tiny triangle" from three points `(0pt, 0pt)`, `(10pt, 10pt)`, `(0pt, 10pt)` (fill blue, stroke red).

Polygon points: "Each polygon point is an (x, y) pair of relative lengths. So besides percentages, you can use absolute Typst lengths—such as pt, mm, cm, in, or em—and you can mix them". The origin (0,0) sits at the upper left; the note reads "positive x is then down" (sic — the y axis runs downward).

## Tables and variables

```typst
#let jr = [jim]

The variable 'jr' holds value #jr

#table(
  columns: (1fr, 1fr),
  [variable], [Typst],
  [jr], jr,
)
```

A `#let` variable holds content, can be dropped into running text, and can fill a table cell.

## Already covered elsewhere

The source also rehearses material compiled in earlier articles — listed here as pointers, not repeated:

- Functions ("Functions begin with pound", "Followed by args (in parenthesis) and content in square brackets", `#lorem(20)`), the "All that markup is just a #emph[syntax sugar] over functions!" list, `#text`, `#link` — Typst basics (Functions; Lists and loops).
- Quote block `#quote(block: true)[...]`, show rules (`#show emph: set text(blue)`, `#show "typst": set text(orange)`), box with stroke/inset — Typst basics (Show rules; Blocks, boxes, shapes).
- Fletcher import `#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge`, math-mode `#diagram(cell-size: 15mm, ...)` with `edge("d", pi, ->>)` / `edge("ur", tilde(f), "hook-->")`, the quotient example `G slash ker(f)` and `im(f)`, plus the block note "Can use typ file, but then use `typst` ecosystem to render" (here `fill: silver, inset: 14pt, width: 100%` with `#set align(center)`) — Typst diagrams and a computational graph. A commented-out `#bibliography("math.bib", style: "chicago-author-date", title: [References])` line hints at citations, not yet used.

## See Also

- [Typst math packages](typst-math-packages.md) — noteworthy/physica templates, cetz-plot, diverential, LLM-to-typst workflow
- [Typst basics](typst-basics.md)
- [Typst diagrams and a computational graph](typst-diagrams.md)
- [Typst-Quarto workflow](typst-quarto-workflow.md)
