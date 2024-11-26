

    PURPOSE:  Collect all notes, links, references for R to here.
    NO installation (R, Rstudio, etc) in this file

<!--
&#10;KEEP as .qmd file
&#10;-->

## Compare

``` r
a=c(1,1,1)
b=c(2,2,2)
`+`(a,b)
a+b
sum(a+b)
```

    [1] 3 3 3

    [1] 3 3 3

    [1] 9

**AST** Diagram expression into various parts (calls, symbols,
constants?) Metacode refers to manipulation of this tree. NSE refers to
tinker with how fct evaluates arguments.

**attach** - add df/list/datafile/env to *search list*, at a `pos` and
`name` - for database, can access column names, unquoted. -
detach(mtcars) to remove from search list - compare to `with` -
https://stat.ethz.ch/R-manual/R-devel/library/base/html/attach.html

``` r
search()
```

    [1] ".GlobalEnv"        "package:stats"     "package:graphics" 
    [4] "package:grDevices" "package:utils"     "package:datasets" 
    [7] "package:methods"   "Autoloads"         "package:base"     

``` r
mtcars
```

                         mpg cyl  disp  hp drat    wt  qsec vs am gear carb
    Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
    Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
    Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
    Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
    Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
    Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
    Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
    Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
    Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
    Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
    Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
    Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
    Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
    Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
    Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
    Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
    Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
    Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
    Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
    Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
    Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
    Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
    AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
    Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
    Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
    Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
    Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
    Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
    Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
    Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
    Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
    Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2

``` r
# hp   # object 'hp' not found

# add to search list
?attach
attach(mtcars)
search()
```

     [1] ".GlobalEnv"        "mtcars"            "package:stats"    
     [4] "package:graphics"  "package:grDevices" "package:utils"    
     [7] "package:datasets"  "package:methods"   "Autoloads"        
    [10] "package:base"     

``` r
hp  # no error
```

     [1] 110 110  93 110 175 105 245  62  95 123 123 180 180 180 205 215 230  66  52
    [20]  65  97 150 150 245 175  66  91 113 264 175 335 109

``` r
# remove 
detach(mtcars)

# remove package 
search()
```

    [1] ".GlobalEnv"        "package:stats"     "package:graphics" 
    [4] "package:grDevices" "package:utils"     "package:datasets" 
    [7] "package:methods"   "Autoloads"         "package:base"     

explain process: capture unevaluated code; manipulate it; later evaluate

- defuse, substitution, quasiquotation,
- injection (into unevaluated expression)
- defuse & inject are opposites
- embrase {{}}, tells function must first evalute the unevaluated
  content inside {{}}

**bindings:** - link between name (symbol) and an object - EX: f (name)
and the definition (function(x) {…}) -
https://r-pkgs.org/dependencies-mindset-background.html#sec-dependencies-search

**bquote** SEE String Interpolation **Call** A call is an unevaluated
function, together with arguments that are (Rmk: .Call() is unrelated,
calls C function)

### create a call

- See: R-lang 6.5, call, sys.call v match.call

``` r
f  <- function(x) {
    x^2}
cl  <- call("f", 3)
# display f as unevaluated f(3)
cl
## f(3)

##  Test for call.
    is.call(f)
## [1] FALSE
    is.call("f")
## [1] FALSE
    is.call(cl)
## [1] TRUE

##  To evaluate a call.
    eval(cl)
## [1] 9
```

Like symbol, expression, call is typeof ‘language’.

    three kinds of language objects that are available for modification, calls,
    expressions, and functions
    r-lang 6.1

is.call() is T only for calls. See: “in try…
4010_match_call_examples.Rmd” \*\*\*

**Calling environment of a function** To run, a function must be called.
Calling environment refers to environment of the calling function. Also
called parent environment. Not to be confused with a function
environment. See example ?? The `calling function` is function actually
making the call. f = function()g() \# f is calling function

**Currying** Takes a function, partially evaluates, and returns as new
function. Example: f(x,y,z) evaluated at z=a, returns g(x,y) = f(x,y,a)

**context** internal, stack of C structs, track execution (see R
Internals 1.4) Allows flow control \| error reporting (traceback) \|
sys.\* to work. (except sys.status)

Closures create context. internals do not. primitives only in special
situations. (sys.frame, sys.call count closures from either end of
context stack) TODO - do not understand.

Contexts are Not counted, not reported, not on stack, and coder has no
access to these functions. REF: R Internals 1.4

