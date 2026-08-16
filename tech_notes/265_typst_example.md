# Hello Typst!
jim
2026-08-15

This is a quarto (.qmd) file.\
Embeds raw `typst` (ex: math) and `r` chunks.\
To render: quarto render 265_typst_example.qmd

Note: use of knitr to get most of R, chunks. (optional)

## Simple R (use `{r}`)

``` r
1+2
```

    [1] 3

## Linear Algebra

### with special symbols

### unicode

$$
∀ v, w ∈ V, α ∈ 𝕂: α ⋅ (v + w) = α v + α w
$$

### SVD

A can be any matrix

This renders as PDF. It uses quarto via its built-in typst cli to render
pdf. REF: https://quarto.org/docs/output-formats/typst.html
