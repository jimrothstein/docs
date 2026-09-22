

/*
This is typ template file.
USAGE:   in qmd, import this typ file
*/

#set page("us-letter")
#set heading(numbering: "1.")


set heading(numbering: "1.")
outline()


// Scripting mode:   use { ... }.   In script,  no hash before fct

// same as below but we exchanged `[...]` for `{...}` to switch from markup
#let apply-template(body, name: "document_name") = {
  show heading.where(level: 1): emph
  set heading(numbering: "1.1")
  // sets entire document this color
  set text(fill: blue)
  // ...
  body
}

// define a function that:
// - takes content
// - applies styling to it
// - returns the styled content
/*
#let apply-template(body) = [
  #show heading.where(level: 1): emph
  #set heading(numbering: "1.1")
  // ...
  #body
]
*/
