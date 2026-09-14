// Simple numbering for non-book documents
#let equation-numbering = "(1)"
#let callout-numbering = "1"
#let subfloat-numbering(n-super, subfloat-idx) = {
  numbering("1a", n-super, subfloat-idx)
}

// Theorem configuration for theorion
// Simple numbering for non-book documents (no heading inheritance)
#let theorem-inherited-levels = 0

// Theorem numbering format (can be overridden by extensions for appendix support)
// This function returns the numbering pattern to use
#let theorem-numbering(loc) = "1.1"

// Default theorem render function
#let theorem-render(prefix: none, title: "", full-title: auto, body) = {
  if full-title != "" and full-title != auto and full-title != none {
    strong[#full-title.]
    h(0.5em)
  }
  body
}
// Some definitions presupposed by pandoc's typst output.
#let content-to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(content-to-string).join("")
  } else if content.has("body") {
    content-to-string(content.body)
  } else if content == [ ] {
    " "
  }
}

#let horizontalrule = line(start: (25%,0%), end: (75%,0%))

#let endnote(num, contents) = [
  #stack(dir: ltr, spacing: 3pt, super[#num], contents)
]

#show terms.item: it => block(breakable: false)[
  #text(weight: "bold")[#it.term]
  #block(inset: (left: 1.5em, top: -0.4em))[#it.description]
]

// Some quarto-specific definitions.

#show raw.where(block: true): set block(
    fill: luma(230),
    width: 100%,
    inset: 8pt,
    radius: 2pt
  )

#let block_with_new_content(old_block, new_content) = {
  let fields = old_block.fields()
  let _ = fields.remove("body")
  if fields.at("below", default: none) != none {
    // TODO: this is a hack because below is a "synthesized element"
    // according to the experts in the typst discord...
    fields.below = fields.below.abs
  }
  block.with(..fields)(new_content)
}

#let empty(v) = {
  if type(v) == str {
    // two dollar signs here because we're technically inside
    // a Pandoc template :grimace:
    v.matches(regex("^\\s*$")).at(0, default: none) != none
  } else if type(v) == content {
    if v.at("text", default: none) != none {
      return empty(v.text)
    }
    for child in v.at("children", default: ()) {
      if not empty(child) {
        return false
      }
    }
    return true
  }

}

// Subfloats
// This is a technique that we adapted from https://github.com/tingerrr/subpar/
#let quartosubfloatcounter = counter("quartosubfloatcounter")

#let quarto_super(
  kind: str,
  caption: none,
  label: none,
  supplement: str,
  position: none,
  subcapnumbering: "(a)",
  body,
) = {
  context {
    let figcounter = counter(figure.where(kind: kind))
    let n-super = figcounter.get().first() + 1
    set figure.caption(position: position)
    [#figure(
      kind: kind,
      supplement: supplement,
      caption: caption,
      {
        show figure.where(kind: kind): set figure(numbering: _ => {
          let subfloat-idx = quartosubfloatcounter.get().first() + 1
          subfloat-numbering(n-super, subfloat-idx)
        })
        show figure.where(kind: kind): set figure.caption(position: position)

        show figure: it => {
          let num = numbering(subcapnumbering, n-super, quartosubfloatcounter.get().first() + 1)
          show figure.caption: it => block({
            num.slice(2) // I don't understand why the numbering contains output that it really shouldn't, but this fixes it shrug?
            [ ]
            it.body
          })

          quartosubfloatcounter.step()
          it
          counter(figure.where(kind: it.kind)).update(n => n - 1)
        }

        quartosubfloatcounter.update(0)
        body
      }
    )#label]
  }
}

