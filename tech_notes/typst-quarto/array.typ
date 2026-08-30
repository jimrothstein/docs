#let values = (1, 7, 4, -3, 2)

#values.at(0) \
#values.last() \
#values.at(-1) \
#(values.at(0) = 3)

Calc even

#values.find(calc.even) \
#values.filter(calc.odd) \
#values.map(calc.abs) \
#values.rev() \
#(1, (2, 3)).flatten() \
#(("A", "B", "C")
    .join(", ", last: " and "))

#set page("us-letter")
#set heading(numbering: "1.")



This is a quarto (.qmd) file.  
Use raw typst may be most straightforward way.
Note:  use of knitr to get most of R, chunks.  (optional)


= Fibonacci sequence
The Fibonacci seq uses recurrence: $F_n = F_(n-1) + F_(n-2)$
Or, in closed form:

$ F_n = round(1 / sqrt(5) phi.alt^n) $

$
forall v, w in V, alpha in KK: alpha dot (v + w) = alpha v + alpha w
$

