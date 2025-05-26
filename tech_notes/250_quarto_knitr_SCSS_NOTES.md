# 250_quarto_cheat.qmd
JR
2025-05-25

#### Jim

This is text related to JIM

------------------------------------------------------------------------

------------------------------------------------------------------------

------------------------------------------------------------------------

Def Word A  
Word A means …..

Word B  
B means this.

------------------------------------------------------------------------

<br>

<div class="shadowbox">

<p>

For CSS, use:

This is shadowbox in generic ‘div’ container (Note: many ways to put
into .qmd) SEE:
https://developer.mozilla.org/en-US/docs/Web/HTML/Element/div

SEE: https://pandoc.org/chunkedhtml-demo/8.18-divs-and-spans.html
</p>

</div>

<div class="shadowbox">

<p>

Should also be in shadobx, using pandox’s colons
</p>

</div>

<div class="shadowbox">

Latex, MATH, **diagrams**: SEE `code_publish` esp MATH and LATEX (but
poor organization)

</div>

Embed latex.sty and real latex in quarto
https://youtu.be/2DbuqYKOsrY?t=396

Or, add `quarto extensions` (format: my_extension) To add latex or HTML
forms … Or, some R packages (gt, …) allow you to embed latex in a
function. OR, typst (since 2022) - simpler than latex

### typst

\*.qmd, then template (position things like $title$), then style doc to
set title = “Hello” Typt is more English; compare to SCSS to make, say,
a box, yellow, with a font …

# Section I

