---
name: posit-news
description: |
  Use multiple sub-agents to fetch and display news from Posit, including blog posts, podcast episodes, videos, and events.
  Use when the user wants to see recent Posit news, blog updates, podcast episodes, videos, or company announcements.

---

# Posit News

Dispatch multiple sub-agents to fetch the latest Posit news from Posit blog posts, podcast episodes, videos, and event announcements and present them to the user.

## Blogs to Fetch

| Blog | URL | Posts |
|------|-----|-------|
| Posit | https://posit.co/blog/ | 3 |
| Tidyverse | https://www.tidyverse.org/blog/ | 3 |
| Shiny | https://shiny.posit.co/blog/ | 3 |
| Quarto | https://quarto.org/docs/blog/ | 3 |

## Podcast to Fetch

| Podcast | URL |
|---------|-----|
| The Test Set | https://posit.co/thetestset/ |

## Videos to Fetch

| Source | URL |
|--------|-----|
| Posit Videos Page | https://posit.co/videos |

Note: YouTube (`https://www.youtube.com/@PositPBC/videos`) is blocked by WebFetch. Use Posit's videos page instead to find recent video content hosted on posit.co.

## Events to Fetch

| Source | URL |
|--------|-----|
| Posit Events Page | https://posit.co/events |
| Data Science Hangouts Page | https://posit.co/data-science-hangout |


## Instructions

1. First, run `date +%Y-%m-%d` to get today's date.

2. Use WebFetch to retrieve all blog URLs in parallel. For each blog, use this prompt:
   "Extract the [N] most recent blog posts with title, date, brief description, and URL."
   Note: The Posit blog (`https://posit.co/blog/`) is an HTML page — look for the post listing section. Tidyverse, Shiny, and Quarto blogs are also HTML pages.

3. Fetch the podcast page (`https://posit.co/thetestset/`) with prompt:
   "Extract the latest podcast episode with title, episode number, brief description, and URL."

4. Fetch the latest videos from Posit's videos page:
   a. Fetch `https://posit.co/videos` with prompt:
      "Extract the 3 most recent video resources (filter by Resource Type: Video, Webinar, or Product demo) with title, date, type, and URL."
   b. Fetch each video page in parallel with prompt:
      "Extract the video title, speaker(s), date, and description."

5. Fetch events from both pages:
   a. Fetch both pages in parallel:
      - Events page (`https://posit.co/events`) with prompt:
        "List all upcoming events with name, date, type, description, and URL."
      - Data Science Hangouts page (`https://posit.co/data-science-hangout`) with prompt:
        "Extract the upcoming hangout and the 3 most recent past hangouts with name and URL."
   b. Then, fetch individual event/hangout pages in parallel with prompt:
      "Extract the event name, date(s), and a one-sentence description."
   c. Combine all events and compare dates to today's date to categorize:
      - **Recent Events**: The 2 most recent events that have already occurred (before today)
      - **Upcoming Events**: The next 3 events that haven't happened yet (today or later)

6. For relative URLs, prepend the source's base URL to form complete links.

7. Present the results grouped by source in this format.  Then save as news.md in markdown. 
   ```
   ## Posit Blog (3 latest)

   - (YYYY-MM-DD) **Post Title**: Brief description. URL

   ## Tidyverse Blog (3 latest)

   - (YYYY-MM-DD) **Post Title**: Brief description. URL

   ## Shiny Blog (3 latest)

   - (YYYY-MM-DD) **Post Title**: Brief description. URL

   ## Quarto Blog (3 latest)

   - (YYYY-MM-DD) **Post Title**: Brief description. URL

   ## The Test Set Podcast (latest episode)

   - (ep DDD) **Episode Title**: Brief description. URL

   ## Posit Videos (3 latest)

   - (YYYY-MM-DD) **Video Title** - Speaker(s): Brief description. URL

   ## Recent Posit Events (2 most recent)

   - (YYYY-MM-DD) **Event Name**: Brief description. URL

   ## Upcoming Posit Events (next 3)

   - (YYYY-MM-DD) **Event Name**: Brief description. URL
   ```

8. If a URL cannot be retrieved, note the limitation and continue with other sources.

## Example Output

## Posit Blog (3 latest)

- (2025-01-10) **Announcing Positron 1.0**: Posit releases version 1.0 of Positron, the next-generation IDE for data science. https://posit.co/blog/announcing-positron-1-0/

## Tidyverse Blog (3 latest)

- (2025-01-08) **dplyr 1.2.0**: New features in dplyr including improved joins and better error messages. https://tidyverse.org/blog/2025/01/dplyr-1-2-0/

## Shiny Blog (3 latest)

- (2025-01-05) **Shiny for Python 1.0**: Shiny for Python reaches 1.0 with production-ready features. https://shiny.posit.co/blog/shiny-python-1-0/

## Quarto Blog (3 latest)

- (2025-01-03) **Quarto 1.5 Release**: New features for scientific publishing and improved PDF output. https://quarto.org/docs/blog/posts/2025-01-03-quarto-1.5/

## The Test Set Podcast (latest episode)

- (ep 012) **Marco Gorelli on Narwhals, Ecosystem Glue, and Boring Work**: Marco discusses Narwhals, a compatibility layer enabling apps to work seamlessly with Pandas, Polars, Arrow, and other dataframe libraries. https://posit.co/thetestset/episode/marco-gorelli-narwhals-ecosystem-glue-and-the-value-of-boring-work/

## Posit Videos (3 latest)

- (2025-12-01) **Building Agentic AI Applications with Positron and AWS Strands Agents**: How to build agentic AI applications using Positron and AWS Strands Agents for creating intelligent, autonomous systems. https://posit.co/webinars/building-agentic-ai-applications-with-positron-and-aws-strands-agents/
- (2025-11-20) **Championing Modern Science Workflows to Benefit Dairy Farmers**: Implementing advanced scientific approaches to improve dairy farming practices. https://posit.co/webinars/championing-modern-science-workflows-to-benefit-dairy-farmers/
- (2022-10-19) **The Past and Future of Shiny** - Joe Cheng: Keynote exploring the evolution and future direction of Shiny. https://posit.co/keynotes/the-past-and-future-of-shiny/

## Recent Posit Events (2 most recent)

- (2025-12-11) **Actuarial Technology Summit 2025**: Virtual summit focused on modernizing insurance technology stacks for actuaries. https://posit.co/events/actuarial-technology-summit-2025/
- (2025-11-06) **Data + AI World Tour Amsterdam**: Posit partners with Databricks to accelerate AI-powered workflows. https://posit.co/events/data-ai-world-tour-amsterdam/

## Upcoming Posit Events (next 3)

- (2026-01-15) **Data Science Hangout featuring Mine Çetinkaya-Rundel**: Discuss data science education and open, reproducible data science. https://posit.co/data-science-hangout/mine-cetinkaya-rundel/
- (2026-01-22) **Data Science Hangout featuring Allissa Dillman**: Discuss building inclusive learning programs and making data science approachable. https://posit.co/data-science-hangout/allissa-dillman/
- (2026-01-26) **Gen-AI Assisted Migration Webinar**: Learn how Gen-AI accelerated the transition to open-source data science tools. https://posit.co/events/gen-ai-assisted-migration-webinar/
