# Archive Page Template

Format for pages that save a Query answer to the wiki, written as a NEW page at `wiki/<topic>/<query-topic>.md`. Never merge archive content into existing articles.

## Format

```markdown
---
Title: <Query Topic>
Topic: <topic-name>
Archived: <YYYY-MM-DD (today)>
Sources: [Article One](article-one.md); [Article Two](../<other-topic>/article-two.md)
---

# <Query Topic>

<The synthesized answer to the query, as it was delivered in conversation.>
```

## Rules

- **No Raw field** — archive content is synthesized from wiki articles, not compiled from a source file; it is exempt from the Grounding Invariant.
- **Sources** — markdown links to the wiki articles cited in the answer. Answers cite with project-root-relative paths in conversation; rewrite them here to paths relative to the archive page (`../<other-topic>/article-two.md`, or `article-one.md` for same-directory).
- File name reflects the query topic (e.g., `transformer-architectures-overview.md`), placed in the most relevant topic directory.
- Archive pages are point-in-time snapshots: never cascade-updated by later ingests.
- After writing: add an index row with `[Archived]`-prefixed Summary, and log `## [YYYY-MM-DD] query | Archived: <page title>`.