go to [Jim](#jim)

## TO DO

In SCSS file, there are - tags Example: h1 { … } - class Example:
.important { … } - id Example: \#title { …}

Inside the { … } is SCSS

Once defined, the SCSS can applied in \*.qmd file in several ways

- chunk:

<!-- -->

    #| class-output:  myclass

- text: add highlight {.highlight}

- div:

<!-- -->

    ::: {.border}
     text
    :::

- inline: <span class="highlight">render this text</span>

- via markdown: *this is italics* <u>this is underline</u>

<div class="underline">

this is also underlined, using definition in SCSS

</div>

------------------------------------------------------------------------

## To Publish quarto to connect.posit.cloud

https://connect.posit.cloud/jimrothstein

This is IDE (https://posit.cloud/content/yours?sort=name_asc)

- Copy desired \*.qmd to this folder: quarto … test

- Run the writeManifest() (below)

- (Does render work locally?)

- Check the resulting manifest.json is not bloated with excessive
  packages/dependencies.

- commit/push

- On this website: - https://connect.posit.cloud/jimrothstein

- `Publish`

- Choose Github, this folder, which \*.qmd file

In this folder/project,

``` r
#rsconnect::writeManifest()
```

## Absolute positioning example

<span class="small">I love .small</span>

<span class="center">centering</span>

\[absolute positioning\]{.absolute top=“50%” left-“50%”}

<span class="absolute" bottom="0" right="0">and cake.</span>

## Preliminaries

> [!NONE]
>
> KEEP as QUARTO .qmd file (to learn to decorate) RStudio also - easy to
> post completed quarto to Posit Cloud

### REF

- <https://sass-lang.com/documentation/>

- [sass-lang.org](https://sass-lang.com/documentation/ "tip: full scss docs")

- 

- 

Here is [FOO](https://sass-lang.com/documentation/ "explicit link") and
here is [Pandoc
links](https://pandoc.org/MANUAL.html#inline-links "pandoc")

> [!TIP]
>
> ### References, click to expand
>
> - Mimi - quarto, some CSS, SCSS (see her actual code):
>   https://mine-cetinkaya-rundel.github.io/quarto-tip-a-day/  
> - Themes, SASS:
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

### Misc quarto tips

- Quarto looks to \_quarto.yml in current dir, then in parent dir.
- This takes dominance over any scsc file in yaml in the .qmd file.
  (check !!)
- `div` means container
- `::: blocks` are called *fences* and complies to \<div …\>

https://www.sitepoint.com/understanding-and-using-rem-units-in-css/

- .em - height of entire metal type block, not the character alone.
- .rem - size relative to the HTML root tag (~ 16 px)

------------------------------------------------------------------------

These are same: `::::{.X}` and `::::{X}` where X is defined in CSS/SCSS.
<!-- end of preliminaries -->

### Output chunks

Note: use of `class-source` and `class-output`, define .custombox\_\* in
SCSS class-source not working.

``` r
x=1
y = x +2
y
[1] 3
```

``` r
x=1
y = x +2
y
[1] 3
```

``` r
x=1
y = x +2
y
[1] 3
```

``` r
#| code-fold: true
#| code-summmary: Show code.

Show me
```

## Pandoc only (cli) - pdf,

pandoc -D latex \# template pandoc -D html

templates look like $var$, or $IF$ etc. trick: Regardless of content,
place 3 back ticks at top/bottom will render document as straight text.

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

<!-- TWO columns -->

### Two columns

<div class="columns">

<div class="column" width="70%">

I would like to have text here

Sentence becomes longer, it should automatically stay in their column

</div>

<div class="column" width="10%">

<!-- empty column to create gap -->

</div>

<div class="column" width="20%">

and here

More text

</div>

</div>

------------------------------------------------------------------------

------------------------------------------------------------------------

### Quarto & CSS \| SCSS (see \_quarto.yml cosmo + custom.scss)

in YAML, I used `date:  today`  
but in inline r 25 May 2025

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

------------------------------------------------------------------------

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

### SCSS @mixin (not working)

Put this in custom.scss

    @mixin absolute-center() {
      position:absolute;
      left:50%;
      top:50%;
      transform:translate(-50%,-50%);
    }
    .element-1 {
      @include absolute-center();
      color:green;
    }
    .element-2 {
      @include absolute-center();
      color:blue;
    }

Usage:

    @mixin square($size) {
      width:$size;
      height:$size;
      color:white;
    }
    div {
      @include square(60px);
      background-color:#000;
    }

<div class="element-1">

element-1

</div>

<div class="element-2">

element-2

</div>

<div class="square">

square

</div>

------------------------------------------------------------------------

### SCSS hover

``` button-container
1. hover and see what happends
```

``` nested_class
1. hover and see what happends
```

<div class="nested_class">

2.  hover and see what happends

</div>

<div class="button-container">

    <p class="button-text">Click me</p>

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

### table with scss

<table class="table table-bordered">

<thead>

<tr>

<th>

First Name
</th>

<th>

Last Name
</th>

<th>

Super Hero
</th>

</tr>

</thead>

<tbody>

<tr>

<td>

Peter
</td>

<td>

Parker
</td>

<td>

Spiderman
</td>

</tr>

<tr>

<td>

Bruce
</td>

<td>

Wayne
</td>

<td>

Batman
</td>

</tr>

<tr>

<td>

Clark
</td>

<td>

Kent
</td>

<td>

Superman
</td>

</tr>

</tbody>

</table>

------------------------------------------------------------------------

------------------------------------------------------------------------

------------------------------------------------------------------------

Example of Bootstrap classes:

``` r
mtcars[1:5, "mpg"]
[1] 21.0 21.0 22.8 21.4 18.7
```

To make sure that we always get a data frame, we have to use the
argument `drop = FALSE`. Now we use the chunk option
`class.source = "bg-success"`.

``` r
mtcars[1:5, "mpg", drop = FALSE]
                   mpg
Mazda RX4         21.0
Mazda RX4 Wag     21.0
Datsun 710        22.8
Hornet 4 Drive    21.4
Hornet Sportabout 18.7
```

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
               mpg cyl
Mazda RX4     21.0   6
Mazda RX4 Wag 21.0   6
Datsun 710    22.8   4
```

``` r
mtcars[1:3, 1:2]
               mpg cyl
Mazda RX4     21.0   6
Mazda RX4 Wag 21.0   6
Datsun 710    22.8   4
```

------------------------------------------------------------------------

<div id="special" class="sidebar">

This does what?

</div>

<!-- END -->

``` r
# knitr::knit_exit()
```

------------------------------------------------------------------------

<!--   CSS below this line -->

## CSS here

### CSS in-line examples.

<div class="myDiv">

PURPOSE: Collect of HTML and PDF inline commands to control output

</div>

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

### Quarto: In-line CSS Examples for HTML, PDF

<font size="1"> Very small </font>

### Inline

We can apply styles to a sentence or a word by creating spans using `[]`
to surround the sentence or word that we want to style and use `{}` to
define the style that we want to apply. For example,

The color of this word is <span style="color: red;">red</span>. And
<span style="background-color: yellow">this line has a yellow
background</span>.

------------------------------------------------------------------------

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
              mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4      21   6  160 110  3.9 2.620 16.46  0  1    4    4
Mazda RX4 Wag  21   6  160 110  3.9 2.875 17.02  0  1    4    4
```

## Acknowledgments

I am grateful for the insightful comments offered by the anonymous peer
reviewers at Books & Texts. The generosity and expertise of one and all
have improved this study in innumerable ways and saved me from many
errors; those that inevitably remain are entirely my own responsibility.

[^1]: This is footnote one.
