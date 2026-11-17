---
Title: Typst diagrams and a computational graph
Topic: typst
Updated: 2026-11-09
Sources: tech_notes (in-place notes, undated)
Raw: [312_computational_graph.qmd](../../tech_notes/312_computational_graph.qmd)
---

# Typst diagrams and a computational graph

Drawing node-and-edge diagrams (a computational graph for `f(x, y) = (x + y)y`) with Typst: the Fletcher package for positioned diagrams, math-mode `#diagram` shorthand, and Graphviz `dot` as an alternative — ending with the forward/backward passes of the example.

## Fletcher: nodes and edges

Import (version pinned in the source):

```typst
#import "@preview/fletcher:0.5.8": diagram, node, edge
// or: #import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
```

Diagram-wide options: `node-stroke: 0.8pt`, `node-fill: rgb("f9f9f9")`, `spacing: (15mm, 10mm)` (column gap, row gap), and `debug: true` to "show a coordinate grid".

Nodes take a position, content, and options:

- `node((0, 0), $x$, radius: 5mm)`
- Named nodes for edge targets: `node((1.5, 0.5), $times$, radius: 6mm, name: <mul1>)`
- Styling per node: `fill: rgb("e6f2ff")`, `stroke: blue + 1pt`, `stroke: none, fill: none` (for a bare output label), `shape: rect`

Edges connect coordinates or names:

- `edge((0, 0), <mul1>, "->")`
- Labels: `edge(<mul2>, <add>, "->", label: $w_2 y$, label-pos: 0.4, label-side: right)` (also `label-pos: 0.5, label-side: auto`)

Comments: `/* a long comment */`. The source notes "Use backslash to linebreak" (a trailing `\`).

## Bidirectional edges

"practice (need A <--- B)": draw both directions with opposite shifts so the arrows do not overlap:

```typst
#diagram({
  node((0, 0), [A], name: <A>)
  node((4, 0), [B], name: <B>)

  edge(<A>, <B>, "->", shift: 3pt)
  edge(<A>, <B>, "<-", shift: -3pt)
})
```

## Math-mode diagrams

Shorthand inside math mode, with `cell-size: 15mm` and edge decorations:

```typst
#diagram(cell-size: 15mm, $
  G edge(f, ->) edge("d", pi, ->>) & im(f) \
  G slash ker(f) edge("ur", tilde(f), "hook-->")
$)
```

Decoration examples in the source: `"wave"`, `"zigzag"`, `"coil"`, `"->>"`, `"hook-->"`, directions `"d"`, `"ur"`; multiple `&` columns (`alpha &&& omega`).

## Vertical space and a figure

`#v(1cm)` adds vertical space between two lines. The simple (non-Fletcher) figure uses `#figure(stack(dir: ltr, spacing: 0.5em, "(input)  x", text(2em, sym.arrow.long), rect[w+3], ..., rect[v=w^2], ...))` with `caption: [Tags enable PDF accessibility]`.

## typ file or quarto?

The source's own call, in an orange `#block(fill: rgb("f58025"), inset: 14pt, width: 100%)`: "Can use typ file, but then use `typst` ecosystem to render, quarto approach simpler".

## Worked example: the graph for f(x, y) = (x + y)y

The function: `f(x, y) = (x + y)y`. A Graphviz `{dot}` chunk draws it as an alternative to Typst: `digraph computation_graph` with `graph [rankdir = LR, bgcolor = "transparent", nodesep = 0.45, ranksep = 0.7]`, circle nodes `fillcolor = "#EAF2FF"`, `color = "#3B6EA5"`, edges `color = "#4A5568"`; wiring `x -> add; y -> add; add -> mul; y -> mul; mul -> f`.

The forward computation introduces an intermediate value (using `#import "@preview/diverential:0.3.0": *` — spelled "diverential" in the source):

$$u = x + y, \quad f = u\,y$$

For the reverse pass: `dvp(f,u) = y`, and by the chain rule

$$\frac{\dif f}{\dif x} = \frac{\dif f}{\dif u}\frac{\dif u}{\dif x} = y$$

The variable y occurs along two paths, so its contributions add:

$$\frac{\dif f}{\dif y} = \underbrace{\frac{\dif f}{\dif y}}_{\text{direct path}} + \underbrace{\frac{\dif f}{\dif u}\frac{\dif u}{\dif y}}_{\text{through } u} = u + y = x + 2y$$

## See Also

- [Typst basics](typst-basics.md)
- [Typst-Quarto workflow](typst-quarto-workflow.md)
- [Typst math and drawing basics](typst-math-drawing.md) — equation numbering, symbol vs unicode math, polygons/rects, `#table`
