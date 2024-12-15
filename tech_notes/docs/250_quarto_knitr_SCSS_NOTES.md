# 250_quarto_cheat.qmd
JR
2024-12-15

## Preliminaries

> [!NONE]
>
> KEEP as QUARTO .qmd file (to learn to decorate) RStudio also - easy to
> post completed quarto to Posit Cloud

TODO:

- inline CSS, move to top
- SCSS, move to bottom
- tighten
- use *.scss files, not *.css file (but keep \*.css files as reference)
- links !

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
theme file(s):

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

- rmarkdown cookbook: <https://bookdown.org/yihui/rmarkdown-cookbook/>

- markdown:: adds to rmarkdown: <link>

- Mimi: videos

- Pandoc’s version of markdown: <link>

- Bootstrap: predefined `class`
  <https://getbootstrap.com/docs/3.4/css/#helper-classes> :::

### quarto examples

- ~/code/try_things_here/envir/9009_namespace
- <https://quarto.org/docs/authoring/markdown-basics.html#divs-and-spans>
- More examples: ~/code/QUARTO/QUARTO/

### Run quarto (CLI) create project to create any quarto project, including slides with revealjs.

For revealjs, choose presentation when create document (in Rstudio)

### Quarto - markup, callouts

<u>underline text, where defined?</u>

<span class="border">text with border, defined?</span> \### Create a
footnote:

Need footnote one here: [^1]

> [!NOTE]
>
> A callout note

<div class="aside">

Date: Set programmatically?

</div>

<div class="aside">

keep a secret? USE {.hidden}

<div class="hidden">

This is secret

</div>

</div>

## CSS vs SCSS

- Include few examples with CSS in-line
- But shift to external SCSS generally.
- Avoid external \*.css files

Quarto looks to \_quarto.yml in current dir, in parent … This

takes dominance over any scsc file in yaml in the .qmd file.

------------------------------------------------------------------------

### Quarto & CSS \| SCSS (see \_quarto.yml cosmo + custom.scss)

(need more content)

## CSS (mostly)

### CSS in-line examples.

<div class="myDiv">

PURPOSE: Collect of HTML and PDF inline commands to control output

</div>

in YAML, use `date`, fails in YAML: 15 December 2024

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

Hello **world**!

</div>

`::: blocks` are called *fences* and complies to \<div …\>

.SCSS complies to .CSS

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

NOTE: No documentation here :::

::: aside SEE References :

Interactive? javascript widgets or **Shiny** Fiddle with code? use
**WebR**

Decorate?  
- Use assorted tags that compile to html div - In chunks, use knitr to
decorate that chunk

------------------------------------------------------------------------

### in-file, CSS examples

<!--  Define inline CSS classes -->
<style>
&#10;#title-block-header {
  margin-block-end: 1rem;
  position: relative;
  margin-top: -1px;
  height: 75px;
}
.quarto-title-banner {
  margin-block-end: 1rem;
  position: relative;
  margin-top: -30px;
  height: 85%;
}
.myDiv {
  border: 5px outset red;
  background-color: lightblue;
  text-align: center;
}
&#10;.blackbox {
  padding: 1em;
  background: black;
  color: white;
  border: 2px solid orange;
  border-radius: 10px;
}
&#10;.greybox {
  padding: 1em;
  background: grey;
  color: white;
  border: 2px solid orange;
  border-radius: 10px;
}
&#10;.center {
  text-align: center;
}
</style>

# 

### Quarto: In-line CSS Examples for HTML, PDF

<font size="1"> Very small </font>

### Inline

We can apply styles to a sentence or a word by creating spans using `[]`
to surround the sentence or word that we want to style and use `{}` to
define the style that we want to apply. For example,

The color of this word is <span style="color: red;">red</span>. And
<span style="background-color: yellow">this line has a yellow
background</span>.

## ————————————————————————

### Create a CSS class (inline)

    create class "myColor" (red) inline | use in paragraph | and div block| 

<style>
&#10;.myColor {
  color:red;
  fontsize=1; 
}
</style>
Example 1
<p class="myColor">
myColor
</p>

Example 2

<div class="myColor">

This is a Div defined by CSS, inline

</div>

#### Header uses in-file CSS class

``` r
head(mtcars, n=2)
```

                  mpg cyl disp  hp drat    wt  qsec vs am gear carb
    Mazda RX4      21   6  160 110  3.9 2.620 16.46  0  1    4    4
    Mazda RX4 Wag  21   6  160 110  3.9 2.875 17.02  0  1    4    4

### SCSS examples (mostly)

``` small
This is small
```

``` very_small
Very small
```

### Display code and chunk options

```` markdown
```{r}
#| label: example
#| code-line-numbers: "|5|6"
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

<div class="column-margin">

We know from *the first fundamental theorem of calculus* that for $x$ in
$[a, b]$:

$$\frac{d}{dx}\left( \int_{a}^{x} f(u)\,du\right)=f(x).$$

</div>

------------------------------------------------------------------------

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

[^1]: This is footnote one.