// callout rendering
// this is a figure show rule because callouts are crossreferenceable
#show figure: it => {
  if type(it.kind) != str {
    return it
  }
  let kind_match = it.kind.matches(regex("^quarto-callout-(.*)")).at(0, default: none)
  if kind_match == none {
    return it
  }
  let kind = kind_match.captures.at(0, default: "other")
  kind = upper(kind.first()) + kind.slice(1)
  // now we pull apart the callout and reassemble it with the crossref name and counter

  // when we cleanup pandoc's emitted code to avoid spaces this will have to change
  let old_callout = it.body.children.at(1).body.children.at(1)
  let old_title_block = old_callout.body.children.at(0)
  let children = old_title_block.body.body.children
  let old_title = if children.len() == 1 {
    children.at(0)  // no icon: title at index 0
  } else {
    children.at(1)  // with icon: title at index 1
  }

  // TODO use custom separator if available
  // Use the figure's counter display which handles chapter-based numbering
  // (when numbering is a function that includes the heading counter)
  let callout_num = it.counter.display(it.numbering)
  let new_title = if empty(old_title) {
    [#kind #callout_num]
  } else {
    [#kind #callout_num: #old_title]
  }

  let new_title_block = block_with_new_content(
    old_title_block,
    block_with_new_content(
      old_title_block.body,
      if children.len() == 1 {
        new_title  // no icon: just the title
      } else {
        children.at(0) + new_title  // with icon: preserve icon block + new title
      }))

  align(left, block_with_new_content(old_callout,
    block(below: 0pt, new_title_block) +
    old_callout.body.children.at(1)))
}

// 2023-10-09: #fa-icon("fa-info") is not working, so we'll eval "#fa-info()" instead
#let callout(body: [], title: "Callout", background_color: rgb("#dddddd"), icon: none, icon_color: black, body_background_color: white) = {
  block(
    breakable: false, 
    fill: background_color, 
    stroke: (paint: icon_color, thickness: 0.5pt, cap: "round"), 
    width: 100%, 
    radius: 2pt,
    block(
      inset: 1pt,
      width: 100%, 
      below: 0pt, 
      block(
        fill: background_color,
        width: 100%,
        inset: 8pt)[#if icon != none [#text(icon_color, weight: 900)[#icon] ]#title]) +
      if(body != []){
        block(
          inset: 1pt, 
          width: 100%, 
          block(fill: body_background_color, width: 100%, inset: 8pt, body))
      }
    )
}


// syntax highlighting functions from skylighting:
/* Function definitions for syntax highlighting generated by skylighting: */
#let EndLine() = raw("\n")
#let Skylighting(fill: none, number: false, start: 1, sourcelines) = {
   let blocks = []
   let lnum = start - 1
   let bgcolor = rgb("#f1f3f5")
   for ln in sourcelines {
     if number {
       lnum = lnum + 1
       blocks = blocks + box(width: if start + sourcelines.len() > 999 { 30pt } else { 24pt }, text(fill: rgb("#aaaaaa"), [ #lnum ]))
     }
     blocks = blocks + ln + EndLine()
   }
   block(fill: bgcolor, width: 100%, inset: 8pt, radius: 2pt, blocks)
}
#let AlertTok(s) = text(fill: rgb("#ad0000"),raw(s))
#let AnnotationTok(s) = text(fill: rgb("#5e5e5e"),raw(s))
#let AttributeTok(s) = text(fill: rgb("#657422"),raw(s))
#let BaseNTok(s) = text(fill: rgb("#ad0000"),raw(s))
#let BuiltInTok(s) = text(fill: rgb("#003b4f"),raw(s))
#let CharTok(s) = text(fill: rgb("#20794d"),raw(s))
#let CommentTok(s) = text(fill: rgb("#5e5e5e"),raw(s))
#let CommentVarTok(s) = text(style: "italic",fill: rgb("#5e5e5e"),raw(s))
#let ConstantTok(s) = text(fill: rgb("#8f5902"),raw(s))
#let ControlFlowTok(s) = text(weight: "bold",fill: rgb("#003b4f"),raw(s))
#let DataTypeTok(s) = text(fill: rgb("#ad0000"),raw(s))
#let DecValTok(s) = text(fill: rgb("#ad0000"),raw(s))
#let DocumentationTok(s) = text(style: "italic",fill: rgb("#5e5e5e"),raw(s))
#let ErrorTok(s) = text(fill: rgb("#ad0000"),raw(s))
#let ExtensionTok(s) = text(fill: rgb("#003b4f"),raw(s))
#let FloatTok(s) = text(fill: rgb("#ad0000"),raw(s))
#let FunctionTok(s) = text(fill: rgb("#4758ab"),raw(s))
#let ImportTok(s) = text(fill: rgb("#00769e"),raw(s))
#let InformationTok(s) = text(fill: rgb("#5e5e5e"),raw(s))
#let KeywordTok(s) = text(weight: "bold",fill: rgb("#003b4f"),raw(s))
#let NormalTok(s) = text(fill: rgb("#003b4f"),raw(s))
#let OperatorTok(s) = text(fill: rgb("#5e5e5e"),raw(s))
#let OtherTok(s) = text(fill: rgb("#003b4f"),raw(s))
#let PreprocessorTok(s) = text(fill: rgb("#ad0000"),raw(s))
#let RegionMarkerTok(s) = text(fill: rgb("#003b4f"),raw(s))
#let SpecialCharTok(s) = text(fill: rgb("#5e5e5e"),raw(s))
#let SpecialStringTok(s) = text(fill: rgb("#20794d"),raw(s))
#let StringTok(s) = text(fill: rgb("#20794d"),raw(s))
#let VariableTok(s) = text(fill: rgb("#111111"),raw(s))
#let VerbatimStringTok(s) = text(fill: rgb("#20794d"),raw(s))
#let WarningTok(s) = text(style: "italic",fill: rgb("#5e5e5e"),raw(s))



#let article(
  title: none,
  subtitle: none,
  authors: none,
  keywords: (),
  date: none,
  abstract-title: none,
  abstract: none,
  thanks: none,
  cols: 1,
  lang: "en",
  region: "US",
  font: none,
  fontsize: 11pt,
  title-size: 1.5em,
  subtitle-size: 1.25em,
  heading-family: none,
  heading-weight: "bold",
  heading-style: "normal",
  heading-color: black,
  heading-line-height: 0.65em,
  mathfont: none,
  codefont: none,
  linestretch: 1,
  sectionnumbering: none,
  linkcolor: none,
  citecolor: none,
  filecolor: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  doc,
) = {
  // Set document metadata for PDF accessibility
  set document(title: title, keywords: keywords)
  set document(
    author: authors.map(author => content-to-string(author.name)).join(", ", last: " & "),
  ) if authors != none and authors != ()
  set par(
    justify: true,
    leading: linestretch * 0.65em
  )
  set text(lang: lang,
           region: region,
           size: fontsize)
  set text(font: font) if font != none
  show math.equation: set text(font: mathfont) if mathfont != none
  show raw: set text(font: codefont) if codefont != none

  set heading(numbering: sectionnumbering)

  show link: set text(fill: rgb(content-to-string(linkcolor))) if linkcolor != none
  show ref: set text(fill: rgb(content-to-string(citecolor))) if citecolor != none
  show link: this => {
    if filecolor != none and type(this.dest) == label {
      text(this, fill: rgb(content-to-string(filecolor)))
    } else {
      text(this)
    }
   }

  let has-title-block = title != none or (authors != none and authors != ()) or date != none or abstract != none
  if has-title-block {
    place(
      top,
      float: true,
      scope: "parent",
      clearance: 4mm,
      block(below: 1em, width: 100%)[

        #if title != none {
          align(center, block(inset: 2em)[
            #set par(leading: heading-line-height) if heading-line-height != none
            #set text(font: heading-family) if heading-family != none
            #set text(weight: heading-weight)
            #set text(style: heading-style) if heading-style != "normal"
            #set text(fill: heading-color) if heading-color != black

            #text(size: title-size)[#title #if thanks != none {
              footnote(thanks, numbering: "*")
              counter(footnote).update(n => n - 1)
            }]
            #(if subtitle != none {
              parbreak()
              text(size: subtitle-size)[#subtitle]
            })
          ])
        }

        #if authors != none and authors != () {
          let count = authors.len()
          let ncols = calc.min(count, 3)
          grid(
            columns: (1fr,) * ncols,
            row-gutter: 1.5em,
            ..authors.map(author =>
                align(center)[
                  #author.name \
                  #author.affiliation \
                  #author.email
                ]
            )
          )
        }

        #if date != none {
          align(center)[#block(inset: 1em)[
            #date
          ]]
        }

        #if abstract != none {
          block(inset: 2em)[
          #text(weight: "semibold")[#abstract-title] #h(1em) #abstract
          ]
        }
      ]
    )
  }

  if toc {
    let title = if toc_title == none {
      auto
    } else {
      toc_title
    }
    block(above: 0em, below: 2em)[
    #outline(
      title: toc_title,
      depth: toc_depth,
      indent: toc_indent
    );
    ]
  }

  doc
}

#set table(
  inset: 6pt,
  stroke: none
)
#let brand-color = (:)
#let brand-color-background = (:)
#let brand-logo = (:)

