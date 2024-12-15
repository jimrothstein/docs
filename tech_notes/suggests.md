

If this too trivial (or pedantic) just let me know.

    ' @param derivation The derivation function to call
    #'
    #'   A function that performs a specific derivation is expected. A derivation
    #'   adds variables or observations to a dataset. The first argument of a
    #'   derivation must expect a dataset and the derivation must return a dataset.
    #'   The function must provide the `dataset` argument and all arguments
    #'   specified in the `params()` objects passed to the `variable_params` and
    #'   `...` argument.
    #'
    #'   Please note that it is not possible to specify `{dplyr}`
    #'   functions like `mutate()` or `summarize()`.
    #'

A specific derivation function (required) \[(optional) to add variables
or observations to a dataset\] \[(optional) one of the derive\_\*
functions\]

    #' @param variable_params A `list` of function arguments that are different across iterations.
    #'   Each set of function arguments must be created using [`params()`].

    Each element of this list is a one call to the `params` function and represents everything the derviation function requires to do one iteration. 
