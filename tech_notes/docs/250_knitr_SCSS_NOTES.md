# 250_quarto_cheat.qmd
JR
2025-01-10

Note: use of `class-source` and `class-output`, define .custombox\_\* in
SCSS class-source not working.

``` r
x=1
y = x +2
y
```

``` custombox_yellow
[1] 3
```

``` r
x=1
y = x +2
y
```

``` custombox_white
[1] 3
```

``` r
x=1
y = x +2
y
```

    [1] 3

``` r
#| code-fold: true
#| code-summmary: Show code.

Show me
```

## Preliminaries

> [!NONE]
>
> KEEP as QUARTO .qmd file (to learn to decorate) RStudio also - easy to
> post completed quarto to Posit Cloud

### REF

> [!TIP]
>
> ### References, click to expand
>
> - Mimi - quarto, some CSS, SCSS (see her actual code):
>   https://mine-cetinkaya-rundel.github.io/quarto-tip-a-day/  
> - Themes, SASS: https://quartoand.me/front-end  
> - SASS R pkg:
>   https://cran.r-project.org/web/packages/sass/vignettes/sass.html  
> - Quarto Themes + modify with SCSS:
>   https://quarto.org/docs/output-formats/html-themes.html#basic-options
>    

“Sass theme files can define both variables that globally set things
like colors and fonts, as well as rules that define more fine grained
behavior. To customize an existing Bootstrap theme with your own set of
variables and/or rules, just provide the base theme and then your custom
theme file(s):”

    PURPOSE: Collect misc stuff related to quarto and HTML

    - quarto 
    - css, SCSS
    - revealjs   (SEE:  examples in code_publish)
    - HTML

## Pandoc only (cli) - pdf,

To render ascii document with small font (for printing):

- in <file>, use \`\`\` for verbatum
- very top:
- pandoc -f markdown -o out.pdf <file>
- pandoc -f markdown -V geometry:margin=2cm -o out.pdf <file>
- quarto render <file> –to gfm –output \<output_file.md\>

## Pandoc only (cli) - html, embed :::small-font (need SCSS)

- need example, not tried yet

### Why use Rstudio?

- Visual Mode = menu driven, simplifies decorattion
- Renders automatically.

## Quarto - basics

markdown does NOT offer all tools (ex: change color) best to avoid
direct HTML insertion, use tools:

- knitr:: can be useful functions:
  <https://cran.r-project.org/web/packages/knitr/knitr.pdf>

- rmarkdown cookbook: <https://bookdown.org/yihui/rmarkdown-cookbook>

- markdown:: adds to rmarkdown: <link>

- Mimi: videos

- Pandoc’s version of markdown: <link>

- Bootstrap: predefined SEE getbootstrap.com css help-classes

### quarto examples

SEE namespace file

### Run quarto (CLI) create project to create any quarto project, including slides with revealjs.

For revealjs, choose presentation when create document (in Rstudio)

### Quarto - markup, callouts

<u>underline text, where defined?</u>

<span class="border">text with border, defined?</span>

### Create a footnote:

Need footnote one here: [^1]

------------------------------------------------------------------------

<!-- Call out examples -->

## Call out examples

REF: https://quarto.org/docs/authoring/callouts.html

### .callout-note

> [!NOTE]
>
> This is .callout-note:  
> Note that there are five types of callouts, including: `note`,
> `warning`, `important`, `tip`, and `caution`.

### .callout-tip

> [!TIP]
>
> This is an example of a callout with a title.

### .callout-caution, collapse

> [!CAUTION]
>
> Expand To Learn About Collapse
>
> This is an example of a ‘folded’ caution callout that can be expanded
> by the user. You can use `collapse="true"` to collapse it by default
> or `collapse="false"` to make a collapsible callout that is expanded
> by default.

### .content-visible when-format=html

<!-- extended callout-tip, collapse, to show source code -->

> [!TIP]
>
> ### Expand for Full Code Walkthrough
>
> ``` r
> library(admiral)
> library(tibble)
> adbds <- tribble(
>   ~PARAMCD, ~AVAL,
>   "AST",    42,
>   "AST",    52,
>   "AST",    NA_real_,
>   "ALT",    33,
>   "ALT",    51
> )
> # Create a criterion flag with values "Y" and NA
> derive_vars_crit_flag(
>   adbds,
>   condition = AVAL > 50,
>   description = "Absolute value > 50"
> )
> # Create criterion flag with values "Y", "N", and NA and parameter dependent
> # criterion description
> derive_vars_crit_flag(
>   adbds,
>   crit_nr = 2,
>   condition = AVAL > 50,
>   description = paste(PARAMCD, "> 50"),
>   values_yn = TRUE,
>   create_numeric_flag = TRUE
> )
> ```

<!-- END  of Callouts -->

### aside

<div class="aside">

1.  An aside.  

</div>

<div class="aside">

2.  Another aside;
3.  contains a hidden keep a secret? USE {.hidden}

</div>

### hidden

<div class="hidden">

4 This is secret

</div>

------------------------------------------------------------------------

Quarto looks to \_quarto.yml in current dir, in parent … This

takes dominance over any scsc file in yaml in the .qmd file.

------------------------------------------------------------------------

### Quarto & CSS \| SCSS (see \_quarto.yml cosmo + custom.scss)

in YAML, I used `date:  today`  
but in inline r 10 January 2025

1 verbatim:

    in chunks: 
    - OLD way: `{r style="xxx"; class=""} 
    - NEW way: `{r .name } where .name is defined in .CSS or .SCSS 

> [!NOTE]
>
> 2nd way:
>
> in chunks: - OLD way: \`{r style=“xxx”; class=““}
>
> - NEW way: \`{r .name } where .name is defined in .CSS or .SCSS

------------------------------------------------------------------------

<div class="custombox_white">

Defined in SCSS (.custombox_white)

</div>

<div class="greybox">

- Div Examples, defined in prior CSS block as `greybox`

</div>

------------------------------------------------------------------------

### Custom Blocks (rmarkdown-9.6)

<div class="aside">

(aside) Custom Blocks

</div>

<div id="hello" class="greeting message" style="color: lime;">

Hello **world**! is this CSS or SCSS?

</div>

- `div` means container
- `::: blocks` are called *fences* and complies to \<div …\>

https://www.sitepoint.com/understanding-and-using-rem-units-in-css/

- .em - height of entire metal type block, not the character alone.
- .rem - size relative to the HTML root tag (~ 16 px)

------------------------------------------------------------------------

These are same: `::::{.X}` and `::::{X}` where X is defined in CSS/SCSS.

    This example ... renders as:
    :::{.small}
    Is this .small?
    :::

<div class="small">

Is this .small?

</div>

------------------------------------------------------------------------

- BE SURE to use `_quarto.yml` in base directory.

- `_quarto.yml` identifies css or SCSS file.

- Quarto uses `themes` from Bootstrap, in special file format (\* …. \*)
  OR, use existing SCSS

- Because `<`, `>` have meaning in HTML, use `escaped` version `<&` in
  HTTP

<!-- -->



    ::: aside 
    SEE References 
    :::

    Interactive? javascript widgets or **Shiny** Fiddle with code? use
    **WebR**

    Decorate?\
    - Use assorted tags that compile to html div - In chunks, use knitr to
    decorate that chunk

    ------------------------------------------------------------------------


    ### SCSS examples (mostly)

    ***

    ``` {.small}
    1. This is small b/c I used `.small` 