#set page(
  paper: "us-letter",
  margin: (x: 1.25in, y: 1.25in),
  numbering: "1",
  columns: 1,
)

#show: doc => article(
  title: [410\_MATH\_notes.qmd],
  authors: (
    ( name: [JR],
      affiliation: [],
      email: [] ),
    ),
  date: [2026-09-12],
  font: ("Liberation Serif",),
  heading-family: ("Liberation Serif",),
  toc_title: [Table of contents],
  toc_depth: 3,
  doc,
)

// ubses noteworthy !
#import "@preview/noteworthy:0.2.0": *
#import "@preview/physica:0.9.8": *

- a*b  (no spaces around *)

A#sub(long_subscript)


#show: noteworthy.with(
  paper-size: "a4",
  font: "New Computer Modern",
  language: "EN",
  title: "Title of The Document",
  author: "Your Name",
  contact-details: "https://example.com", // Optional: Maybe a link to your website, or phone number
  toc-title: "Table of Contents",
  watermark: "DRAFT", // Optional: Watermark for the document
)

// Write here

#set document(title: "0002_math_equations")
#set page(margin: 0.5in)
#set text(size: 11pt)

// Goal: Combine math, linear algebra, statistics, ML (not R)

Goal: Combine math, linear algebra, statistics, ML (not R)

= REF:
See: #link("https://github.com/jimrothstein/code_publish/blob/master/MATH/0002_math_equations.qmd")

= use noteworthy
#example[
  3,5,7
]

== set notation
$
{(x,y) | f(x)/g(x) = 1 
$

#definition[
  a prime number has two divisors, 1 and itself.
]

== Notation
$
alpha in KK \

a dot (b+c) \

bb(A), AA, bb(1) \
$


= Tangent Line

Given a function, f find tangent line at point $(x_0, y_0)$

== Equation of Line

$y=m*x + b$

The slope of line at point P is, by definition, 
$(y-y_0)/(x-x_0) = m$

From calculus, we know slope is equal to
$m = f(x_0)$

Thus m is now known.

== Line through origin, parallel to tangent

$y = m*x$

== Line through $x_0$, parallel to tangent 
$y = m(x - x_0)$

== The tangent line, through $(x_0, y_0)$

$y = m(x - x_0) + f(x_0)$

= "Linear Algebra"
== "Normal Equations, solution which minimizes error (regression)"

$
F(x,y,z) = 3*x + 4*y + 5*z
$

== "Matrix multiplication"
#example[
  3,5,7
]

#definition[
  a prime number has two divisors, 1 and itself.
]


$
mat(3,4,5) #sym.dot.op vec(x,y,z)
$


== Linear transformation

Suppose point P lies (1,1) in x-y plane, a distance of $sqrt(2)$ from origin.
Write P in terms of natural basis parallel to ray to P.

In regular basis,

$
P : vec(1,1)#sub("old") = vec(1,0)#sub("old") + vec(0,1)#sub("old")
$

In "natural" basis,
$
vec(1,0)#sub("new") = 1/sqrt(2)*vec(1,0) + 1/sqrt(2)*vec(0,1) \
$


Tranformation matrix: (wrong !)

$
1/sqrt(2) mat(1,0; 0, 1)
$



== "Error"

Suppose true function is quadratic and we model as linear. In most regions error is large and consistently large. Is this error *bias*? a failure of the model?

Noise?
use *averaging* to minimize

"2024-05-04 Sat":
- vector means 'direction' and 'magnitude' (no coordinate system).
  With this DEF, 2 vectors are the *same* if have same direction and
  magnitude. (Translation seems implicit; but we have no coordinate
  system)

== Law of Large Numbers

$ bar(x) $

As sample size increases, approach $mu$
$lim_(n -> infinity) bar(x) = mu$

== But CLT

for any n, compare mean of many k samples will approach $mu$ much faster


// lim_(k -> oo) (bar(x_k)) = n*mu


---

/*
$
SS_(x) = sum (x - bar(x))^2 = sum x^2 - ( (sum x)^2 ) / n
$
*/

---

== Gamma Function
- (intution) #link("https://www.youtube.com/watch?v=Qjeswpm0cWY")
  - Consider $0!$, $1!$, $2!$ ... Plot; What would $pi!$ $0.5!$
- In other words, find the function that fits all integers of $x$, but works for any $x$ real.

---

== Bayes
- Video, Ox series: #link("https://youtu.be/U1HbB0ATZ_A?si=ljknvvraM7Fn4hz3")

=== $P(A|B)$
We are told $x in B$.  What is probability $x in A$?

To be in A, $x in A inter B$.   But this depends on relative "sizes"

Compare:   $x in A inter B$  relative to $x in B$, ie anywhere  B
Hence   $P(A inter B)/P(B)$

== Explain $s^2$ vs $hat(sigma)^2$

$s^2$ refers to sample variance
$(1 / N) sum_n (x - bar(x))^2$

$hat(sigma)^2$ refers to population variance estimator

$s^2$ is biased (toward values closer to mean). And if $N=1$, $s^2$ we get $0$, hardly believable population variance.
(The reason is subtle, when $N$ is small odds are it will not capture enough of outliers. SEE LSR)

== Summation

/*
$sum_(k=1)^n x_k$

*/

$x = sqrt(b)$

If $a^2=b$ and $b=2$, then the solution must be
either $a = +sqrt(2)$ or $a = -sqrt(2)$.


== Probability Space, Algebra, function
Sample Space is set of atomic events:   throw 2 die, list all possible outcomes.
Algebra is all possible subsets of the space.  Ex:  sets s.t. dice total to 4.
By event, we do not retrict to just singular.  The event in previous example is dice total to 4.   This might be several atomic sets, but it is ONE event.

$
//Pr(2 dice total = 4);    need to write Pr( total = 4)
$

One way to look at probability is ratio of size of the subset (event)
vs total allowable subspace (all possible events).  Related: If there
are many possibilities for same outcome, expect the actual event
probably to grow: Birthday at Party: Many possibilities n\*(n-1) for
match.  This is why so few actual people are needed to raise odds.



== linear functional

$phi : R^3 -> R$
$phi(v) = 4 dot x - 5 dot y + 2 dot z$

== Entropy

*entropy, information* $ H(X) $
Better to find information about a variable that very uncertain, against variable more predictable

REF: #link("https://archive.org/details/elementsofinform0000cove_l9p7")

Given a random variable $X$, what is amount of *surprise* when learning value of $X$?
The definition:

is chosen because it has *nice* properties that we expect of *information*.

$X$ is discrete random variable
try $H$, $T$ each prob = 1/2

$ sum_(k=0)^n k
    &= 1 + ... + n \
    &= (n(n+1)) / 2 $


cal(P)(X) = $ sum_(i=1)^n p(x)*log(p(x)) $

$cal(P)(X) = sum_(i=1)^n p(x)*log(p(x)) $

"double-struck(P) = -"

Example:

How many binary questions need to ask?
 Prob(X) = a (1/2), b(1/4), c(1/4) 

double-struck(P)

$ cal(P) $

double-struck(P)

$ P[ ] $

 Prob(x) = cases(
  -x, "if " x < 0,
  0, "if " x = 0,
  x, "if " x > 0,
) 

$
cal(P)(X) = cases(
  a, 1/2,
  a, "if " x < 0,
  b, "if " x = 0,
  c, "if " x > 0,
)
$

sums, regression


= ML Notes

== Logistic Regression
- Using data, tune a model parameters of logistic equation to predict probabilities (ex: horse racing !)
  Compare to ACTUAl output (win or loss) to do the tweeking. If your accuracy exceeds the Bookie (who introduces bias, to make money.) You can win!

== Bayes Thm
- Compare performance of difference models


== Log Normal
Note:
// log(1 + e) tilde.equiv e   
for small e

Ex:  Consider yearly growth rates of many companies.  Growth rates vary by company and by year, usually small, and independent:

\\ Y(t + 1 ) = Y( t )\*(1 + e), where is small, varies by year, by company.

Take log:   log(Y) = log(Y) +  many e
Claim:  sum of many small independent e become Normal

= tensor
example: (intuition only)  Consider cube, with different stress on each side.  For each side, the stress can be a Matrix M times vector in 3 directions.  M*v. So need 3 matrices.  Tensor is more compact way to say this.

#line(length: 100%)

= What is derivative?
dy/dx is *symbol*, just *notation*
- no meaning by itself, "derivative"
- forget infinitesimals; surreal numbers
- dx, dy are NOT limit of $Delta x, Delta y$; not fraction; no division

- dy/dx is symbol for 

$ 
 lim (h-> 0) (f(x+h) - f(x))/h 
$


- More modern: dx is differential form or co-vector a function that
  takes a tangent vector and returns scalar, which is magnitude of
  tangent vector in x-direction


f: R^2 - R


== Tangent Line in 1 dimension

For a function $f(x)$, the tangent line at $x = a$ is:

$ y = f(a) + (dif f)/(dif x) \|_(x=a) dot (x - a) $

== Tangent Plane in 2 dimensions

In 2 dimensions, $z = f(x,y)$, we find the tangent plane near $(a,b,f(a,b))$ as follows:

$ z = f(a,b) + (partial f)/(partial x) \|_((x,y)=(a,b)) dot (x - a) + (partial f)/(partial y) \|_((x,y)=(a,b)) dot (y - b) $


== Likelihood (https://bookdown.org/roback/bookdown-BeyondMLR/ch-beyondmost.html#case-study-does-sex-run-in-families) 
$ P(D, p)$
D = Data (have)
p = param (unknown)

-Data = known
-Distribution type - known
-Unknown = parameter for Distribution that explains the data
-Goal:  Choose parameter st most consistent with data.

-Example Data, in a village, number/order of children (B, G, GG ?) and
 number of families. (not measure probabity of having one boy; p is NOT random variable)  Look at
 outcomes across village: how to explain? )

Find best $p_b$ the probability of one boy  $(1-p_b)$ for each girl
Once we have all the data, the likihood is expression  $ p_b^30 * (1-p_b)^20  $
Plot, take derivative ... gives $ p_b $ = 0.60
*This p is where the likihood is maximized* (explains observed data, the best)

== "Laplace Transform, convolution"

- laplace, many nice propeties.
- convolution of f,g becomes multiplication in freq domain; inverse is solution to original.

if f(t) is prob density

$
L{f}(s)
$

$
integral_0^infinity f(t)*e^(-s)
$



$
integral_0^infinity f(t)e^-s
$
identify this as $ E[ e-"tX"]
$

$ integral_0^infinity e^(-x^2) dif x = sqrt(pi)/2 $


== Notes from gr-teachO
=== Gradient of $f=x*y + 4y - 3x^2 - y^2$

Suppose this represents a surface with a minimum/maximum.
Project onto the x-y axis and ask for a point $x_0$ = $(1,-1)$ find the vector that points toward min/max.

Method #1  Take gradient

$gradient f$ evaluated at $x_0$ will give us vector pointing to min/max

$gradient f(arrow(x), arrow(y))$ 

#import "@preview/diverential:0.2.0": *

$vec(dv(f,x, eval:0),(dv(f,y, eval:0)))$ =
$vec(-7,7)$
(reverse the sign, to find min)

= Calculus
== Compare derivative in 1D vs 2D
curve (1D)  in $R^2$

$
f: RR -> RR
$
direction (only left/right, or no change)
point at x
point at x + h  (where h small, points are near)

so

$f(x)$ and $f(x + h)$ are both scalar.

// does not like lim
// $display(lim_(h-> 0) (f(x+h) - f(x))/h) $


But in 2D
surface (2D) in $R^3$
directions now infinite
point at  $vec(x)$
2nd point a $vec(x +  s, y + r)$


$
f: RR^2 -> RR
$

== Principal Axis Thm
- generalize major/minor axes of ellipse
- these axes are perpendicular
- tells you how to find these axes
- no cross terms

=== Exampe: Ellipse, hyperbola

principal axes are x,y
$
x^2/9 + y^2/25 = 1
$

$
x^2/9 - y^2/25 = 1
$

===  Ellipse or Hyperbola

$ 5*x^2 + 8*x*y + 5*y^2 = 1 $


Complete the square, using u(x,y), v(x,y)
- if sum, then ellipse
- if difference, then hyperbola

// Hint:  Consider $ l_1*c_1**2 + l_2*c_2^2 $   Find the eigenvalues for l; then eigenvectors for c
// c_1 and c_2 are functions of (x,y)

Matrix formulation:
Q(x,y) = [x y](5 4)[x y]^T = 1
               4 5
== Summations
// Without Indices

$sum x_i$

$sum x_i^2$

$sum x_i y_i$

// With Indices - Display Form

$sum_(i=1)^n x_i y_i$

