// Org-mode Cheat Sheet (Typst Format)

#let key(k) = text(font: "code", raw(k, lang: "typ"))

#table(
  columns: (1fr, 3fr, 3fr),
  stroke: none,
  align: horizon,
  key("Key"), key("Command"), key("Example/Function"),
  // ---
  key("TAB"), "Cycle Visibility", "Fold/Unfold current subtree.",
  key("S-TAB"), "Cycle Global Visibility", "Fold/Unfold all subtrees in buffer.",
  key("M-RET"), "Insert Heading/Item", "Create a new headline: * New Task",
  key("M-S-RET"), "Insert TODO/Checkbox", "Create a TODO entry: * TODO Buy Milk",
  key("M-LEFT"), "Promote Heading", "Change ** Heading to * Heading",
  key("M-RIGHT"), "Demote Heading", "Change * Heading to ** Heading",
  key("M-UP"), "Move Subtree Up", "Move the current heading and its contents up.",
  key("M-DOWN"), "Move Subtree Down", "Move the current heading and its contents down.",
  key("C-c C-t"), "Cycle TODO State", "Change * TODO Task to * DONE Task",
  key("C-c C-l"), "Insert/Edit Link", "Inserts link: [[file:notes.org][Notes]]",
  key("C-c C-o"), "Open Link", "Open the link at point (e.g., website or file).",
  key("C-c C-s"), "Set Schedule Timestamp", "Insert date: SCHEDULED: <2025-12-08 Mon>",
  key("C-c C-d"), "Set Deadline Timestamp", "Insert date: DEADLINE: <2025-12-15 Mon>",
  key("C-c C-c (on table)"), "Re-align Table", "Aligns columns in Org table.",
  key("C-c C-c (on link/src)"), "Execute/Follow", "Evaluate a code block or confirm an action.",
  key("C-c a"), "Agenda Dispatcher", "Open the main Agenda View menu.",
  key("C-c C-x C-w"), "Kill Subtree", "Cut current heading and its contents.",
  key("C-c C-w"), "Refile Subtree", "Move subtree to another location/file.",
  key("C-c C-q"), "Set Tag(s)", "Add tags to a headline: * Heading :tag1:tag2:",
  key("C-c C-x C-b"), "Toggle Checkbox", "Change list item: [ ] Task to [X] Task",
  key("C-c C-x i"), "Clock In", "Start tracking time for current task.",
  key("C-c C-x o"), "Clock Out", "Stop tracking time for current task.",
  key("C-c C-x r"), "Goto Clock Report", "Open the time-tracking report buffer.",
  key("C-c C-e"), "Export Dispatcher", "Export the Org file (e.g., to HTML, PDF).",
)

gemini prompt:
In emacs, there is a mode called "org-mode".  Be terse.  Please
prepare a simple cheat sheet for approximately the 20 or 25 most
common org-mode commands.  Include one simple example of each command.
Otherwise, be terse.  Format for typist (.typ).