<div class="small">

2.  But this time, `small` is inside the colon blocks

</div>

``` very_small
3. Very small
```

<div class="very_small">

4.  Inside colon blocks

</div>

------------------------------------------------------------------------

### Display code and chunk options

```` markdown
```{r}
#| label: example
#| code-line-numbers: "|5|6"
#| echo: fenced # shows these options in output
x  <- 1
y  <- 2
x+y
```
````

    [1] 3

------------------------------------------------------------------------

------------------------------------------------------------------------

------------------------------------------------------------------------

## Acknowledgments

I am grateful for the insightful comments offered by the anonymous peer
reviewers at Books & Texts. The generosity and expertise of one and all
have improved this study in innumerable ways and saved me from many
errors; those that inevitably remain are entirely my own responsibility.

------------------------------------------------------------------------

Example of Bootstrap classes:

``` r
mtcars[1:5, "mpg"]
```

``` bg-warning
[1] 21.0 21.0 22.8 21.4 18.7
```

To make sure that we always get a data frame, we have to use the
argument `drop = FALSE`. Now we use the chunk option
`class.source = "bg-success"`.

``` r
mtcars[1:5, "mpg", drop = FALSE]
```

                       mpg
    Mazda RX4         21.0
    Mazda RX4 Wag     21.0
    Datsun 710        22.8
    Hornet 4 Drive    21.4
    Hornet Sportabout 18.7

------------------------------------------------------------------------

### Annotate code and create code to change font color:

Use knitr to create <span> for red font, rmarkdown cookbook 5.1

``` r
col = function(text, color){
    if (knitr::is_html_output()) {
        sprintf("<span style='color:%s'> %s </span>", color, text )
    }
}
```

Line 1  
Annotate line 1

Line 2  
Annotate line 2

------------------------------------------------------------------------

### Fancy Theorems

    not working

    ::: column-margin
    We know from *the first fundamental theorem of calculus* that for $x$ in
    $[a, b]$:

    $$\frac{d}{dx}\left( \int_{a}^{x} f(u)\,du\right)=f(x).$$

    :::

## R chunks with decorations

### Box (rmarkdown-book 9.6)

``` r
mtcars[1:3, 1:2]
```

                   mpg cyl
    Mazda RX4     21.0   6
    Mazda RX4 Wag 21.0   6
    Datsun 710    22.8   4

``` r
mtcars[1:3, 1:2]
```

                   mpg cyl
    Mazda RX4     21.0   6
    Mazda RX4 Wag 21.0   6
    Datsun 710    22.8   4

------------------------------------------------------------------------

<div id="special" class="sidebar">

This does what?

</div>

<!-- END -->

## Revealjs

SEE ~/docs/code_project/revealjs

``` r
knitr::knit_exit()
```

[^1]: This is footnote one.
