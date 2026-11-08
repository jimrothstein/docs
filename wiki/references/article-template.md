# Article Template

Format for every compiled article at `wiki/<topic>/<article>.md`.

## Format

```markdown
---
Title: <Article Title>
Topic: <topic-name>
Updated: <YYYY-MM-DD — when the article's knowledge content last changed>
Sources: <author or publication> (<date>); <author or publication> (<date>)
Raw: [<short source name>](../../<project-root-relative source path>); ...
---

# <Article Title>

<One-paragraph statement of the article's core thesis.>

## <Section Heading>

<Body. Every number, date, and direct quote appears verbatim in the linked
raw file(s) — locate before writing; write values exactly as found (42K
stays 42K, not 42,000). Derived values (sums, deltas, counts you computed)
must show their components so each component is findable in raw.>

## See Also

- [Related Article](../<other-topic>/related-article.md)
```

## Status blocks

When a claim is superseded or contradicted, keep the old claim for the record and add a Status block directly under it. Never silently rewrite history.

```markdown
<Original claim kept for the record.>

### Status: Outdated

**Outdated (YYYY-MM-DD):** <what replaces it and why, with links>.

<Original claim kept for the record.>

### Status: Disputed

**Disputed (YYYY-MM-DD):** <which source disagrees and how, with links to the
conflicting article(s).>
```

## Rules

- **Metadata fields are required**: `Title`, `Topic`, `Updated`, `Sources`, `Raw` (archive pages instead use `Archived` and have no `Raw` — see archive-template.md).
- **Sources** — author, organization, or publication name + date, semicolon-separated.
- **Raw** — markdown links to source files, semicolon-separated. Relative paths from `wiki/<topic>/` are `../../` + the project-root-relative source path (e.g., a source at `tech_notes/foo.md` links as `../../tech_notes/foo.md`).
- **Updated** — refresh only when knowledge content changes (ingest merge, cascade update); not on cosmetic edits.
- Body headings are free-form; every load-bearing fact stays traceable to a Raw link.
- **See Also** lists related wiki articles, one level of topic dirs, links file-relative.
- Link paths inside the article are relative to the current file.
