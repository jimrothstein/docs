# 910_basic_conditions_NOTES.rmarkdown
jim
2025-05-29

<!--   KEEP as qmd -->

## To Do

- convert latex dependencies
- convert to .qmd

## 910_basic_conditions.qmd

SEE also: ~/code/try_things_here/ADVANCED_R/BOOK/0800_Ch8\_\*

## Diagram

- This file for my notes: basic try-catch/conditions.
- Second file is for custom conditions and uses S3 tools.

## Topics to include:

- basic try/catch/finally
- gotchas
- traceback
- throwing with stop, warning and signalCondition
- catching: with handlers
- adding class=
- decomposing thrown conditions

## Notes on R `condition system`

- overall mechanism to handle conditions (aka: exceptions, errors,
  warnings)
- **code** signals (or throws) a condition.
- `condition system` matches condition and invokes the best handler
  function.

### Condition

- S3 object, constructor is simpleCondition() minimal contains 2
  char\[1\] (strings): “message” and “call”

- message is for user, call refers to function where condition
  occurred.  

- Hadley prefers to not include call.

- Hierarchy: condition; subclasses: simpleCondition, exception, warning
  … Each can subclassed, such as simpleException.

- Built-in simple\*() constructors

- More details in code.

### Handler (aka error handling)

- a regular R function, with at least one arg for condition object.
- Two flavors:
  - Exiting handler (mostly for errors) does not allow code to continue.
  - Calling handler (mostly for non-errors) handles (aka modify or
    swallow) the condition and allows code to continue, just a regular
    function returns control.

## start basic

``` r
## blunt
  sqrt("abc")
```

          ## Error in sqrt("abc"): non-numeric argument to mathematical function

``` r
## better
  tryCatch( sqrt("abc"),
    error = function(e) e
  )
```

          ## <simpleError in sqrt("abc"): non-numeric argument to mathematical function>

## simpleCondition: built-in subclass of condition object

- not much in book.

``` r
formals(simpleCondition)
```

          ## $message
          ## 
          ## 
          ## $call
          ## NULL

``` r
args(simpleCondition)
```

          ## function (message, call = NULL) 
          ## NULL

``` r
# create one
s  <- base::simpleCondition("jim")

# examine s
s
```

          ## <simpleCondition: jim>

``` r
str(s, max.depth=1)
```

          ## List of 2
          ##  $ message: chr "jim"
          ##  $ call   : NULL
          ##  - attr(*, "class")= chr [1:2] "simpleCondition" "condition"

``` r
class(s)
```

          ## [1] "simpleCondition" "condition"

``` r
inherits(s, "condition")  # T
```

          ## [1] TRUE

``` r
typeof(s)  # boring list
```

          ## [1] "list"

``` r
conditionMessage(s) # jim
```

          ## [1] "jim"

``` r
conditionCall(s)   # call where occured?
```

          ## NULL

``` r
# simpleError 
e  <- simpleError("jim1")
e
```

          ## <simpleError: jim1>

``` r
str(e, max.depth=1)
```

          ## List of 2
          ##  $ message: chr "jim1"
          ##  $ call   : NULL
          ##  - attr(*, "class")= chr [1:3] "simpleError" "error" "condition"

``` r
# see how it work, first base:
tryCatch( {stop("jim1")
          print("never gets here")
    },

         error = function(e) e )
```

          ## <simpleError in doTryCatch(return(expr), name, parentenv, handler): jim1>

``` r
#  This creates an error, but does not signal (or throw it) 
tryCatch( {simpleError("jim1")
          print("never gets here")
    },

         error = function(e) e )
```

          ## [1] "never gets here"

``` r
#  Ahh, bbut this thows error, then catches, and never return to print line.
tryCatch({signalCondition(
  errorCondition("jim1", call="I made this up")
 )
   print("never gets here")
    },

         error = function(e) e )
```

          ## <error in "I made this up": jim1>

``` r
# Examine the object returned.
r  <- tryCatch( {signalCondition(errorCondition("jim1", call="I made this up"))
          print("never gets here")
    },

         error = function(e) e )

# we have the condition, it is r
str(r)
```

          ## List of 2
          ##  $ message: chr "jim1"
          ##  $ call   : chr "I made this up"
          ##  - attr(*, "class")= chr [1:2] "error" "condition"

``` r
inherits(r, "condition")  # T
```

          ## [1] TRUE

``` r
conditionCall(r)
```

          ## [1] "I made this up"

## So far, focused on simpleCondition and none of other classes. Before

proceeding, now examine handlers
