#!/usr/bin/env python3
"""
Link audit for the Lane County Public Health website.

Crawls the Public Health section, extracts outbound links, and checks
each for broken status (4xx/5xx + connection failures).

Demonstration version: works but is not exhaustive. Python stdlib only.

Usage:
    python3 link_audit.py [--max-pages N] [--out-dir DIR]
"""

import argparse
import html.parser
import os
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from datetime import date

START_URL = "https://www.lanecountyor.gov/cms/One.aspx?portalId=3585881&pageId=4078590"
SITE_DOMAIN = "lanecountyor.gov"
PORTAL_MARKER = "portalId=3585881"
USER_AGENT = "Mozilla/5.0 (compatible; link-audit/0.1; +https://github.com/jimrothstein/docs)"
TIMEOUT = 20

# URL fragments we never want to report (assets, javascript, mail, share widgets)
SKIP_SUBSTRINGS = (
    ".css", ".js", ".ico", ".png", ".jpg", ".jpeg", ".gif", ".svg",
    ".woff", ".woff2", ".ttf", ".eot",
    "javascript:", "mailto:", "tel:",
    "facebook.com", "twitter.com", "linkedin.com", "instagram.com",
    "youtube.com", "vimeo.com", "launcher.myapps.microsoft.com",
    "maxcdn.bootstrapcdn.com", "cdnsm1-hosted.civiclive.com",
    "cdnsm2-hosted.civiclive.com", "cdnsm5-hosted.civiclive.com",
    "quitnow.net", "thisisquitting.com",
)


class LinkExtractor(html.parser.HTMLParser):
    def __init__(self):
        super().__init__()
        self.hrefs = []

    def handle_starttag(self, tag, attrs):
        if tag == "a":
            for key, value in attrs:
                if key == "href" and value:
                    self.hrefs.append(value)


def fetch(url):
    """Return (status_or_None, error_string, final_url)."""
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    try:
        with urllib.request.urlopen(req, timeout=TIMEOUT) as resp:
            return resp.status, None, resp.geturl()
    except urllib.error.HTTPError as e:
        return e.code, None, e.geturl()
    except urllib.error.URLError as e:
        return None, f"{e.reason}", None
    except Exception as e:  # timeout, ssl, etc.
        return None, f"{type(e).__name__}: {e}", None


def get_html(url):
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    try:
        with urllib.request.urlopen(req, timeout=TIMEOUT) as resp:
            return resp.read().decode("utf-8", errors="replace")
    except Exception:
        return None


def is_external(url):
    parsed = urllib.parse.urlparse(url)
    host = (parsed.netloc or "").lower()
    return bool(host) and not (host == SITE_DOMAIN or host.endswith("." + SITE_DOMAIN))


def clean_url(href, base):
    joined = urllib.parse.urljoin(base, href)
    parsed = urllib.parse.urlparse(joined)
    if parsed.scheme not in ("http", "https"):
        return None
    return joined


def should_skip(url):
    low = url.lower()
    return any(s in low for s in SKIP_SUBSTRINGS)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--max-pages", type=int, default=40,
                        help="max internal PH pages to crawl")
    parser.add_argument("--out-dir", default=".",
                        help="directory for report and inventory outputs")
    args = parser.parse_args()

    # ---- 1. Crawl the Public Health section ----
    to_visit = [START_URL]
    visited = []
    seen = set()
    page_links = {}   # url -> set of outbound hrefs
    page_titles = {}  # url -> page title-ish label (last path segment)

    while to_visit and len(visited) < args.max_pages:
        url = to_visit.pop(0)
        if url in seen:
            continue
        seen.add(url)
        html = get_html(url)
        if html is None:
            visited.append(url)
            page_links[url] = set()
            continue

        parser = LinkExtractor()
        parser.feed(html)
        visited.append(url)
        page_titles[url] = url.split("pageId=")[-1]

        for href in parser.hrefs:
            resolved = clean_url(href, url)
            if not resolved or should_skip(resolved):
                continue
            if is_external(resolved):
                page_links.setdefault(url, set()).add(resolved)
            else:
                if PORTAL_MARKER in resolved and resolved not in seen and resolved not in to_visit:
                    to_visit.append(resolved)

    print(f"Crawled {len(visited)} internal pages; found outbound links on "
          f"{sum(1 for v in page_links.values() if v)} of them")

    # ---- 2. Check every unique outbound URL ----
    all_links = {}
    for src, links in page_links.items():
        for link in links:
            info = all_links.setdefault(link, {"srcs": set(), "status": None,
                                               "error": None, "final": None})
            info["srcs"].add(src)

    for i, (link, info) in enumerate(all_links.items(), 1):
        status, err, final = fetch(link)
        info["status"] = status
        info["error"] = err
        info["final"] = final
        time.sleep(0.2)  # be polite to external sites
        if i % 10 == 0:
            print(f"  checked {i}/{len(all_links)}")

    broken = {k: v for k, v in all_links.items()
              if v["error"] or (v["status"] and v["status"] >= 400)}

    # ---- 3. Write outputs ----
    os.makedirs(args.out_dir, exist_ok=True)
    today = date.today().isoformat()

    md_path = os.path.join(args.out_dir, "link_audit.md")
    with open(md_path, "w") as f:
        f.write(f"# Link audit: Lane County Public Health website\n\n")
        f.write(f"Audit date: {today}\n\n")
        f.write(f"- Internal pages crawled: {len(visited)}\n")
        f.write(f"- Unique outbound links found: {len(all_links)}\n")
        f.write(f"- **Broken links: {len(broken)}**\n\n")

        if broken:
            f.write("## Broken links by source page\n\n")
            for src in visited:
                src_links = {k: v for k, v in broken.items() if src in v["srcs"]}
                if not src_links:
                    continue
                f.write(f"### pageId {page_titles.get(src, src)}\n\n")
                f.write(f"- source: {src}\n\n")
                f.write("| URL | Status | Error |\n")
                f.write("|-----|--------|-------|\n")
                for link, info in src_links.items():
                    status = str(info["status"]) if info["status"] else "-"
                    err = info["error"] or "-"
                    f.write(f"| {link} | {status} | {err} |\n")
                f.write("\n")
        else:
            f.write("No broken outbound links found.\n")

    csv_path = os.path.join(args.out_dir, "link_audit.csv")
    with open(csv_path, "w") as f:
        f.write("source_url,target_url,status,error,final_url\n")
        for link, info in all_links.items():
            for src in sorted(info["srcs"]):
                status = info["status"] if info["status"] is not None else ""
                f.write(f"{src},{link},{status},{info['error'] or ''},"
                        f"{info['final'] or ''}\n")

    print(f"\nWrote {md_path}")
    print(f"Wrote {csv_path}")
    print(f"Summary: {len(all_links)} links, {len(broken)} broken")
    sys.exit(0 if not broken else 0)


if __name__ == "__main__":
    main()