**byte code** “Readable” concise instructions; not machine code; no user
access; use JIT compiler or interpeter

**Deparse** See **parse**.

**defuse** Synonym for capture unevaluated code, stop immediate
evaluation,

**Evaluation or execution environment** In R, a function runs in an
environment specific to that function. Also referred to as frame or
context. This frame holds evaluation environment. The frame ends when
the function completes.

**Evaluation** parser, evaluator SEE R-lang definitions 2.1.3

    When a user types a command at the prompt (or when an expression is read from a
    file) the first thing that happens to it is that the command is transformed by
    the parser into an internal representation. The evaluator executes parsed R
    expressions and returns the value of the expression. All expressions have a
    value. This is the core of the language. 

https://cran.r-project.org/doc/manuals/r-release/R-lang.html#Evaluation-of-expressions

**Expression**

[R language
definition](https://cran.r-project.org/doc/manuals/R-lang.html#Evaluation)
From r-lang 2.1.4

   In R one can have objects of type “expression”. An expression
contains one or  
   more statements. A statement is a syntactically correct collection of
tokens.  
   Expression objects are special language objects which contain
\*\*parsed but  
   unevaluated R statements.\*\* The main difference is that an
expression object can  
   contain several such expressions. Another more subtle difference is
that  
   objects of type “expression” are only evaluated when explicitly
passed to eval,  
   whereas other language objects may get evaluated in some unexpected
cases.

(emphasis added)

Interactively, a single, valid R statement that returns an value is
called an expression.

An expression also a formal language construction with list structure.
The function expression() takes an R object and returns expression.
Note: a `statement` is code that may do things (side effects) but does
not return anything. Hadley defines expression as an “object that stores
quoted code without evaluating it.” (tidyr cheat sheet) SEE evaluation.

**Expression v Language** R expressions based on list and can be broken
down further. Often these are language pieces. Lanugage use pairlists.

**First Class** - A function can also be used as an argument to another
function. Example: lapply(list(), mean)

**Frame vs Environment** Frame refers to the calling stack of functions.
Environment, in R, is property of function, where it looks to find
non-local variables.

**Function, properties** formals(f) arguments in function defintion
body(f) code environment(f) finds values of non-formal (non-local)
variables where the function was created. **Higher Order Function**
Function that takes another function as an argument and …

**immutable**

**Interactive vs. Non-Interactive** R, or S, originally designed to be
interactive, ie command and response at console. .R, .Rmd, Rscript, R
CMD BATCH (TODO: some error conditions do not work in BATCH ??)

**Lambda Calculus** Instead of naming function (f(x,y) = x^2 + y^2)
create abstraction. (x,y) –\> x^2 + y^2. Or instead of g(x) = x + 2;
write lambdax.x+2. Easy to chain

**Lexical Scope** How R function finds *unbound* variables: in
environment where function was created. **Dynamic Scope** Method to find
variables in Call Stack at runtime. R uses Lexical Scope, however the R
Language allows coder to select environment to evaluate variables. (REF:
June Choe Slack/Nov 3 2021)

Scheme added (?) Portion of code in which binding applies to a
variable??

In R, an “evaluator” find any “unbound symbols” (in an expression) by
using variable bindings in effect when created.

**match** - match.arg - match.call - match.fun

**namespace:** REF:
https://cran.r-project.org/doc/manuals/r-release/R-ints.html#Namespaces
Namespaces are environments associated with packages ( + base pkg,
special) A package pkg defines two environments namespace:pkg and
package:pkg: it is package:pkg that can be attached and form part of the
search path.

- Tieryn(2003)
  http://homepage.divms.uiowa.edu/~luke/R/namespaces/morenames.pdf

examples: SEE 9009\_

Treat code as data: ability to manipulate code before evaluated. **NSE,
Non-Standard Evaluation** - https://edwinth.github.io/blog/nse/ -
https://thomasadventure.blog/posts/understanding-nse-part1/ \$ (uses
NSE), \[\[ (does not)

**Standard evaluation** In se expressions are evaluated immediately, ie
the code and all variables are found the value is inserted. (SEE Brodie,
rev() example)

**operator** (non-R) An operate takes a function f and returns new
function g. Example: $f'(x) = g(x)$

**package:**

**Pairlist**

**Parent Frame of function** If function g() is called inside body of
function f, the g has the parent frame (aka calling environment) that is
execution environment of f. DRAW Diagram

**Parse** Convert a string (character vector) into an R Expression (ie
code), which is NOT a string. Motivation is to setup R object for
manipulation *before* evaluation. Parse(\*.R) removes comments. Note:
after parsing, the result is NOT character(1), a string.

**Deparse** converts an R Expression to a string (character vector) .

``` r
x="a + b"
parse(text=x)   # expression(a+b)
```

    expression(a + b)

``` r
# but, does not evaluate, b/c it quotes immediately
lobstr::ast(parse(text=x))
```

    █─parse 
    └─text = x 

``` r
# 
lobstr::ast(parse(text=!!x))
```

    █─parse 
    └─text = "a + b" 

``` r
?ast
```

Parse & Deparse are NOT? opposites. See Murdoch

(latex) parse: string ==`>` R expression (error if invalid) deparse: R
expression ==`>` string (actually: structure(expression(), scrfile)

**options** Temporary vs global vs local. Read R manual.(TODO)

- `if`, `+`, sin, sqrt

- C functions

- SEE ADV-R Chapter 6, code: 059 (myoldcode)

- SEE
  https://nsaunders.wordpress.com/2018/06/22/idle-thoughts-lead-to-r-internals-how-to-count-function-arguments/

- SEE R Internals/Ch 2

- Do not understand at deeper level

``` r
#   TODO
#   R complains about putting function in data.frame

### check several functions
y  <- list(sin, "sin", c, switch, typeof, sqrt, `if`, `+`)

quote(sin)
quote("sin")
quote(c)
quote(sqrt)
quote(`if`)
quote(`+`)
deparse(y)
data.frame(object = y,
           typeof = sapply(y, typeof),
           is.primitive = sapply(y, is.primitive),
           is.function = sapply(y, is.function))
```

**R** R has two parents: S, based on C, Fortran for statistics. R also
has functional component, based on Scheme.

    It is possible to abuse R, using it more like S code. (?)

    **Reification** Abstract idea to treat all code as "data", including functions, structures, etc. This means all such objects can be modified by code. C has. (TODO)


    **  Referencial Transparency

    A function f is \textbf{referencial  transparent} IF replacing x (an expression) with its value
    returns same.

    ::: {.cell}

    ```{.r .cell-code}
    f = function(x) x
    x = 6
    identical(f(x), f(6))

<div class="cell-output cell-output-stdout">

    [1] TRUE

</div>

:::

However, not all R functions have this property.

``` r
x=6
identical(quote(x), quote(6))               ##  F
```

    [1] FALSE

**Referencial Semantics** Changes to values are done in memory. There is
no copy. (Example: why important. Also other properties of functions,
inverse, etc)

**Search List** Heirarchy of packages: First is globalenv, followed by
packages in reverse order. Loading a package not necessary attach.
library() will load and attach.

**side effect** A function may access global and formal variables
read-only. Only local variables may be modified. - a popup? console
output? no changes to files, no graphs

**srcref** Is an attribute of all functions. The body() contains code
only. The srcref contains original code, plus comments and formatting.

**Substitution** When used in function with formal variable, substitute
stops evaluation, captures the user’s code and returns a call (ie
unevaluated )

  substitute returns the parse tree for the (unevaluated) expression
expr, substituting any variables bound in env.

**syntax** How code looks, is { in right place, a grammar.

**Syntax Sugar** Syntax to make easier for human to express or write
code efficiently.

**semantics** What does the code DO?

**String** String (“5+5”) is NOT call. No such thing as evaluating a
string. See 0210\_ You can PARSE a string and then manipulate it.
Simpler to eval a quote(5+5) to return the sum.

**String Interpolation**

Method to substitute the value of expr into a string. Can think of it as
`template` with holes. SEE:
https://www.r-bloggers.com/2018/03/math-notation-for-r-plot-titles-expression-and-bquote/

bquote examples SEE 410

``` r
x = 5 
bquote(x == .(x))
```

    x == 5

### Symbol

[3.1.2 Symbol
lookup](https://cran.r-project.org/doc/manuals/r-release/R-lang.html#Symbol-lookup)
\| In this small example y is a symbol and its value is 4. A symbol is
an R object too,

Q: This is true, mathematically: a*(b+c) = a*b + a\*c. In practice, I
get to choose to evaluate (insert values) with the LHS or the RHS,
expecting the exact same result had I done the other. Relationship to
Symbol in Metaprogramming?

symbol - human readale, points to area in memory, immutable, not a
string

stored in a lookup table? Two symbols can be compared, if equal then
same memory. (is symbol evulated ??) SEE:
https://stackoverflow.com/questions/8846628/what-exactly-is-a-symbol-in-lisp-scheme

``` r
y = 4
y
```

    [1] 4

``` r
is.symbol(y)
```

    [1] FALSE

``` r
is.name(y)
```

    [1] FALSE

``` r
is.object(y)
```

    [1] FALSE

``` r
# but
y = as.symbol(y)
is.symbol(y)
```

    [1] TRUE

``` r
y
```

    `4`

See **R Lang Ref: 2.1.3.1** Symbol (aka name), usually name of R object.
Use \`as.name() to coerce to symbol or quote() or atoms of parse()

    In order to manipulate symbols we need a new element in our language: the
    ability to quote a data object. Suppose we want to construct the list (a
    b). We can’t accomplish this with (list a b), because this expression
    constructs a list of the values of a and b rather than the symbols
    themselves. This issue is well known in the context of natural languages,
    where words and sentences may be regarded either as semantic entities or as
    character strings (syntactic entities). The common practice in natural
    languages is to use quotation marks to indicate that a word or a sentence
    is to be treated literally as a string of characters. For instance, the
    first letter of “John” is clearly “J.” If we tell somebody “say your name
    aloud,” we expect to hear that person’s name. However, if we tell somebody
    “say ‘your name’ aloud,” we expect to hear the words “your name.” Note that
    we are forced to nest quotation marks to describe what somebody else might
    say. We can follow this same practice to identify lists and symbols that
    are to be treated as data objects rather than as expressions to be
    evaluated. However, our format for quoting differs from that of natural
    languages in that we place a quotation mark (traditionally, the single
    quote symbol ’) only at the beginning of the object to be quoted. We can
    get away with this in Scheme syntax because we rely on blanks and
    parentheses to delimit objects. Thus, the meaning of the single quote
    character is to quote the next object. Now we can distinguish between
    symbols and their values:

https://stackoverflow.com/questions/8846628/what-exactly-is-a-symbol-in-lisp-scheme
\## Tidy Evaluation - pronouns, to distinguish between objects in
environment ls() .env$cyl and
  not associated with the df and data columns in df .data$cyl (df)

**Variable** Three kinds:  
\* formals,x: f = function(x= … )  formalArgs() \* local,a: f =
function() {a =10}  
\* free, unbound, global, z: f = function() (print(z))

------------------------------------------------------------------------

**function**

``` r
f  <- function(x=NULL) {
    x^2
}

formals(f)      ## pairlist
```

    $x
    NULL

``` r
body(f)         ## language, $\code{call}$
```

    {
        x^2
    }

``` r
environment(f)  ## environment
```

    <environment: R_GlobalEnv>

``` r
args(f)         ## closure
```

    function (x = NULL) 
    NULL

``` r
## returns expression
parse(text= '2^2')
```

    expression(2^2)

``` r
## fails, does not know a is.
# parse(text= '2a')
```

**call**

``` r
f  <- function(x=NULL) {
}

cl
```

    f(3)

``` r
cl  <- call("f", list(x=2))
is.function(cl)
```

    [1] FALSE

``` r
is.call(cl)
```

    [1] TRUE

``` r
##  Args must be evaluated, even if f is unevaluted 
    x  <- 2
    call("f", list(x))
```

    f(list(2))

``` r
    #call("f", list(x=a))   # throws error
```

``` r
res  <- substitute(x+a) 
res
```

    x + a

``` r
is.call(res)
```

    [1] TRUE

:::

## Questions

``` r
#   Explain how Base R finds column name
library(dplyr)
```


    Attaching package: 'dplyr'

    The following objects are masked from 'package:stats':

        filter, lag

    The following objects are masked from 'package:base':

        intersect, setdiff, setequal, union

``` r
data(starwars)
col = "hair_color"
sum(is.na(starwars[, eval(col) ]) )
```

    [1] 5

``` r
sum(is.na(starwars[, col ]) )
```

    [1] 5

## {{< include _meta_questions.qmd >}}

#### K-nearest neighbors, K is given

$\forall x \in X$ , which could be any dimension , is already assigned
to a region. For a new point, examine its K nearest neighbors who decide
by majority vote which region $x$ belongs to. SEE: wine example SEE:
Gaglow book.

#### Bias-Var Tradeoff.

With non-zero `noise`, of variance $\sigma^{2}$ the best approximate to
$f(x)$ will always have non-zero error: Isn’t there a relation betwee E,
VAR? like x and p ?

$$
Error = E(f_hat) + Var(f_hat) + \sigma^{2}
$$

SEE Berkeley Crash Course; Matloff

### 2023-05-16, Why Rlang? to june

I’m in rlang book club, not up-to-date, and debating WHY? work through
rlang:: I think more logical to approach rlang as follows:

(1)learn *some* lisp (scheme), then (2) learn base R (as language, to
manipulate), and only (3) then work through rlang:: *code* as an EXAMPLE
of magic one can do with lanuage.

If you have time and willing, feel free to answer to the entire group,
if you wish. Or, you are too busy, don’t worry about reply. I think
others have similar questions.

Here are few points that might clarify where I am:

- R about 4 years, including tidyverse
- struggle with rlang:: not because ideas are especially difficult but
  becuase I find package to be verbose, with imprecise definitions and
  built upon a structure of many other packages. And I do not have all
  the ideas nailed down.
- the ideas, once I draw picture or think a bit, seem very logical,
  useful and *cool* (or do I fool myself?)
- So not why focus on ideas first (ie scheme or equivlent), then see how
  R implements, and then build something new.
- Me: minimal C; minimal Lisp.
- But baffled why so much time being spent on *.data\[\[\]\]*, pronouns,
  new notation. What is wrong with just bquote? And if bquote doesn’t
  cut it in certain instances show why *.data\[\[\]\]* code improves
  upon bquote.
- I’ve also tried to write a glossary + code examples for each
  metaprogramming idea in base R (but only got more confused)

## section{R}

### R, DEFINTIONS, TERSE EXAMPLES

            See ~/code/try_things_here/BASE/

#### R, Definitions

- **object** Most computer languages do NOT allow direct access to
  memory. In R, various data structures (called `Objects` provide
  access. Use symbols or variables to access the the `Objects`. Unique
  to R(?), symbols are also objects and can be manipulated (example?).

- **intrepreted vs compiler code** The former is source code that is
  executed line-by-line. The later is machine code. Between the two, is
  wide spectrum

- **struct** (C, non-R) a collection that can hold multiple types, eg
  `db     record`.

<!-- -->

        struct record
        {
            char name[32];
            int age;
            float debt;
        }
    #   To use:
        struct record X    # X is variable, struct is keyword, `record` is struct

- **monad** - As goal, seek functions with (1) no side effects (2) can
  be composed. Function factories can be useful, esp where variables can
  be ‘stored’ in environment. SEE BRUNO video.

}

### Shiny and DT

- embed html, see !so 69471577

<!-- -->

    ## Bugzilla < https://bugs.r-project.org/ >
    -   Besides R bugs good place to see intersection of documentation, R and bugs.

    -   <https://vroom.r-lib.org> package uses new internal data structure *ALTREP* <https://www.r-project.org/dsc/2017/slides/dsc2017.pdf>

            
    ***

    ::: {.callout-note}
    All R, math, statistics  notes here. 
    :::

    [call](https://stat.ethz.ch/R-manual/R-devel/RHOME/library/base/html/call.html)
    [expression](https://stat.ethz.ch/R-manual/R-devel/RHOME/library/base/html/expression.html)
    [language](https://stat.ethz.ch/R-manual/R-devel/RHOME/library/base/html/is.language.html)

    [mode]](https://stat.ethz.ch/R-manual/R-devel/RHOME/library/base/html/mode.html)
    [typeof](https://stat.ethz.ch/R-manual/R-devel/RHOME/library/base/html/typeof.html)
    [vector](https://stat.ethz.ch/R-manual/R-devel/RHOME/library/base/html/vector.html)
    [substitute](https://stat.ethz.ch/R-manual/R-devel/RHOME/library/base/html/substitute.html)


    ## {{< include _future_work.qmd >}}
    ## Environemnts, Namespacds
    -   conflicted package.

    #{{< include _references.qmd >}}

### parquet, database (r4ds Chapter 22)

- parquet file is now popular, esp large datasets (csv too slow)
- Arrow package set of tools; to convert csv to parquet; to translate
  queries from dplyr and run them againt parquet
