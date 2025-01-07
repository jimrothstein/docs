# 250_quarto_cheat.qmd
JR
2025-01-07

## Preliminaries

> [!NONE]
>
> KEEP as QUARTO .qmd file (to learn to decorate) RStudio also - easy to
> post completed quarto to Posit Cloud

REF

- Mimi - quarto, some CSS, SCSS (see her actual code):
  https://mine-cetinkaya-rundel.github.io/quarto-tip-a-day/  
- Themes, SASS: https://quartoand.me/front-end  
- SASS R pkg:
  https://cran.r-project.org/web/packages/sass/vignettes/sass.html  
- Quarto Themes + modify with SCSS:
  https://quarto.org/docs/output-formats/html-themes.html#basic-options
   

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

### Call out - examples:

> [!NOTE]
>
> A callout note

<div class="aside">

Date: Set programmatically?

</div>

<div class="aside">

keep a secret? USE {.hidden}

</div>

<div class="hidden">

This is secret

</div>

## CSS vs SCSS

- Include few examples with CSS in-line (SEE Bottom)
- But shift to external SCSS generally.
- Avoid external \*.css files

Quarto looks to \_quarto.yml in current dir, in parent … This

takes dominance over any scsc file in yaml in the .qmd file.

------------------------------------------------------------------------

### Quarto & CSS \| SCSS (see \_quarto.yml cosmo + custom.scss)

(need more content)

in YAML, use `date`, fails in YAML: 07 January 2025

    in chunks: - OLD: `{r style="xxx"; class=""} 
    - NEW`{r .name } where .name is defined in .CSS or .SCSS 

<div class="greybox">

- Div Examples, defined in prior CSS block as `greybox`

</div>

- `div` means container

------------------------------------------------------------------------

### Custom Blocks (rmarkdown-9.6)

<div class="aside">

An aside

</div>

<div id="hello" class="greeting message" style="color: lime;">

Hello **world**! is this CSS or SCSS?

</div>

`::: blocks` are called *fences* and complies to \<div …\>

https://www.sitepoint.com/understanding-and-using-rem-units-in-css/
.em - height of entire metal type block, not the character alone. .rem -
size relative to the HTML root tag (~ 16 px)

These are same: `::::{.X}`

and `::::{X}` where X is defined in CSS/SCSS -

<div class="small">

Is this .small?

</div>

BE SURE to use \_quarto.yml in base directory and this file should
identify css or SCSS file.

Quarto uses `themes` from Bootstrap, in special file format (\* …. \*)
OR, use existing SCSS

HTTP and escaping: things like \< \> mean something (tags) ot HTML -
Why? - so use \> \< & must be used in HTTP and avoid overlap with HTML.
\> is called ESCAPED version of \> -

NOTE: No documentation here

<div class="aside">

SEE References

</div>

Interactive? javascript widgets or **Shiny** Fiddle with code? use
**WebR**

Decorate?  
- Use assorted tags that compile to html div - In chunks, use knitr to
decorate that chunk

------------------------------------------------------------------------

### SCSS examples (mostly)

``` small
This is small
```

<div class="small">

Inside the colon blocks

</div>

``` very_small
Very small
```

<div class="very_small">

Inside colon blocks

</div>

\`\`\`{.

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

## Revealjs

SEE ~/docs/code_project/revealjs

``` r
knitr::knit_exit()
```

[^1]: This is footnote one.
