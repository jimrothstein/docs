jim
2023-12-20

https://rfordatascience.slack.com/archives/C052ATK1ESF/p1684168506576779

     ‘expr()’ defuses an R expression with injection support.
     It is equivalent to ‘base::bquote()’.

``` r
x = bquote(y)
x
```

    y

``` r
# y

bquote(mtcars[[x]])  ## x
```

    mtcars[[x]]

``` r
# mtcars[[x]]

bquote(mtcars[[.(x)]])
```

    mtcars[[y]]

``` r
# mtcars[[y]]

r = bquote(mtcars[[.(x)]])
r
```

    mtcars[[y]]

``` r
eval(r)
```

    Error in eval(r): object 'y' not found

``` r
y = "mpg"


##  trying to do remainder of his codd
bquote(mtcars[[ ..(quote(as.name(x))) ]] , splice=T    )
```

    Error in unquote.list(e): can only splice vectors

``` r
bquote(mtcars[[ .(eval(deparse(substitute(as.name(x))))) ]] )
```

    mtcars[["as.name(x)"]]

``` r
eval(as.name(a))
```

    Error: object 'a' not found

``` r
bquote(mtcars[[ .eval(deparse(x))]])
```

    mtcars[[.eval(deparse(x))]]

``` r
bquote(mtcars[[ ..(as.name(x))    ]], splice=T )
```

    Error in unquote.list(e): can only splice vectors

This is June’s

``` r
library(rlang)
x <- expr(y)
x                   ## y
```

    y

``` r
# `.data[[` injects **as string**
expr(.data[[x]])
```

    .data[["y"]]

``` r
#> .data[["y"]]

# That's a special property of `.data[[` not generally of `[[`
expr(mtcars[[x]])
```

    mtcars[[x]]

``` r
#> mtcars[[x]]
expr(mtcars[[!!x]])
```

    mtcars[[y]]

``` r
#> mtcars[[y]]

# Mimicing the `.data[[` behavior requires `!!` + `as_label()`
expr(mtcars[[!!as_label(x)]])
```

    mtcars[["y"]]

``` r
#> mtcars[["y"]]

# Also a fun aside - `data_sym()` is cool:
data_sym(x)
```

    .data$y

``` r
#> .data$y
```
