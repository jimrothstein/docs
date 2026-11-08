# Raw File Template

Used only for **newly fetched** sources (research/web material), saved as
`<raw-dir>/wiki-sources/<topic>/YYYY-MM-DD-descriptive-slug.md`.
In-place sources in a registered raw directory are never reformatted or moved — this template does not apply to them.

## Format

```markdown
---
Source URL: <url>
Collected: <YYYY-MM-DD (today)>
Published: <YYYY-MM-DD from the source, or Unknown>
---

# <Source Title>

<Preserved source text. Clean formatting noise; do not rewrite opinions.>
```

## Rules

- **Source URL** — the web/remote origin; `Local: <path>` only if pasted by the user.
- **Collected** — today's date.
- **Published** — exactly as the source states it; `Unknown` when unavailable. If `Unknown`, omit the `YYYY-MM-DD-` prefix from the file name.
- File name: title-derived kebab-case slug, max 60 chars; numeric suffix (`-2`) on collision.
- Preserve the original text verbatim below the header. You may strip navigation junk, ads, and broken formatting; do not paraphrase, summarize, or drop load-bearing content.
