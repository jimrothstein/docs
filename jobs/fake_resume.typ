#set page(width: auto, height: auto, margin: 10pt)

= Level 1
== Level 2

Or, this one:

#set page(
paper: "us-letter",
margin: (x: 0.5cm, y: 0.5cm),
)

#set text(
font: "New Computer Modern",
size: 15pt,
fill: black   // gray is too light

)



#set heading(numbering: "1.")
#outline()
#show regex("[Mmath]"): it => emph(it)


math is fun

== Concatinate (code block)
#{
let a = [from]
let b = [*world*]
[hello]
a + [the] + b
}

== Appear like R code

#let r = raw.with(lang: "r")

This can then be used like: #r("x <- c(10, 42)")

== Smaller/larger font in block

def python():
return 5 + 5
// Switch to JetBrains Mono for both
// inline and block raw.
#show raw: set text(font: "JetBrains Mono")
JetBrains Mono \

// Reset raw blocks to the same size as normal text,
// but keep inline raw at the reduced size.
#show raw.where(block: true): set text(1em / 0.8)

Now using the font for raw text.
Here's some Python code. It looks larger now:

def python():
return 5 + 5

== link
#show link: underline
#link("https://nytimes.com") \
#link("https//nytimes.com")[the NY Times]
#divider()    // actual function is defined near bottom


== expressions (https://typst.app/docs/reference/scripting/)


compact syntax (use hash) to embed a code expression into markup: /

#emph[Hello] \   // function call
#emoji.face \    // field
#"hello".len()   // method calls

== functions
Call a function. \
\#list([A], [B]) \

#list([A], [B])

Named arguments and trailing  \
content blocks. \
\#enum(start: 2)[A][B]

#enum(start: 2)[A][B]

Version without parentheses.
\#list[A][B]
#list[A][B]
