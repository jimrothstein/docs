# Index Template

Format for `wiki/index.md` — one row per article, grouped by topic.

## Format

```markdown
# Knowledge Base Index

## <topic> — <one-line topic description>

| Article | Summary | Updated |
| --- | --- | --- |
| [Article Title](<topic>/<article>.md) | <one-line summary> | YYYY-MM-DD |
| [Archived: page title](<topic>/<page>.md) | [Archived] <one-line summary> | YYYY-MM-DD |
```

## Rules

- One `## <topic>` section per wiki topic directory, with a one-line description after the topic name.
- Row per article: link, one-line Summary, Updated date (the date the article's knowledge content last changed; for archive pages the Archived date).
- Archive pages are marked by prefixing the Summary with `[Archived]` (keep the page title visible in the link text).
- `[MISSING]` prefix on a link marks an entry whose file no longer exists — never deleted by auto-fix; shown so the user can decide.
- `(no summary)` placeholder marks a file missing from the index that auto-fix has just added.
- Links are file-relative from `wiki/` (e.g., `topic/article.md`).