== Independent Samples

$mu_(bar(x)_1 - bar(x)_2) = mu_1 - mu_2$
$sigma_(bar(x)_1 - bar(x)_2)^2 = frac(sigma_1^2, n_1) + frac(sigma_2^2, n_2)$
$mu_(hat(p)_1 - hat(p)_2) = p_1 - p_2$

$sigma_(hat(p)_1 - hat(p)_2)^2 = frac(p_1 (1 - p_1), n_1) + frac(p_2 (1 - p_2), n_2)$
== Chi-Square Test

$chi^2 = sum frac((O - E)^2, E)$
== Correlations

$SS_(x) = sum (x - bar(x))^2 = sum x^2 - frac((sum x)^2, n)$

$SS_(x, y) = sum (x - bar(x))(y - bar(y)) = sum x*y - frac((sum x)(sum y), n)$

$r = frac(SS_(x*y), sqrt(SS_(x*x) SS_(y*y)))$

== Regression

// Population Regression Line

$E(y) = alpha + beta x$
var(y) = sigma^2

// Least Squares Line

hat(y) = a + bx

where

b = frac(SS_(xy), SS_(xx))

and

$bar(y) = a + b bar(x)$

== Is this a line in 3D?

$ a x + b y + c z + d = 0 $

Are all quadratics equivalent to a conic section?

$ x^2 - y^2 - 2 y - 1 = 0 $

NO. This represents two lines. Factor as $ (x + y + 1)(x - y - 1) = 0 $

Lines: $y = x - 1$ and $y = -x - 1$.

== cetz.plot to plot!!

#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.3": plot 

#cetz.canvas({

  let range = (-3, 3)
  
  plot.plot(
    size: (6, 4), 
    x-tick-step: 1, 
    y-tick-step: 1, 
    {
      plot.add(
        domain: range, 
        x => x - 1,
        style: (stroke: blue)
      )
      plot.add(
        domain: range, 
        x => -x - 1,
        style: (stroke: red)
      )
    }
  )
})

== Can a line and surface intersect?

Here is how to present a line in 3D:

$ x = a + t u $
$ y = b + t v $
$ z = c + t w $

$t$ is a parameter. The surface is $F(x, y, z) = 0$.

The intersection becomes a polynomial in $t$, $ sum a_i t^i = 0 $.

But for $n > 4$, may not be closed form.

Numerical: as line approaches tangent, floating point error may prevent solution.

= Measure Theory Foundation of Probability

== Probability Space

#definition[
  A *probability space* is a triple $(Omega, cal(F), P)$:
  - $Omega$: *sample space* (set of all possible outcomes)
  - $cal(F)$: *sigma-algebra* on $Omega$ (the set of events)
  - $P$: *probability measure* $P : cal(F) -> [0,1]$
]

=== Sigma-Algebra

A *sigma-algebra* (or sigma-field) $cal(F)$ on a set $Omega$ is a collection of subsets of $Omega$ such that:
- $emptyset in cal(F)$ and $Omega in cal(F)$
- If $A in cal(F)$ then $A^c in cal(F)$ (closed under complement)
- If $A_1, A_2, ... in cal(F)$ then $union_(i=1)^infinity A_i in cal(F)$ (countable union)

The pair $(Omega, cal(F))$ is a *measurable space*.

The *Borel sigma-algebra* $cal(B)(bb(R))$ is the smallest sigma-algebra on $bb(R)$ containing all open intervals. It is the standard choice for real-valued random variables.

=== Probability Measure

A function $P : cal(F) -> [0,1]$ is a *probability measure* if:
1. $P(Omega) = 1$
2. For pairwise disjoint $A_1, A_2, ... in cal(F)$:
$P(union_(i=1)^infinity A_i) = sum_(i=1)^infinity P(A_i)$ (countable additivity)

== Random Variable

#definition[
  A *random variable* $X$ is a measurable function:
  $X : (Omega, cal(F)) -> (bb(R), cal(B)(bb(R)))$
  i.e. for every Borel set $B in cal(B)$, the preimage is an event:
  $X^(-1)(B) in cal(F)$
]

== Distribution and CDF

The *distribution* (or *law*) of $X$ is the pushforward probability measure on $bb(R)$:
$P_X (B) = P(X in B) = P(X^(-1)(B))$ for all $B in cal(B)(bb(R))$

The *cumulative distribution function (CDF)* is:
$F_X (x) = P_X((-infinity, x]) = P(X <= x)$

Properties: $F_X$ is non-decreasing, right-continuous, with limits $0$ at $-infinity$ and $1$ at $infinity$.

== Density as Radon-Nikodym Derivative

If $P_X$ is absolutely continuous w.r.t. Lebesgue measure $lambda$, the Radon-Nikodym theorem gives a density:
$f(x) = (dif P_X) / (dif lambda)(x)$ such that
$P_X (B) = integral_B f(x) dif x$ for all $B in cal(B)(bb(R))$

For discrete $X$, the PMF is the Radon-Nikodym derivative w.r.t. counting measure.

== Expectation as Lebesgue Integral

#definition[
  $E[X] = integral_Omega X(omega) dif P(omega)$
]

This single integral unifies:
- Discrete: $E[X] = sum_k x_k P(X = x_k)$
- Continuous: $E[X] = integral_(-infinity)^infinity x f(x) dif x$

== Why Measure Theory

- Rigorous limits: LLN and CLT rely on convergence theorems (Monotone Convergence, Dominated Convergence, Fatou)
- Sigma-algebras model *information*: filtrations for martingales, stopping times, stochastic processes
- Conditional expectation defined via Radon-Nikodym / $L^2$ projection
- Handles mixed, singular, and infinite-dimensional distributions

=== Non-Nice but Measurable PDF Examples

These examples show that measurability, not continuity or Riemann integrability, is the essential requirement for a valid PDF.

==== Example 1: Discontinuous on a set of positive measure

Let $C subset [0,1]$ be a *fat Cantor set*: nowhere dense, positive Lebesgue measure (say $lambda(C) = 1/2$).

$f(x) = 2 * I_C (x)$, for $x in [0,1]$

- $I_C$ is Borel measurable (C is Borel), so $f$ is measurable
- $integral_0^1 f(x) dif x = 2 lambda(C) = 1$, valid PDF
- $f$ is *nowhere continuous* (every point of $C$ is a boundary point), discontinuous on a set of positive measure
- Not Riemann integrable, but perfectly Lebesgue integrable

