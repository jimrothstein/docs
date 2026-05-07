// Basic examples:      https://sitandr.github.io/typst-examples-book/book/basics/scripting/basics.html

// NEXT:   debug in typst online editor

#set page("us-letter")
#set heading(numbering: "1.")
#set text(
  font: "New Computer Modern",
  size: 10pt
)

/* To render: typst compile array.typ */

== misc, line, color

#line(length: 100%)
#set text(blue)
This is blue

// begin
#set par.line(numbering: "1.")
This is a blue. \
#set text(red)
How do I change this to red? \
Still red?!
// end
#set par.line(numbering: none)

#align(right)[this is right aligned]


set a variable:
#set par.line(numbering: "1.")
#emph[Hi] \

#let A = text(blue, strong[Hi]) 
#A \

#let A = strong[hi] 
#A to you! \
#set par.line(numbering: none)

=== red & color block
#let block_text = block(stroke: red, inset: 1em)[This is red.]
#line(length: 100%)
#set text(blue)
This is blue


#set text(black)
#show "project": smallcaps
I am working on special project.

#line(length: 100%)

== envelope symbol

#let envelope = symbol(
  "🖂",
  ("stamped", "🖃"),
  ("stamped.pen", "🖆"),
  ("lightning", "🖄"),
  ("fly", "🖅"),
)

#envelope
#envelope.stamped
#envelope.stamped.pen
#envelope.lightning
#envelope.fly

#line(length: 100%)

=== comments

You can write comments with `//` and `/* comment */`:
// Like this
/* Or even like
this */

===  fenced code blocks

```typ
Inside a typ block:  Just in case you didn't read source,
this is how code is written:

// Like this
/* Or even like
this */

By the way, I'm writing it all in a _fenced code block_ with *syntax highlighting*!
```

=== text with box

Refer to the docs (green) ... 
#box(
  rect(fill: green),
  height: 9pt,
  
)
... for more information.

#rect(fill: blue)

box

#box(stroke: red, inset: 1em)[
#lorem(5)
]


#show heading: set text(navy)

Function to create rect 

#let alert(body, fill: red) = {
  set text(white)
  set align(center)
  rect(
    fill: fill,
    inset: 8pt,
    radius: 4pt,
    [*Warning:\ #body*],
  )
}

#alert[
  Danger is imminent!
]

#alert(fill: blue)[
  KEEP OFF TRACKS
]
=
=== center

#align(center)[Center this]

#block(
  fill: luma(230),
  inset: 8pt,
  radius: 4pt,
  lorem(30),
)


== What else?

There are not much things in basic "markup" syntax,
but we will see much more interesting things very soon!
I hope you noticed auto-matched "smart quotes" there.

#line(length:100%)
#block(
  fill: luma(230),
  inset: 8pt,
  radius: 4pt,
  lorem(30),
)
#line(length:100%)

=== R Code does not execute ??
```r
x =2
y = 3
x*y
```

=== rectangles, circles
[Try 1]
#rect(
  width: 100%,
  height: 2cm,
  place(horizon + right, square()),
)

[Try 2]
#rect(
  width: 100%,
  height: 2cm,
  place(horizon + right, square(square(square()))),
)

#line(length: 100%)
#line(length: 100%)
#circle(radius: 50pt)
#circle(radius: 25pt, stroke: red)
#circle(radius: 25pt)[
  #set align(center)
  stop \
]

// make concentric
#circle(
  radius: 50pt,
  place(horizon + center, circle(circle(fill: blue)))
)
  
=== Bash does not work
```bash
# Your Bash commands here
echo "Hello, World!"
```

== url
// #show <element>:
#show link: underline
#link("https://nytimes.com")[See nytimes]

#show link: set text(stroke: rgb(10, 0, 0))
#link("https://nytimes.com")[See nytimes]

// changes EVERY Following heading
//#show heading: set text(green)

=== function to color [body], if selected 
// toggle on/off; set [body] a color
#let format(body, on: false) = {
  set text(green) if on
  [#body]
}

#set par.line(numbering: "1.")
// first is true, second false 
#format( on: true)[a line]  \ // body is [a line]
#format(on: false)[a second line]

// begin
This is a black. \
#set text(red)
How do I change this to red? \
Still red?!
// end
#set par.line(numbering: none)

#align(right)[this is right aligned]

#set text(black)
#show "project": smallcaps
I am working on special project.

#line(length: 100%)

#block_text

#figure(caption: "The block", block_text)

== text
lorem(10) \
#lorem(10)

#block(
    fill: luma(230),
)

= Content block
[ *hello*  jim]

= Content + code
#{ let a = [jim]
 [My name is ] + a
}

= function

#let f(name) = "Hello, " + name
#f("world!") \
#f("jim")

// The following syntaxes are equivalent
#let f = (name) => "Hello, " + name
#let f(name) = "Hello, " + name

== function with content argument, using []
#let f(name) = [Hello, #name]
#f[World] // also don't forget we can use it to pass content!

== default args
#let f(name: "no name") = [Hello, #name!]

#f()
#f(name: "Joe")
#f(name: "world")


= R
```r
2+2
```




=== show rule

RULE: show "XX": text(green)[I am green] \

#show "XX": text(green)[I am green]

Do you see "XX" text?
