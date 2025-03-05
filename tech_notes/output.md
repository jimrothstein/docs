# Date and Time Imputation


# Introduction

This vignette is broken into three major sections. The first section
briefly explores the imputation rules used in `{admiral}`. The second
section focuses on imputation functions that work on vectors with lots
of small examples to explore the imputation rules. These
**vector-based** functions form the backbone of `{admiral}`’s more
powerful functions `derive_vars_dt()` and `derive_vars_dtm()` for
building ADaM dataset. The final section moves into more detailed
examples that a user might face while working on ADaMs in need of
`---DT` and `---DTM` variables.

## Required Packages

The examples of this vignette require the following packages.

``` r
library(admiral)
library(lubridate)
library(tibble)
library(dplyr, warn.conflicts = FALSE)
```

# Imputation Rules

Date and time is collected in SDTM as character values using the
extended [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. For
example, `"2019-10-9T13:42:00"`. It allows that some parts of the date
or time are missing, e.g., `"2019-10"` if the day and the time is
unknown.

The ADaM timing variables like `ADTM` (Analysis Datetime) or `ADY`
(Analysis Relative Day) are numeric variables. They can be derived only
if the date or datetime is complete. Therefore `{admiral}` provides
imputation functions which fill in missing date or time parts according
to certain imputation rules.

In `{admiral}` users will primarily use two functions `derive_vars_dt()`
and `derive_vars_dtm()` for date and datetime imputations respectively.
In all other functions where dates can be passed as an argument, we
expect full dates or datetimes (unless otherwise specified), so if any
possibility of partials then these functions should be used as a first
step to make the required imputation.

The functions that need to do date/time imputation follow a rule that we
have called **Highest Imputation**, which has a corresponding argument
in all our functions called `highest_imputation`. The rule is best
explained by working through the examples below, but to put it briefly,
this rule allows a user to control which components of the DTC value are
imputed if they are missing.

The default imputation for `_dtm()` functions, e.g. `impute_dtc_dtm()`,
`derive_vars_dtm()`, is “h” (hours). A user can specify that that no
imputation is to be done by setting `highest_imputation = n`. However,
for for `_dt()` functions, e.g. `impute_dtc_dt()`, `derive_vars_dt()`
the default imputation is already set as `highest_imputation = "n"`.

Care must be taken when deciding on level of imputation. If a component
is at a higher level than the highest imputation level is missing,
`NA_character_` is returned. For example, for `highest_imputation = "D"`
`"2020"` results in `NA_character_` because the month is missing.

We encourage readers to explore in more detail the `highest_imputation`
options in both the `_dtm()` and `_dt()` function documentations and in
the examples below.

## Imputation on a Vector

In our first example, we will make use of `impute_dtc_dtm()` on
`2019-10` setting `highest_imputation = "M"`. The argument
`date_imputation` and `time_imputation` are given expressed inputs of
the imputation we would like to see done.

``` r
impute_dtc_dtm(
  "2019-10",
  highest_imputation = "M",
  date_imputation = "01-01",
  time_imputation = "00:00:00"
)
#> [1] "2019-10-01T00:00:00"
```

Next we impute using `2019-02`, which if done naively can result in
invalid dates, e.g.,

``` r
impute_dtc_dtm(
  "2019-02",
  highest_imputation = "M",
  date_imputation = "02-31",
  time_imputation = "00:00:00"
)
#> [1] "2019-02-31T00:00:00"
```

Therefore the keywords `"first"` or `"last"` can be specified in
`date_imputation` to request that missing parts are replaced by the
first or last possible value - giving us a valid date!

``` r
impute_dtc_dtm(
  "2019-02",
  highest_imputation = "M",
  date_imputation = "last",
  time_imputation = "00:00:00"
)
#> [1] "2019-02-28T00:00:00"
```

For dates, there is the additional option to use keyword `"mid"` to
impute missing day to `15` or missing day and month to `06-30`, but note
the different behavior below depending on the `preserve` argument for
the case when month only is missing:

``` r
dates <- c(
  "2019-02",
  "2019",
  "2019---01"
)
impute_dtc_dtm(
  dates,
  highest_imputation = "M",
  date_imputation = "mid",
  time_imputation = "00:00:00",
  preserve = FALSE
)
#> [1] "2019-02-15T00:00:00" "2019-06-30T00:00:00" "2019-06-30T00:00:00"
impute_dtc_dtm(
  dates,
  highest_imputation = "M",
  date_imputation = "mid",
  time_imputation = "00:00:00",
  preserve = TRUE
)
#> [1] "2019-02-15T00:00:00" "2019-06-30T00:00:00" "2019-06-01T00:00:00"
```

If you wanted to achieve a similar result by replacing any missing part
of the date with a fixed value `06-15`, this is also possible, but note
the difference in days for cases when month is missing:

``` r
dates <- c(
  "2019-02",
  "2019",
  "2019---01"
)
impute_dtc_dtm(
  dates,
  highest_imputation = "M",
  date_imputation = "06-15",
  time_imputation = "00:00:00"
)
#> [1] "2019-02-15T00:00:00" "2019-06-15T00:00:00" "2019-06-15T00:00:00"
```

## Imputation Level

The imputation level, i.e., which components are imputed if they are
missing, is controlled by the `highest_imputation` argument. All
components up to the specified level are imputed.

``` r
dates <- c(
  "2019-02-03T12:30:15",
  "2019-02-03T12:30",
  "2019-02-03",
  "2019-02",
  "2019"
)

# Do not impute
impute_dtc_dtm(
  dates,
  highest_imputation = "n"
)
#> [1] "2019-02-03T12:30:15" NA                    NA                   
#> [4] NA                    NA

# Impute seconds only
impute_dtc_dtm(
  dates,
  highest_imputation = "s"
)
#> [1] "2019-02-03T12:30:15" "2019-02-03T12:30:00" NA                   
#> [4] NA                    NA

# Impute time (hours, minutes, seconds) only
impute_dtc_dtm(
  dates,
  highest_imputation = "h"
)
#> [1] "2019-02-03T12:30:15" "2019-02-03T12:30:00" "2019-02-03T00:00:00"
#> [4] NA                    NA

# Impute days and time
impute_dtc_dtm(
  dates,
  highest_imputation = "D"
)
#> [1] "2019-02-03T12:30:15" "2019-02-03T12:30:00" "2019-02-03T00:00:00"
#> [4] "2019-02-01T00:00:00" NA

# Impute date (months and days) and time
impute_dtc_dtm(
  dates,
  highest_imputation = "M"
)
#> [1] "2019-02-03T12:30:15" "2019-02-03T12:30:00" "2019-02-03T00:00:00"
#> [4] "2019-02-01T00:00:00" "2019-01-01T00:00:00"
```

For imputation of years (`highest_imputation = "Y"`) see next section.

## Minimum/Maximum Dates

In some scenarios the imputed date should not be before or after certain
dates. For example an imputed date after data cut off date or death date
is not desirable. The `{admiral}` imputation functions provide the
`min_dates` and `max_dates` argument to specify those dates. For
example:

``` r
impute_dtc_dtm(
  "2019-02",
  highest_imputation = "M",
  date_imputation = "last",
  time_imputation = "last",
  max_dates = list(ymd("2019-01-14"), ymd("2019-02-25"))
)
#> [1] "2019-02-25T23:59:59"
```

It is ensured that the imputed date is not after any of the specified
dates. Only dates which are in the range of possible dates of the DTC
value are considered. The possible dates are defined by the missing
parts of the DTC date, i.e., for “2019-02” the possible dates range from
“2019-02-01” to “2019-02-28”. Thus “2019-01-14” is ignored. This ensures
that the non-missing parts of the DTC date are not changed.

If the `min_dates` or `max_dates` argument is specified, it is also
possible to impute completely missing dates. For
`date_imputation = "first"` the `min_dates` argument must be specified
and for `date_imputation = "last"` the `max_dates` argument. For other
imputation rules imputing the year is not possible.

``` r
# Impute year to first
impute_dtc_dtm(
  c("2019-02", NA),
  highest_imputation = "Y",
  min_dates = list(
    ymd("2019-01-14", NA),
    ymd("2019-02-25", "2020-01-01")
  )
)
#> [1] "2019-02-25T00:00:00" "2020-01-01T00:00:00"

# Impute year to last
impute_dtc_dtm(
  c("2019-02", NA),
  highest_imputation = "Y",
  date_imputation = "last",
  time_imputation = "last",
  max_dates = list(
    ymd("2019-01-14", NA),
    ymd("2019-02-25", "2020-01-01")
  )
)
#> [1] "2019-02-25T23:59:59" "2020-01-01T23:59:59"
```

# Imputation Flags

ADaM requires that date or datetime variables for which imputation was
used are accompanied by date and/or time imputation flag variables
(`*DTF` and `*TMF`, e.g., `ADTF` and `ATMF` for `ADTM`). These variables
indicate the highest level that was imputed, e.g., if minutes and
seconds were imputed, the imputation flag is set to `"M"`. The
`{admiral}` functions which derive imputed variables are also adding the
corresponding imputation flag variables.

Note: The `{admiral}` datetime imputation function provides the
`ignore_seconds_flag` argument which can be set to `TRUE` in cases where
seconds were never collected. This is due to the following from ADaM IG:
For a given SDTM DTC variable, if only hours and minutes are ever
collected, and seconds are imputed in `*DTM` as `00`, then it is not
necessary to set `*TMF` to `"S"`.

# Imputation Functions

`{admiral}` provides the following functions for imputation:

- `derive_vars_dt()`: Adds a date variable and a date imputation flag
  variable (optional) based on a –DTC variable and imputation rules.
- `derive_vars_dtm()`: Adds a datetime variable, a date imputation flag
  variable, and a time imputation flag variable (both optional) based on
  a –DTC variable and imputation rules.
- `impute_dtc_dtm()`: Returns a complete ISO 8601 datetime or `NA` based
  on a partial ISO 8601 datetime and imputation rules.
- `impute_dtc_dt()`: Returns a complete ISO 8601 date (without time) or
  `NA` based on a partial ISO 8601 date(time) and imputation rules.
- `convert_dtc_to_dt()`: Returns a date if the input ISO 8601 date is
  complete. Otherwise, `NA` is returned.
- `convert_dtc_to_dtm()`: Returns a datetime if the input ISO 8601 date
  is complete (with missing time replaced by `"00:00:00"` as default).
  Otherwise, NA is returned.
- `compute_dtf()`: Returns the date imputation flag.
- `compute_tmf()`: Returns the time imputation flag.

# Examples

## Create an Imputed Datetime and Date Variable and Imputation Flag Variables

The `derive_vars_dtm()` function derives an imputed datetime variable
and the corresponding date and time imputation flags. The imputed date
variable can be derived by using the `derive_vars_dtm_to_dt()` function.
It is not necessary and advisable to perform the imputation for the date
variable if it was already done for the datetime variable. CDISC
considers the datetime and the date variable as two representations of
the same date. Thus the imputation must be the same and the imputation
flags are valid for both the datetime and the date variable.

``` r
ae <- tribble(
  ~AESTDTC,
  "2019-08-09T12:34",
  "2019-04-12",
  "2010-09",
  NA_character_
) %>%
  derive_vars_dtm(
    dtc = AESTDTC,
    new_vars_prefix = "AST",
    highest_imputation = "M",
    date_imputation = "first",
    time_imputation = "first"
  ) %>%
  derive_vars_dtm_to_dt(exprs(ASTDTM))
```

| AESTDTC          | ASTDTM              | ASTDTF | ASTTMF | ASTDT      |
|:-----------------|:--------------------|:-------|:-------|:-----------|
| 2019-08-09T12:34 | 2019-08-09 12:34:00 | NA     | S      | 2019-08-09 |
| 2019-04-12       | 2019-04-12 00:00:00 | NA     | H      | 2019-04-12 |
| 2010-09          | 2010-09-01 00:00:00 | D      | H      | 2010-09-01 |
| NA               | NA                  | NA     | NA     | NA         |

## Create an Imputed Date Variable and Imputation Flag Variable

If an imputed date variable without a corresponding datetime variable is
required, it can be derived by the `derive_vars_dt()` function.

``` r
ae <- tribble(
  ~AESTDTC,
  "2019-08-09T12:34:56",
  "2019-04-12",
  "2010-09",
  NA_character_
) %>%
  derive_vars_dt(
    dtc = AESTDTC,
    new_vars_prefix = "AST",
    highest_imputation = "M",
    date_imputation = "first"
  )
```

| AESTDTC             | ASTDT      | ASTDTF |
|:--------------------|:-----------|:-------|
| 2019-08-09T12:34:56 | 2019-08-09 | NA     |
| 2019-04-12          | 2019-04-12 | NA     |
| 2010-09             | 2010-09-01 | D      |
| NA                  | NA         | NA     |

## Impute Time without Imputing Date

If the time should be imputed but not the date, the `highest_imputation`
argument should be set to `"h"`. This results in `NA` if the date is
partial. As no date is imputed the date imputation flag is not created.

``` r
ae <- tribble(
  ~AESTDTC,
  "2019-08-09T12:34",
  "2019-04-12",
  "2010-09",
  NA_character_
) %>%
  derive_vars_dtm(
    dtc = AESTDTC,
    new_vars_prefix = "AST",
    highest_imputation = "h",
    time_imputation = "first"
  )
```

| AESTDTC          | ASTDTM              | ASTTMF |
|:-----------------|:--------------------|:-------|
| 2019-08-09T12:34 | 2019-08-09 12:34:00 | S      |
| 2019-04-12       | 2019-04-12 00:00:00 | H      |
| 2010-09          | NA                  | NA     |
| NA               | NA                  | NA     |

## Avoid Imputed Dates Before a Particular Date

Usually the adverse event start date is imputed as the earliest date of
all possible dates when filling the missing parts. The result may be a
date before treatment start date. This is not desirable because the
adverse event would not be considered as treatment emergent and excluded
from the adverse event summaries. This can be avoided by specifying the
treatment start date variable (`TRTSDTM`) for the `min_dates` argument.

Please note that `TRTSDTM` is used as imputed date only if the non
missing date and time parts of `AESTDTC` coincide with those of
`TRTSDTM`. Therefore `2019-10` is not imputed as `2019-11-11 12:34:56`.
This ensures that collected information is not changed by the
imputation.

``` r
ae <- tribble(
  ~AESTDTC,              ~TRTSDTM,
  "2019-08-09T12:34:56", ymd_hms("2019-11-11T12:34:56"),
  "2019-10",             ymd_hms("2019-11-11T12:34:56"),
  "2019-11",             ymd_hms("2019-11-11T12:34:56"),
  "2019-12-04",          ymd_hms("2019-11-11T12:34:56")
) %>%
  derive_vars_dtm(
    dtc = AESTDTC,
    new_vars_prefix = "AST",
    highest_imputation = "M",
    date_imputation = "first",
    time_imputation = "first",
    min_dates = exprs(TRTSDTM),
    ignore_seconds_flag = FALSE
  )
```

| AESTDTC             | TRTSDTM             | ASTDTM              | ASTDTF | ASTTMF |
|:--------------------|:--------------------|:--------------------|:-------|:-------|
| 2019-08-09T12:34:56 | 2019-11-11 12:34:56 | 2019-08-09 12:34:56 | NA     | NA     |
| 2019-10             | 2019-11-11 12:34:56 | 2019-10-01 00:00:00 | D      | H      |
| 2019-11             | 2019-11-11 12:34:56 | 2019-11-11 12:34:56 | D      | H      |
| 2019-12-04          | 2019-11-11 12:34:56 | 2019-12-04 00:00:00 | NA     | H      |

## Avoid Imputed Dates After a Particular Date

If a date is imputed as the latest date of all possible dates when
filling the missing parts, it should not result in dates after data cut
off or death. This can be achieved by specifying the dates for the
`max_dates` argument.

Please note that non missing date parts are not changed. Thus
`2019-12-04` is imputed as `2019-12-04 23:59:59` although it is after
the data cut off date. It may make sense to replace it by the data cut
off date but this is not part of the imputation. It should be done in a
separate data cleaning or data cut off step.

``` r
ae <- tribble(
  ~AEENDTC,              ~DTHDT,            ~DCUTDT,
  "2019-08-09T12:34:56", ymd("2019-11-11"), ymd("2019-12-02"),
  "2019-11",             ymd("2019-11-11"), ymd("2019-12-02"),
  "2019-12",             NA,                ymd("2019-12-02"),
  "2019-12-04",          NA,                ymd("2019-12-02")
) %>%
  derive_vars_dtm(
    dtc = AEENDTC,
    new_vars_prefix = "AEN",
    highest_imputation = "M",
    date_imputation = "last",
    time_imputation = "last",
    max_dates = exprs(DTHDT, DCUTDT),
    ignore_seconds_flag = FALSE
  )
```

| AEENDTC             | DTHDT      | DCUTDT     | AENDTM              | AENDTF | AENTMF |
|:--------------------|:-----------|:-----------|:--------------------|:-------|:-------|
| 2019-08-09T12:34:56 | 2019-11-11 | 2019-12-02 | 2019-08-09 12:34:56 | NA     | NA     |
| 2019-11             | 2019-11-11 | 2019-12-02 | 2019-11-11 23:59:59 | D      | H      |
| 2019-12             | NA         | 2019-12-02 | 2019-12-02 23:59:59 | D      | H      |
| 2019-12-04          | NA         | 2019-12-02 | 2019-12-04 23:59:59 | NA     | H      |

## Imputation Without Creating a New Variable

If imputation is required without creating a new variable the
`convert_dtc_to_dt()` function can be called to obtain a vector of
imputed dates. It can be used for example in conditions:

``` r
mh <- tribble(
  ~MHSTDTC,     ~TRTSDT,
  "2019-04",    ymd("2019-04-15"),
  "2019-04-01", ymd("2019-04-15"),
  "2019-05",    ymd("2019-04-15"),
  "2019-06-21", ymd("2019-04-15")
) %>%
  filter(
    convert_dtc_to_dt(
      MHSTDTC,
      highest_imputation = "M",
      date_imputation = "first"
    ) < TRTSDT
  )
```

| MHSTDTC    | TRTSDT     |
|:-----------|:-----------|
| 2019-04    | 2019-04-15 |
| 2019-04-01 | 2019-04-15 |

## Using More Than One Imputation Rule for a Variable

Using different imputation rules depending on the observation can be
done by using `slice_derivation()`.

``` r
vs <- tribble(
  ~VSDTC,                ~VSTPT,
  "2019-08-09T12:34:56", NA,
  "2019-10-12",          "PRE-DOSE",
  "2019-11-10",          NA,
  "2019-12-04",          NA
) %>%
  slice_derivation(
    derivation = derive_vars_dtm,
    args = params(
      dtc = VSDTC,
      new_vars_prefix = "A",
      ignore_seconds_flag = FALSE
    ),
    derivation_slice(
      filter = VSTPT == "PRE-DOSE",
      args = params(time_imputation = "first")
    ),
    derivation_slice(
      filter = TRUE,
      args = params(time_imputation = "last")
    )
  )
```

| VSDTC               | VSTPT    | ADTM                | ATMF |
|:--------------------|:---------|:--------------------|:-----|
| 2019-08-09T12:34:56 | NA       | 2019-08-09 12:34:56 | NA   |
| 2019-11-10          | NA       | 2019-11-10 23:59:59 | H    |
| 2019-12-04          | NA       | 2019-12-04 23:59:59 | H    |
| 2019-10-12          | PRE-DOSE | 2019-10-12 00:00:00 | H    |
