jim
2025-08-11

## NOTES on \*.rda

1.  Why use \*.rda? Data included in package must be \*.rda format; CRAN
    checks (?)

    SEE:

- Thomas-Neitmann, Nov 2022:
  (“https://github.com/pharmaverse/admiral/issues/1562) also \#1501
- !so
- pkg book, section 7.1 (https://r-pkgs.org/data.html#sec-data-data)

2.  The load() function retrieves an \*.rda dataset as a side-effect. It
    returns it to the current environment (typically globalenv()) and
    clobber existing file with same name. The load() function can cause
    confusion and one reason why people often prefer \*.rds.
    \[`loadRDS()` behaves the way we expect for \*.rds files\].

3.  Because, load() returns the dataset as a side-effect, I observe in
    admiral a few different (and clever) techniques to work with it.

### Examples

retrieve - method 1, also clobbers  
(returns ds to globalenv)  

    load(file.path("./BASE","XXX.rda"))
    x=get("ds")
    x

use new environment, e  

    e = new.env()
    load(file.path("./BASE","XXX.rda"), envir= e ) 
    x=get("ds", envir = e)
    x
    rm(e)

from sdtmchecks, uses function  

    #' eval=FALSE

    load_prior <- function() {
        load("data/sdtmchecksmeta.RData")
        existing_df <- sdtmchecksmeta
        ## remove the old version that is part of the package
    prior <- load_prior()

from roak_pilot

    #' invisible(lapply(rdas, load, envir = oak_pkg_env))

admiral data-raw/create-dose …., alternative method to SAVE rda

with usethis::

    #  create dose_freq_lookup.rda in data/
    usethis::use_data(dose_freq_lookup, overwrite = TRUE)

from tidytlg, no bzip2?

``` r
save(cdisc_adsl, file = "data/cdisc_adsl.rda")
```

4.  NOTE: For files included in package, the easiest way may be:

<!-- -->

    library(pharmaverseadam)
    adae <- pharmaverse::adae

But I want to check memory usage (TODO)

``` r
library(lobstr)
(m0 = lobstr::mem_used())
library(pharmaverseadam)
(m1 = lobstr::mem_used())

adae <- pharmaverseadam::adae
(m2 = lobstr::mem_used())

advs <- pharmaverseadam::advs
adsl <- pharmaverseadam::adsl
lobstr::mem_used()
```

\`\`\`

5.  To minimize confusion, therefore, I want to suggest picking a common
    way to saving and retrieving intermediate \*.rda files.
