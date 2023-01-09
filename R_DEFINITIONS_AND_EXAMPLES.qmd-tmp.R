 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
#| label: setup
#| include: false

knitr::opts_chunk$set(
  echo = TRUE, collapse=TRUE) 


chunk_hook  <- knitr::knit_hooks$get("chunk")
knitr::knit_hooks$set(chunk = function(x, options) {
  x <- chunk_hook(x, options)
  paste0("\\linespread{0.5}\n", x, "\n\n\\linespread{2}")
})
 
 
 
 
f  <- function(x) {
    x^2}
# create a call
cl  <- call("f", 3)
# display f as unevaluated f(3)
cl
##  Test for call.
    is.call(f)
    is.call("f")

    is.call(cl)

##  To evaluate a call.
    eval(cl)
# [1] 9
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
#| label: primitive 
#| include: true

### check several functions
y  <- list(sin, "sin", c, switch, typeof, sqrt, `if`, `+`)

as.data.frame(type = sapply(y, typeof))
sapply(y, is.primitive)
sapply(y, is.function)
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
f = function(x) x
x = 6
identical(f(x), f(6))
 
 
 
x=6
identical(quote(x), quote(6))
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

#| label: symbol 
#| include: true
#| collapse: true
x <- 10   
typeof(x)
is.symbol(x)

is.symbol(as.name(x))
is.symbol(s <- as.symbol(x) )
typeof(s)
s
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
f  <- function(x=NULL) {
    x^2
}

formals(f)      ## pairlist
body(f)         ## language, $\code{call}$
environment(f)  ## environment

args(f)         ## closure
 
 
## returns expression
parse(text= '2^2')

## fails, does not know a is.
# parse(text= '2a')
 
 
 
 
 
f  <- function(x=NULL) {
}

cl  <- call("f", list(x=2))
cl
is.function(cl)
is.call(cl)


##  Args must be evaluated, even if f is unevaluted 
    x  <- 2
    call("f", list(x))
    #call("f", list(x=a))   # throws error
 
 
 
res  <- substitute(x+a) 
res
is.call(res)
