#import "810_simple_template.typ": apply-template

// `func.with(..)` applies the arguments to the function and returns the new
// function with those defaults applied
#show: apply-template.with(name: "Jim's Report")

This is main.typ

= Level 1
== Level 2


Template File: 810_simple_template.typ