==== Example 2: Mixed distribution with an atom

$X = B * Z$ where $B tilde "Ber"(1/2)$ and $Z tilde N(0,1)$.

PDF w.r.t. dominating measure $mu = lambda + delta_0$ (Lebesgue + point mass at 0):

$f(x) = 1/2 delta_0 (x) + 1/2 * 1 / sqrt(2 pi) e^(-x^2 / 2)$

- Measurable; $mu$ is a sigma-finite measure
- Has a point mass at 0; not absolutely continuous w.r.t. Lebesgue alone
- Useful for zero-inflated models (spike at zero + continuous tail)

==== Example 3: Unbounded, integrable singularity

$f(x) = 1 / (2 sqrt(|x|)) I_([-1, 0) union (0, 1]) (x)$

- Measurable
- $integral_(-1)^1 f(x) dif x = 1$, valid PDF
- $f(x) -> infinity$ as $x -> 0$, but the singularity is Lebesgue integrable
- Not properly Riemann integrable (unbounded), but is improperly Riemann integrable and Lebesgue integrable

Key lesson: measurability is the only requirement for a valid PDF. Continuity, boundedness, and Riemann integrability are *not* necessary — and many useful distributions violate them.

= Linear Algebra (Zero Divisors / Non-trivial Nullspace)

$
A = mat(1,-1; 2,-2),\
v = vec(1,1)
$

=== non-trival solutions to homogenous equations
$A v = 0$ where neither $A$ nor $v$ is zero.

- A is *singular*: $det(A) = 0$, i.e. non-invertible, and there are non-trival solutions for $v$.
- $v$ lies in the *nullspace* (kernel) of $A$.
- This is a *zero divisor* in the ring of matrices: matrix rings are *not* integral domains because they have non-trivial zero divisors.
- An *integral domain* is a ring where `$ab = 0$` implies $a = 0$ or $b = 0$ — matrix rings violate this.


Example, where neither A nor x are 0, but product is:
$ A x = 0 $

$mat(2 2; 4 4)$ has det = 0, (linear dependent columns & columns)
then 

$vec(x_1, x_2) = c vec(1, -1)$
Neither A nor x are zero, but product is.

== Eigenvalue
$ A zeta = lambda zeta  $

has non-trival solutions if singular, require it
$matrixdet(A - lambda I) = 0 $

Let
$A = P D P^-1$
where columns of P are eigenvectors and if D exists

Find $D = y^T P^T A P y$


== Google Colab

 title List available models
from google.colab import ai

response = ai.generate_text("Explain integral domain in algebra, give simple example.   Output should be in typst format")

print(response)
 `@title` List available models
from google.colab import ai

ai.list_models()
response = ai.generate_text("Explain integral domain in algebra, give simple example.   Output should be in typst  format")
print(response)

Here is a clear and concise explanation of an integral domain in abstract algebra, formatted for Typst. 

You can save the code below with a `.typ` extension (e.g., `integral_domain.typ`) and compile it using the Typst compiler.

