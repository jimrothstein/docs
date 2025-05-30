jim
2023-12-20

    PURPOSE:  Collect all notes, links, references for R to here.
    NO installation (R, Rstudio, etc) in this file

    write 310_R_notes.qmd AFTER understand! 
    including link to file where work actually done!

<!--
KEEP as .qmd file
-->

## TODO

explain process: capture unevaluated code; manipulate it; later evaluate

- defuse, substitution, quasiquotation,
- injection (into unevaluated expression)
- defuse & inject are opposites
- embrase {{}}, tells function must first evalute the unevaluated
  content inside {{}}
- one idea is to carry unevaluated code and envir to another function;
  for either maniputlation or evalution.

## Compare

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
library(rlang)
search()
 [1] ".GlobalEnv"        "package:rlang"     "package:stats"    
 [4] "package:graphics"  "package:grDevices" "package:utils"    
 [7] "package:datasets"  "package:methods"   "Autoloads"        
[10] "package:base"     

head(mtcars, n=3)
               mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4     21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710    22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
tryCatch(hp,    # object 'hp' not found ,
        error = function(e) print(" There is no hp in environent \n")
)
[1] " There is no hp in environent \n"

# add to search list
attach(mtcars)
search()
 [1] ".GlobalEnv"        "mtcars"            "package:rlang"    
 [4] "package:stats"     "package:graphics"  "package:grDevices"
 [7] "package:utils"     "package:datasets"  "package:methods"  
[10] "Autoloads"         "package:base"     
hp  # now no error
 [1] 110 110  93 110 175 105 245  62  95 123 123 180 180 180 205 215 230  66  52
[20]  65  97 150 150 245 175  66  91 113 264 175 335 109

# remove from search list
detach(mtcars)

# remove package 
search()
 [1] ".GlobalEnv"        "package:rlang"     "package:stats"    
 [4] "package:graphics"  "package:grDevices" "package:utils"    
 [7] "package:datasets"  "package:methods"   "Autoloads"        
[10] "package:base"     
```

**bindings:** - link between name (symbol) and an object - EX: `f` as a
symbol and `function definition` (function(x) {…}) -
https://r-pkgs.org/dependencies-mindset-background.html#sec-dependencies-search

**bquote** SEE String Interpolation **Call** A call is an unevaluated
function, together with arguments that are (Rmk: .Call() is unrelated,
calls C function)

### create a call

**create a call** - See: R-lang 6.5, call, sys.call vs match.call

``` r
f  <- function(x) {
    x^2}
cl  <- call("f", 3)
# display f as unevaluated f(3)
cl
f(3)

##  Test for call.
    is.call(f)
[1] FALSE
    is.call("f")
[1] FALSE
    is.call(cl)
[1] TRUE

##  To evaluate a call.
    eval(cl)
[1] 9

call("f", 2+3)
f(5)
# call("f", sin(x))
call("f", sin(x <- pi/2))
f(1)
# call("f", sin (x + y))
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

``` r
# x is evaluated in calling env (globalenv()) here), but value of x,y is not changed in that environment
y=pi/2
sin(x = y + .001)
[1] 0.9999995
y
[1] 1.570796
x
[1] 1.570796
```

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

**eval()** Note: rlang::expr(x) quotes (or converts ) arg to expression

``` r
x = 2
y = 10
try ( 
eval(x)
)
[1] 2
try(
  {
  eval(expr(x))
  eval(expr(x + y))
  eval(expr(x + y), list(x = 10, y=20))    # 
  eval(expr(x + y), rlang::env(x = 10, y=20))  # new envir
  # eval does not quote 1st argument
  eval(print(x+1), rlang::env(x=2000))  # 3, not 2001
  eval(expr(print(x + 1)), list(x=1000))  # 3
  eval(print(x+1)) #3
  }
)
[1] 3
[1] 1001
[1] 3
[1] 3

rlang::is_expression(rlang::expr(x)) #T
[1] TRUE
```

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

from **Mailund** (metaprogramming, Chapter 3)

“Every statement you have in your programs is also an expression that
evaluates to some value (which, of course, might be NULL). This includes
control structures and function bodies. You can consider everything an
expression; it’s just that some expressions involve evaluating several
contained expressions for their side effects before returning the result
of the last expression they evaluate. From a metaprogramming
perspective, though, you are most interested in expressions you can get
**your hands on and examine, modify, or evaluate within a program.**”
Examples:

