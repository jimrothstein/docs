---
Title: Exporting Reddit saved items
Topic: api
Updated: 2026-11-09
Sources: tech_notes (in-place notes, undated)
Raw: [tech_notes/300_tech_notes.qmd](../../tech_notes/300_tech_notes.qmd)
---

# Exporting Reddit saved items

Constraints (per the notes): Reddit's native interface has no search bar for saved items and enforces a strict **1,000-item limit** — saving a 1,001st item pushes the oldest out. The saved list is private, so a direct URL like `reddit.com/user/jimrothstein1/saved/` is only viewable when logged into that account.

## Method 1: Python + PRAW (recommended)

Most reliable backup: download everything to a readable file (CSV/Markdown). Steps: create an app in Reddit's App Preferences to get `client_id` and `client_secret`; `pip install praw`; iterate saved history:

```python
import praw
import csv

reddit = praw.Reddit(
    client_id="YOUR_CLIENT_ID",
    client_secret="YOUR_CLIENT_SECRET",
    user_agent="SavedPostExporter v1.0 by /u/jimrothstein1",
    username="jimrothstein1",
    password="YOUR_PASSWORD"
)

with open("reddit_saved.csv", "w", newline="", encoding="utf-8") as file:
    writer = csv.writer(file)
    writer.writerow(["Type", "Title/Comment", "Subreddit", "URL"])

    for item in reddit.user.me().saved(limit=None):   # maxes out at 1000
        if isinstance(item, praw.models.Submission):
            writer.writerow(["Post", item.title, item.subreddit.display_name, item.url])
        elif isinstance(item, praw.models.Comment):
            writer.writerow(["Comment", item.body, item.subreddit.display_name, item.permalink])
```

## Method 2: AI agent

"Yes, but with security and privacy caveats." An agent cannot download the list by reading the URL (403 Forbidden). Two paths: the automated browser route (AI writes a Playwright/Selenium script; you log in manually — safer but technical) and the credential route (handing API keys/password to an agent — "highly discouraged" unless the agent runs completely locally).

## Method 3: third-party tools

- **Reddit Data Request (official takeout):** request a complete archive at reddit.com/settings/data-request; Reddit emails a ZIP of CSVs — often only *links*, not full text; takes days.
- **Browser extensions** (Chrome/Firefox): secure OAuth, one-click export to spreadsheet or Notion.
- **Web utilities** (e.g. Reddit-Saved.com): authenticate via Reddit OAuth, index the list, instant search; can preserve items beyond the 1,000-post wall.

## See Also

- [Google/YouTube API with OAuth2 and httr2](google-oauth-httr2.md)