```typ

#set page(paper: "a4", margin: (x: 2cm, y: 2.5cm))
#set text(font: "Liberation Serif", size: 11pt)
#set par(justify: true)

#align(center)[
  #text(size: 18pt, weight: "bold")[Integral Domains in Algebra]
]

#v(1cm)

In abstract algebra, an *integral domain* is a special kind of ring that behaves very much like the familiar system of integers. It is a algebraic structure where multiplication is well-behaved, specifically because it lacks "zero divisors."

== Definition

A ring $(R, +, *)$ is called an *integral domain* if it satisfies the following four properties:

1. *Commutativity:* Multiplication is commutative. For all $a, b in R$,
   $a * b = b * a$

2. *Identity:* There exists a multiplicative identity element, typically denoted as $1$ (where $1 != 0$). For all $a in R$,
   $a * 1 = a$

3. *No Zero Divisors:* The ring has no non-zero elements that multiply to give zero. That is, if $a, b in R$ and
   $a * b = 0$
   then either $a = 0$ or $b = 0$ (or both).

4. *Associativity and Distributivity:* Like all rings, multiplication is associative, and multiplication distributes over addition.

#block(
  fill: rgb("f0f8ff"),
  inset: 12pt,
  radius: 4pt,
  stroke: 0.5pt + rgb("b0c4de"),
[
  *Key Takeaway:* In an integral domain, you can perform *cancellation*. If $a != 0$ and $a * b = a * c$, you can safely conclude that $b = c$. This is not true in all rings!
]
)

== The Standard Example: The Integers ($ZZ$)

The most intuitive example of an integral domain is the set of integers, denoted by $ZZ = {..., -3, -2, -1, 0, 1, 2, 3, ...}$, under normal addition and multiplication.

Let's check the properties:
- *Commutative ring with identity:* Yes, $a times b = b times a$, and the number $1$ acts as the identity ($a times 1 = a$).
- *No Zero Divisors:* If you multiply two integers and get $0$ (i.e., $a times b = 0$), it is physically impossible for both $a$ and $b$ to be non-zero. At least one of them *must* be $0$.

Thus, $(ZZ, +, times)$ is an integral domain.

== A Counter-Example (Not an Integral Domain)

To understand integral domains, it helps to see a ring that is *not* one. Consider the ring of integers modulo 6, denoted as $ZZ_6 = \{0, 1, 2, 3, 4, 5\}$.

In $ZZ_6$, arithmetic is performed modulo 6 (you divide by 6 and take the remainder).
Look at the elements $2$ and $3$. Neither of them is zero ($2 != 0$ and $3 != 0$). However, if we multiply them:

$
2 * 3 = 6 equiv 0 quad (mod 6)
$

Because $2*3 = 0$ in this ring, $2$ and $3$ are called *zero divisors*. 

Since $ZZ_6$ contains zero divisors, *$ZZ_6$ is not an integral domain.*

== Summary of Common Integral Domains

- $ZZ$ (The Integers)
- $QQ$ (The Rational Numbers)
- $RR$ (The Real Numbers)
- $CC$ (The Complex Numbers)
- Any polynomial ring $R[x]$ where $R$ is an integral domain (e.g., $ZZ[x]$)
\=== Features of this Typst markup:

- It uses standard Typst math notation eg

a#emph[b = b]a

- It structures the explanation with headings (#NormalTok("==");).
- It includes a highlighted "Key Takeaway" box using Typst's #NormalTok("#block"); function for visual clarity.

#Skylighting(([#NormalTok("## derivative");],
[#NormalTok("Modified from @perplexity <https://www.perplexity.ai/search/aefc7c0e-5fc4-4b54-8b52-91e4f736577f> ");],
[],
[#NormalTok("```{=typst}");],
[#NormalTok("// derivative.typ");],
[#NormalTok("//");],
[#NormalTok("// Notes: Derivatives of scalar and vector-valued functions and");],
[#NormalTok("// mean-square-error gradient descent for one linear neuron.");],
[],
[#NormalTok("= Derivatives of Vector-Valued Functions");],
[],
[#NormalTok("== Scalar Input, Scalar Output (single variable)");],
[#NormalTok("Suppose");],
[],
[#NormalTok("$");],
[#NormalTok("f: RR -> RR.");],
[#NormalTok("$");],
[],
[],
[#NormalTok("$");],
[#NormalTok("d f / d x");],
[#NormalTok("= f'(x)");],
[#NormalTok("$");],
[],
[#NormalTok("== Scalar Input, Vector Output");],
[],
[#NormalTok("Suppose");],
[],
[#NormalTok("$");],
[#NormalTok("bold(f)(x) = (f_1(x), f_2(x), f_3(x)),");],
[#NormalTok("$");],
[],
[#NormalTok("where each component takes one scalar input:");],
[],
[#NormalTok("$");],
[#NormalTok("f_i: RR -> RR.");],
[#NormalTok("$");],
[],
[#NormalTok("Then the derivative is found component-wise:");],
[],
[#NormalTok("$");],
[#NormalTok("d bold(f) / d x");],
[#NormalTok("= (f_1'(x), f_2'(x), f_3'(x)).");],
[#NormalTok("$");],
[],
[#NormalTok("The result is a vector in $RR^3$. Geometrically, it is the tangent");],
[#NormalTok("vector to the curve traced by $bold(f)(x)$ as $x$ changes.");],
[],
[#NormalTok("== Two Inputs, Vector Output");],
[],
[#NormalTok("Now suppose");],
[],
[#NormalTok("$");],
[#NormalTok("bold(f)(x, y)");],
[#NormalTok("= (f_1(x, y), f_2(x, y), f_3(x, y)),");],
[#NormalTok("$");],
[],
[#NormalTok("where each component has two scalar inputs:");],
[],
[#NormalTok("$");],
[#NormalTok("f_i: RR^2 -> RR.");],
[#NormalTok("$");],
[],
[#NormalTok("The derivative is the *Jacobian matrix*:");],
[],
[#NormalTok("$");],
[#NormalTok("D bold(f)(x, y)");],
[#NormalTok("=");],
[#NormalTok("mat(");],
[#NormalTok("  frac(partial f_1, partial x), frac(partial f_1, partial y);");],
[#NormalTok("  frac(partial f_2, partial x), frac(partial f_2, partial y);");],
[#NormalTok("  frac(partial f_3, partial x), frac(partial f_3, partial y),");],
[#NormalTok(").");],
[#NormalTok("$");],
[],
[#NormalTok("This is a $3 times 2$ matrix:");],
[],
[#NormalTok("- 3 rows, one for each output component.");],
[#NormalTok("- 2 columns, one for each input variable.");],
[],
[#NormalTok("For a small input change");],
[],
[#NormalTok("$");],
[#NormalTok("Delta bold(x)");],
[#NormalTok("=");],
[#NormalTok("vec(Delta x, Delta y),");],
[#NormalTok("$");],
[],
[#NormalTok("the corresponding output change is approximately");],
[],
[#NormalTok("$");],
[#NormalTok("Delta bold(f)");],
[#NormalTok("approx");],
[#NormalTok("D bold(f)(x, y) Delta bold(x).");],
[#NormalTok("$");],
[],
[#NormalTok("== General Form");],
[],
[#NormalTok("Let");],
[],
[#NormalTok("$");],
[#NormalTok("bold(f): RR^n -> RR^m,");],
[#NormalTok("$");],
[],
[#NormalTok("with input vector");],
[],
[#NormalTok("$");],
[#NormalTok("bold(x) = (x_1, x_2, ..., x_n)");],
[#NormalTok("$");],
[],
[#NormalTok("and output vector");],
[],
[#NormalTok("$");],
[#NormalTok("bold(f)(bold(x))");],
[#NormalTok("=");],
[#NormalTok("(f_1(bold(x)), f_2(bold(x)), ..., f_m(bold(x))).");],
[#NormalTok("$");],
[],
[#NormalTok("The Jacobian is");],
[],
[#NormalTok("$");],
[#NormalTok("J_bold(f)(bold(x))");],
[#NormalTok("=");],
[#NormalTok("mat(");],
[#NormalTok("  frac(partial f_1, partial x_1), frac(partial f_1, partial x_2), dots, frac(partial f_1, partial x_n);");],
[#NormalTok("  frac(partial f_2, partial x_1), frac(partial f_2, partial x_2), dots, frac(partial f_2, partial x_n);");],
[#NormalTok("  vdots, vdots, ddots, vdots;");],
[#NormalTok("  frac(partial f_m, partial x_1), frac(partial f_m, partial x_2), dots, frac(partial f_m, partial x_n),");],
[#NormalTok(").");],
[#NormalTok("$");],
[],
[#NormalTok("Its size is");],
[],
[#NormalTok("$");],
[#NormalTok("m times n.");],
[#NormalTok("$");],
[],
[#NormalTok("That is:");],
[],
[#NormalTok("- Number of rows = number of output components.");],
[#NormalTok("- Number of columns = number of input components.");],
[],
[#NormalTok("As local shorthand, one could write the size as");],
[],
[#NormalTok("$");],
[#NormalTok("|bold(f)| times |bold(x)|.");],
[#NormalTok("$");],
[],
[#NormalTok("Here, $|bold(v)|$ must be explicitly defined to mean the *number of");],
[#NormalTok("components* of vector $bold(v)$, rather than its usual possible meaning");],
[#NormalTok("of vector length or norm.");],
[],
[#NormalTok("= Gradient Descent for One Linear Neuron");],
[],
[#NormalTok("== Setup");],
[],
[#NormalTok("Consider a single linear neuron with:");],
[],
[#NormalTok("- Input vector $bold(x) in RR^n$.");],
[#NormalTok("- Weight vector $bold(w) in RR^n$.");],
[#NormalTok("- Scalar bias $b in RR$.");],
[#NormalTok("- Scalar prediction $hat(y) in RR$.");],
[],
[#NormalTok("The neuron computes");],
[],
[#NormalTok("$");],
[#NormalTok("hat(y) = bold(w)^T bold(x) + b.");],
[#NormalTok("$");],
[],
[#NormalTok("Suppose the training data consist of $N$ input--target pairs:");],
[],
[#NormalTok("$");],
[#NormalTok("{(bold(x)^(1), y^(1)), (bold(x)^(2), y^(2)), ..., (bold(x)^(N), y^(N))}.");],
[#NormalTok("$");],
[],
[#NormalTok("For datapoint $i$, the prediction is");],
[],
[#NormalTok("$");],
[#NormalTok("hat(y)^(i)");],
[#NormalTok("=");],
[#NormalTok("bold(w)^T bold(x)^(i) + b.");],
[#NormalTok("$");],
[],
[#NormalTok("== Mean Square Error");],
[],
[#NormalTok("The mean square error is");],
[],
[#NormalTok("$");],
[#NormalTok("E(bold(w), b)");],
[#NormalTok("=");],
[#NormalTok("frac(1, N)");],
[#NormalTok("sum_(i = 1)^N");],
[#NormalTok("(");],
[#NormalTok("  bold(w)^T bold(x)^(i) + b - y^(i)");],
[#NormalTok(")^2.");],
[#NormalTok("$");],
[],
[#NormalTok("Equivalently, if the residual for datapoint $i$ is");],
[],
[#NormalTok("$");],
[#NormalTok("r^(i)");],
[#NormalTok("=");],
[#NormalTok("hat(y)^(i) - y^(i)");],
[#NormalTok("=");],
[#NormalTok("bold(w)^T bold(x)^(i) + b - y^(i),");],
[#NormalTok("$");],
[],
[#NormalTok("then");],
[],
[#NormalTok("$");],
[#NormalTok("E(bold(w), b)");],
[#NormalTok("=");],
[#NormalTok("frac(1, N)");],
[#NormalTok("sum_(i = 1)^N (r^(i))^2.");],
[#NormalTok("$");],
[],
[#NormalTok("== Parameters");],
[],
[#NormalTok("Combine the weights and bias into one parameter vector:");],
[],
[#NormalTok("$");],
[#NormalTok("bold(theta)");],
[#NormalTok("=");],
[#NormalTok("vec(");],
[#NormalTok("  w_1,");],
[#NormalTok("  w_2,");],
[#NormalTok("  dots,");],
[#NormalTok("  w_n,");],
[#NormalTok("  b,");],
[#NormalTok(")");],
[#NormalTok("in RR^(n + 1).");],
[#NormalTok("$");],
[],
[#NormalTok("The error is then a scalar-valued function:");],
[],
[#NormalTok("$");],
[#NormalTok("E: RR^(n + 1) -> RR.");],
[#NormalTok("$");],
[],
[#NormalTok("== Jacobian of the Error");],
[],
[#NormalTok("Because the error has one scalar output and $n + 1$ parameter inputs,");],
[#NormalTok("its Jacobian has size");],
[],
[#NormalTok("$");],
[#NormalTok("1 times (n + 1).");],
[#NormalTok("$");],
[],
[#NormalTok("Symbolically,");],
[],
[#NormalTok("$");],
[#NormalTok("J_E(bold(theta))");],
[#NormalTok("=");],
[#NormalTok("mat(");],
[#NormalTok("  frac(partial E, partial theta_1),");],
[#NormalTok("  frac(partial E, partial theta_2),");],
[#NormalTok("  dots,");],
[#NormalTok("  frac(partial E, partial theta_(n + 1)),");],
[#NormalTok(").");],
[#NormalTok("$");],
[],
[#NormalTok("Writing the parameter components explicitly gives");],
[],
[#NormalTok("$");],
[#NormalTok("J_E(bold(w), b)");],
[#NormalTok("=");],
[#NormalTok("mat(");],
[#NormalTok("  frac(partial E, partial w_1),");],
[#NormalTok("  frac(partial E, partial w_2),");],
[#NormalTok("  dots,");],
[#NormalTok("  frac(partial E, partial w_n),");],
[#NormalTok("  frac(partial E, partial b),");],
[#NormalTok(").");],
[#NormalTok("$");],
[],
[#NormalTok("This Jacobian is the derivative of the scalar error with respect to all");],
[#NormalTok("parameters, written as a row vector.");],
[],
[#NormalTok("The gradient is commonly written as a column vector:");],
[],
[#NormalTok("$");],
[#NormalTok("grad E(bold(theta))");],
[#NormalTok("=");],
[#NormalTok("J_E(bold(theta))^T");],
[#NormalTok("=");],
[#NormalTok("vec(");],
[#NormalTok("  frac(partial E, partial w_1),");],
[#NormalTok("  frac(partial E, partial w_2),");],
[#NormalTok("  vdots,");],
[#NormalTok("  frac(partial E, partial w_n),");],
[#NormalTok("  frac(partial E, partial b),");],
[#NormalTok(").");],
[#NormalTok("$");],
[],
[#NormalTok("Thus:");],
[],
[#NormalTok("- The Jacobian of $E$ has shape $1 times (n + 1)$.");],
[#NormalTok("- The column-gradient $grad E$ has shape $(n + 1) times 1$.");],
[#NormalTok("- Both contain the same partial derivatives; they differ only by");],
[#NormalTok("  transpose convention.");],
[],
[#NormalTok("== Gradient Descent");],
[],
[#NormalTok("With learning rate $eta > 0$, gradient descent updates the parameter");],
[#NormalTok("vector by moving in the direction opposite the gradient:");],
[],
[#NormalTok("$");],
[#NormalTok("bold(theta)");],
[#NormalTok("arrow");],
[#NormalTok("bold(theta) - eta grad E(bold(theta)).");],
[#NormalTok("$");],
[],
[#NormalTok("Equivalently, for weights and bias:");],
[],
[#NormalTok("$");],
[#NormalTok("bold(w)");],
[#NormalTok("arrow");],
[#NormalTok("bold(w) - eta frac(partial E, partial bold(w)),");],
[#NormalTok("$");],
[],
[#NormalTok("$");],
[#NormalTok("b");],
[#NormalTok("arrow");],
[#NormalTok("b - eta frac(partial E, partial b).");],
[#NormalTok("$");],
[],
[#NormalTok("The negative-gradient direction is used because it is the local");],
[#NormalTok("direction in parameter space that decreases the error most rapidly.");],));