``` r
# expression examples:
rlang::is_expression(quote(x)) #T
[1] TRUE
rlang::is_expression(quote(1)) #T
[1] TRUE
rlang::is_expression(quote(x <- 3 + y))   #T
[1] TRUE
rlang::is_expression(quote(if (x  > z) print("yes")))   #T
[1] TRUE

# body of function
rlang::is_expression(body(f = function() x^y))   # T
[1] TRUE
```

**Expression v Language** R expressions based on list and can be broken
down further. Often these are language pieces. Lanugage use pairlists.

**First Class** - A function can also be used as an argument to another
function. Example: lapply(list(), mean)

**Frame vs Environment** Frame refers to the calling stack of functions.
Environment, in R, is property of function, where it looks to find
non-local variables.

**Function** - formals(f) returns formal arguments of function, with
default values, but NO evaluation, NO look in environment. formals are
actually pairlist. Can obtain/modify this pairlist. Formal arguments
become promises in the evaluation environment.

``` r
w = 2
f = function(x,y = 1, z = w + function() print("hi"))  x + y + z
formals(f)
$x


$y
[1] 1

$z
w + function() print("hi")
formals(f) |> class()   # pairlist
[1] "pairlist"

# can obtain, modify formals
formals(f)[[2]]
[1] 1
formals(f)[[2]]
[1] 1
formals(f)[[2]] <- quote(a) 
f    # changed
function (x, y = a, z = w + function() print("hi")) 
x + y + z
```

- body(f) returns an expression, the R code to run, unevaluated, no
  substitution

``` r
body(f)
x + y + z
body(f) |> class()  # call
[1] "call"
body(f) |> rlang::is_expression()   # T
[1] TRUE
```

- environment(f)

``` r
environment(f)
<environment: R_GlobalEnv>
# attributes of function
```

Obtain attributes, even names and defualt values

``` r
attributes(formals(f))
$names
[1] "x" "y" "z"
names(formals(f))
[1] "x" "y" "z"
formals(f)[["y"]]   # a
a
```

code environment(f) finds values of non-formal (non-local) variables
where the function was created.

**Higher Order Function** Function that takes another function as an
argument and …

**inject** insert expression into AST?

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

**local**

local leaves nothing inenviron after running; easy to use; (TODO) study
internals

``` r
local({
a <- 10
b <- 100
f <- function(x,y) x + y
call("f", list(a,b))
})
f(list(10, 100))
```

**match** - match.arg - match.call - match.fun

