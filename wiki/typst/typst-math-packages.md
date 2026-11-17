---
Title: Typst math packages
Topic: typst
Updated: 2026-11-09
Sources: tech_notes (in-place notes, undated)
Raw: [410_MATH_notes.qmd](../../tech_notes/410_MATH_notes.qmd)
---

# Typst math packages

Package and template machinery from the math notes: theorem environments, document templates, function plotting, and an LLM-assisted typst workflow. The math itself lives in Math and statistics notes.

## Template setup with noteworthy and physica

```typst
#import "@preview/noteworthy:0.2.0": *
#import "@preview/physica:0.9.8": *
```

A full document template via `#show: noteworthy.with(...)`:

```typst
#show: noteworthy.with(
  paper-size: "a4",
  font: "New Computer Modern",
  language: "EN",
  title: "Title of The Document",
  author: "Your Name",
  contact-details: "https://example.com", // Optional
  toc-title: "Table of Contents",
  watermark: "DRAFT", // Optional
)
```

Standard preamble on top of it:

```typst
#set document(title: "0002_math_equations")
#set page(margin: 0.5in)
#set text(size: 11pt)
#set heading(numbering: "1.")
#outline(depth: 3)
```

## Theorem-style environments

noteworthy provides block environments used throughout the notes:

```typst
#definition[
  a prime number has two divisors, 1 and itself.
]

#example[
  3,5,7
]
```

## Math syntax odds and ends

- Inline products: "a*b  (no spaces around *)" (comment in the source).
- Subscripts on symbols: `A#sub(long_subscript)`; on vectors: `vec(1,0)#sub("old")`.
- Matrix dot vector: `mat(3,4,5) #sym.dot.op vec(x,y,z)`.
- Blackboard/alphabet variants: `bb(A), AA, bb(1)`; script letters `cal(F)`, `cal(P)`; set membership `alpha in KK`.
- Piecewise: `cases(-x, "if " x < 0, 0, "if " x = 0, x, "if " x > 0)`.
- Differentials: `dif x` (e.g. `integral_0^infinity e^(-x^2) dif x`); gradient: `gradient f`.
- diverential package for derivatives evaluated at a point: `#import "@preview/diverential:0.2.0": *` then `$vec(dv(f,x, eval:0),(dv(f,y, eval:0)))$` = `vec(-7,7)`.
- Jacobian in concise form: `J_(bold(f))(bold(v)) = (frac(partial f_i, partial v_j))_(i,j=1)^n` for `bold(f): RR^n arrow RR^n`.

## Plotting functions with cetz

```typst
#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.3": plot

#cetz.canvas({
  let range = (-3, 3)
  plot.plot(
    size: (6, 4),
    x-tick-step: 1,
    y-tick-step: 1,
    {
      plot.add(domain: range, x => x - 1,  style: (stroke: blue))
      plot.add(domain: range, x => -x - 1, style: (stroke: red))
    }
  )
})
```

The two plotted lines (`y = x - 1`, `y = -x - 1`) come from the conic factoring example in Math and statistics notes.

## LLM to typst (Google Colab)

The notes generate typst documents with Colab's built-in AI:

```python
from google.colab import ai
ai.list_models()
response = ai.generate_text("Explain integral domain in algebra, give simple example.   Output should be in typst format")
print(response)
```

The model's answer came back as a complete typst document — "You can save the code below with a `.typ` extension (e.g., `integral_domain.typ`) and compile it using the Typst compiler." Its preamble/style choices, useful as a template:

```typst
#set page(paper: "a4", margin: (x: 2cm, y: 2.5cm))
#set text(font: "Liberation Serif", size: 11pt)
#set par(justify: true)

#align(center)[
  #text(size: 18pt, weight: "bold")[Integral Domains in Algebra]
]
```

plus a highlighted takeaway box:

```typst
#block(
  fill: rgb("f0f8ff"),
  inset: 12pt,
  radius: 4pt,
  stroke: 0.5pt + rgb("b0c4de"),
  [ ... ]
)
```

## See Also

- [Math and statistics notes](../math/math-statistics-notes.md) — same source file
- [Typst math and drawing basics](typst-math-drawing.md)
- [Typst basics](typst-basics.md)
- [Typst-Quarto workflow](typst-quarto-workflow.md)