**namespace:** REF:
https://cran.r-project.org/doc/manuals/r-release/R-ints.html#Namespaces
Namespaces are *environments* associated with packages ( + base pkg,
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

**Parse** (TODO) Parse returns expression or creates ast structure?
Convert a string (character vector, such as “x+y”) into an R Expression
(ie code), which is NOT a string. Motivation is to setup R object for
manipulation *before* evaluation. Parse(\*.R) removes comments. Note:
after parsing, the result is NOT character(1), a string.

*parse_expr()* returns string, given an expression (tip: should not do
this often) Hadley 18.4

**Deparse** converts an R Expression to a string (character vector) .

``` r
x="a + b"
parse(text=x)   # expression(a+b)
expression(a + b)

# but, does not evaluate, b/c it quotes immediately
lobstr::ast(parse(text=x))
Error in loadNamespace(x): there is no package called 'lobstr'

# 
lobstr::ast(parse(text=!!x))
Error in loadNamespace(x): there is no package called 'lobstr'
?ast
No documentation for 'ast' in specified packages and libraries:
you could try '??ast'
```

Parse & Deparse are NOT? opposites. See Murdoch

(latex) parse: string ==`>` R expression (error if invalid) deparse: R
expression ==`>` string (actually: structure(expression(), scrfile)

**promise** Hadley: 18.4 captures expression and environment

**options** Temporary vs global vs local. Read R manual.(TODO)

- `if`, `+`, sin, sqrt

- C functions

- SEE ADV-R Chapter 6, code: 059 (myoldcode)

- SEE
  https://nsaunders.wordpress.com/2018/06/22/idle-thoughts-lead-to-r-internals-how-to-count-function-arguments/

- SEE R Internals/Ch 2

- Do not understand at deeper level

**R** R has two parents: S, based on C, Fortran for statistics. R also
has functional component, based on Scheme.

It is possible to abuse R, using it more like S code. (?)

**Reification** Abstract idea to treat all code as “data”, including
functions, structures, etc. This means all such objects can be modified
by code. C has. (TODO)

**Referencial Transparency**

A function f is IF replacing x (an expression) with its value returns
same.

``` r
f = function(x) x
x = 6
identical(f(x), f(6))
[1] TRUE
```

However, not all R functions have this property.

``` r
x=6
identical(quote(x), quote(6))               ##  F
[1] FALSE
```

**quote** SEE (Scheme) does not look for bindings - returns expression;
stops evaluation; - in particular, allows programmer to then manipulate
code, essential

``` r
e= quote(x + y + z)  # x + y + z
length(e)   # 3
e[[3]]  <- quote(z + 3)
e # x + y + (z + 3)

### check several functions

# but sin in double quotes is NOT a function
quote("sin") |> typeof()   # character

# L is list of symbols
L = list(quote(sin), quote(c), quote(sqrt), quote(`if`), `+`))
sapply(L, typeof)

# Note:
quote(sqrt) |> typeof()   # "symbol"
quote(sqrt) |> typeof()  |> typeof()   # "character"

(data.frame(object = as.character(L),
           type = sapply(L, typeof)
           ))
```

**quosure**

expression is evaluated in given env

``` r
# evaluates to 2
new_quosure(expr(a + 1), env(a = 1)) |> eval_tidy()
[1] 2

# 11
new_quosure(expr(a + 1), env(a = 10)) |> eval_tidy()
[1] 11
```

However, teal:: qenv stores resulting env, after evala

``` r
library(teal.code)
Error in library(teal.code): there is no package called 'teal.code'
teal.code::qenv() |> within({a <- 1; b <- a + 2}) |> get_env() |> as.list()
Error in loadNamespace(x): there is no package called 'teal.code'

#$a [1] 1

#$b [1] 3
```

Please see **quo** as a tool for evaluation to better control
**evaluation environment** whereas qenv more as a tool for
reproducibility that **captures the outcome of evaluation**. One is
“before” and the other one is “after”.

REF: Advanced-R ~ 6.5 Data structure with expression + environment. WHY?
With dot (…) often pass several of these rlang::eval_tidy() \# takes 1
arg (simpler) but base:eval(, ) \# requires 2 args **Referencial
Semantics** Changes to values are done in memory. There is no copy.
(Example: why important. Also other properties of functions, inverse,
etc) R passes by value. (So argument is evaluated before the call?)

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
unevaluated ) Substitution is NOT eval.

In globalenv, substitute returns symbol or call.

``` r
x = 3
substitute(x)
x
is.symbol(substitute(x)) #T
[1] TRUE

substitute(x+y)
x + y
is.symbol(substitute(x+y)) #F
[1] FALSE
is.call(substitute(x+y))   #T
[1] TRUE
```

But in a function, `substitute` captures unevaluated expression; use
`deparse` for string representation.

``` r
f = function(x) substitute(x)
x = 3
f(x+ y+z)   # x + y + z
x + y + z

g = function(x) deparse(substitute(x))
g(x + y + z)   # "x+y+z"
[1] "x + y + z"
```

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
x == 5
```

### Symbol

[3.1.2 Symbol
lookup](https://cran.r-project.org/doc/manuals/r-release/R-lang.html#Symbol-lookup)
\| In this small example y is a symbol and its value is 4. A symbol is
an R object too,

Q: This is true, mathematically: a*(b+c) = a*b + a\*c. In practice, I
get to choose to evaluate (insert values) with the LHS or the RHS,
expecting the exact same result had I done the other. Relationship to
Symbol in Metaprogramming?

**symbol** - human readale, points to area in memory, immutable, not a
string, not a value, not set of instructions. In LISP (and R?) you
EVALUATE symbols to get a value.

stored in a lookup table? Two symbols can be compared, if equal then
same memory. (is symbol evulated ??) SEE:
https://stackoverflow.com/questions/8846628/what-exactly-is-a-symbol-in-lisp-scheme

``` r
y = 4
y
[1] 4
is.symbol(y)
[1] FALSE
is.name(y)
[1] FALSE
is.object(y)
[1] FALSE

# but
y = as.symbol(y)
is.symbol(y)
[1] TRUE
y
`4`
```

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

### within()

Given an environ, evaluate expresson (also useful with datasets)

``` r
a=100
b=200
z = with(globalenv(), expr = {z= a+b} )
z
[1] 300

z = with(mtcars, expr = {z = log(hp)})  # column only
z = within(mtcars, expr = {z=log(hp)})  # entire dataset
head(z)
                   mpg cyl disp  hp drat    wt  qsec vs am gear carb        z
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4 4.700480
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4 4.700480
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1 4.532599
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1 4.700480
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2 5.164786
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1 4.653960
```

------------------------------------------------------------------------

**function**

``` r
f  <- function(x=NULL) {
    x^2
}

formals(f)      ## pairlist
$x
NULL
body(f)         ## language, $\code{call}$
{
    x^2
}
environment(f)  ## environment
<environment: R_GlobalEnv>

args(f)         ## closure
function (x = NULL) 
NULL
```

``` r
## returns expression
parse(text= '2^2')
expression(2^2)

parse(text= '2*a')
expression(2 * a)
```

**call**

``` r
f  <- function(x=NULL) {
}

cl
f(3)
cl  <- call("f", list(x=2))
is.function(cl)
[1] FALSE
is.call(cl)
[1] TRUE


##  Args must be evaluated, even if f is unevaluted 
    x  <- 2
    call("f", list(x))
f(list(2))
    #call("f", list(x=a))   # throws error
```

``` r
res  <- substitute(x+a) 
res
x + a
is.call(res)
[1] TRUE
```

## Questions

``` r
#   Explain how Base R finds column name
library(dplyr)
Error in library(dplyr): there is no package called 'dplyr'
data(starwars)
Warning in data(starwars): data set 'starwars' not found
col = "hair_color"
sum(is.na(starwars[, eval(col) ]) )
Error: object 'starwars' not found
sum(is.na(starwars[, col ]) )
Error: object 'starwars' not found
```

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

### Shiny, ShinyLive, webR, webassembly

    **webassembly** Code, assembler-like?, byte-code-like? with very compact binary format and has API **javascript** can natively(?) use; runs fast.  C, Rust et al can be compiled (with tools) to webassembly.  Why **JS** ?  JS easily talks to HTML widget, components ...
    **webR::** package downloads installs R binaries for use in webassembly.
    **ShinyLive** 4 pieces, shinylive assets (includes version of webR to Run R in browser, plus View()), R Shiny package; python version; quarto extension 

    Regular Shiny app can run in browser (no external server).  All the pieces R, Shiny app, Shiny server converted to webassembly or otherise hosted in browser and/or cache.
    Read:   https://blog.djnavarro.net/posts/2023-04-09_webr/, 
    It is not magic:  much parsing, grammar and generating JS modules:  
    -  https://github.com/TravisYeah/lezer-r
    -  https://lezer.codemirror.net/
    -  For parsing R, see R Language Manuals, Ch 10 parsing.

### Shiny - Reactive

- observers register callback with reactive values objects (which passes
  to server, to monitor all the callbacks), best article:
  https://shiny.posit.co/r/articles/build/understanding-reactivity/

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


    ## Environemnts, Namespacds
    -   conflicted package.

### parquet, database (r4ds Chapter 22)

- parquet file is now popular, esp large datasets (csv too slow)
- Arrow package set of tools; to convert csv to parquet; to translate
  queries from dplyr and run them againt parquet

### Following `References` was removed and now added back (11/2024)…

### Metaprogramming, NSE

- Hadley, Advanced R, version 1 (Expressions)
- Quoting/Eval: Lionel: https://rpubs.com/lionel-/programming-draft  
- https://rpubs.com/lionel-/tidyeval-introduction
- https://rpubs.com/lionel-/tidyeval-dplyr-recipes
- {{}} \* https://www.tidyverse.org/blog/2019/06/rlang-0-4-0/
- https://rpubs.com/lionel-/superstache Brodie Gaslam -
  https://www.brodieg.com/2020/05/05/on-nse/ , Mailund - Metaprogramming
  R Journal, Murdock R Language Definition

### Articles

- Quoting/Eval: Lionel: https://rpubs.com/lionel-/programming-draft  

- https://rpubs.com/lionel-/tidyeval-introduction

- https://rpubs.com/lionel-/tidyeval-dplyr-recipes

- {{}} \* https://www.tidyverse.org/blog/2019/06/rlang-0-4-0/

- https://rpubs.com/lionel-/superstache Brodie Gaslam -
  https://www.brodieg.com/2020/05/05/on-nse/

- https://www.rostrum.blog/2023/03/03/getparsedata/ (parse, tokens, more
  advanced)

- https://renkun.me/2020/11/08/using-parse-data-to-analyze-r-code/
  (parse(), XPATH, rlanguage server)

- function masking/pkgs:
  https://www.r-bloggers.com/2013/09/control-the-function-scope-by-the-r-package-namescope/
  (using namespace to control scop)

- {}} -
  https://www.r-bloggers.com/2019/06/curly-curly-the-successor-of-bang-bang-2/

- env stack -
  https://www.r-bloggers.com/2014/12/tips-on-non-standard-evaluation-in-r/

- quoting, dplyr -
  https://www.r-bloggers.com/2019/07/bang-bang-how-to-program-with-dplyr/

- 2012 namespace pkg, by Hadley, et al :
  https://cran.r-project.org/web/packages/namespace/index.html

- **Examples**

- http://zevross.com/blog/2018/09/11/writing-efficient-and-streamlined-r-code-with-help-from-the-new-rlang-package/
  (mostly ggplot2)

- Murdoch, R Journal vol 2/2 2010

- statisticsglob.com (several parse examples)

- <https://statisticsglobe.com/parse-deparse-expression-r-function>

- \<advanced-r-solutions.rbind.io/expressions.html\>

- Tierney, codeTools ?

### Manuals:

- R-exts:package-ns:
  https://cran.r-project.org/doc/manuals/R-exts.html#Package-namespaces

- R-ints - 1.2
  https://cran.r-project.org/doc/manuals/r-release/R-ints.html#Environments-and-variable-lookup -
  1.4 C structs, Contexts
  (https://cran.r-project.org/doc/manuals/r-release/R-ints.html#Contexts) -
  1.5 When is argument evaluated? R-Lang
  <https://cran.r-project.org/doc/manuals/R-lang.html>  
  - 2.1.3 Language Objects (calls, expressions, names) - 3 Evaluation -
  6 Compute on Language:
  https://cran.r-project.org/doc/manuals/r-release/R-lang.html#Computing-on-the-language

- ns-load:
  https://stat.ethz.ch/R-manual/R-devel/library/base/html/ns-load.html

- getFromNamespace:
  https://stat.ethz.ch/R-manual/R-devel/library/utils/html/getFromNamespace.html

- **stackoverflow**

- https://stackoverflow.com/questions/46834655/whats-the-difference-between-substitute-and-quote-in-r

- https://stackoverflow.com/questions/14988722/in-r-what-does-loaded-via-a-namespace-and-not-attached-mean

- {{}}https://stackoverflow.com/questions/62791997/what-is-the-embracing-operator

- 

- **Posit**

- ns, but not in package:
  https://community.rstudio.com/t/is-it-dangerous-to-create-a-namespace-for-functions-in-a-script-without-a-package/91141

### Packages using metaprogramming; environments

    -   wrapr https://winvector.github.io/wrapr/index.html useful?
    -   lintr  (parses)
    -   rlangserver
    -   envnames:: code for working with env, older https://github.com/mastropi/envnames
    -   

https://statisticsglobe.com/parse-deparse-expression-r-function \###
LISP & R

Holiday Reading !??

Many years ago, one of my freshman college roommates walked in the door
speaking high praises for LISP.  
For some of us, it takes a longer to catch on. Over the weekend, I read
through the “EVAL” chapter (Chapter 3) of Common LISP (
https://www.cs.cmu.edu/~dst/LispBook/) (Tourteszky, Introduction to
Common LISP - 1990).

“So that’s what R is trying to do!”

Seems that LISP is cleaner way to introduce the many list-like
structures of R and how they built, passed, evaluated or otherwise
manipulated.

Then I read a chapter of this book and it too greatly helped with R.
More light bulbs went on.

Metaprogramming in R
(https://www.amazon.com/exec/obidos/ASIN/1484228804/acmorg-20) by Thomas
Mailund (also:

More from Thomas Mailund:
https://mailund.github.io/r-programmer-blog/2018/09/20/scoping-rules-and-nse/)
