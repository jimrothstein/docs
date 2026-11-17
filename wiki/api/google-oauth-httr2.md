---
Title: Google/YouTube API with OAuth2 and httr2
Topic: api
Updated: 2026-11-09
Sources: tech_notes (in-place notes, undated)
Raw: [tech_notes/300_tech_notes.qmd](../../tech_notes/300_tech_notes.qmd)
---

# Google/YouTube API with OAuth2 and httr2

Purpose (from the notes): demonstrate configuration for httr2 and OAuth2 with Google's YouTube API — `httr2::req_oauth_auth_code()` with configuration, the **authorization code flow**, `redirect_uri` localhost with cut & paste (via obo is deprecated). httr2 hides almost all details of the interaction; use curl and a local server (httpuv) to see the lower level. Source: <https://developers.google.com/youtube/v3/guides/auth/installed-apps>. Related: Google Explorer (youtube), Google OAUTH2 playground.

## Authorization request

Google's authorization server: `https://accounts.google.com/o/oauth2/v2/auth`.

```sh
curl -Lsv "https://accounts.google.com/o/oauth2/v2/auth?\
client_id=$client_id&\
redirect_uri=https://127.0.0.1:8080&\
scope=https://www.googleapis.com/auth/youtube&\
response_type=code\""
```

Needed scopes: `https://www.googleapis.com/auth/youtube` (manage your YouTube account) and `https://www.googleapis.com/auth/youtube.force-ssl` (see, edit, permanently delete videos, ratings, comments, captions).

```r
scope = list(
        "https://www.googleapis.com/auth/youtube",
        "https://www.googleapis.com/auth/youtube.force-ssl")
```

## Requesting data

From Google (Youtube) Explorer:

```
GET https://youtube.googleapis.com/youtube/v3/playlists?part=snippet%2CcontentDetails&maxResults=5&mine=true&key=[YOUR_API_KEY] HTTP/1.1
Authorization: Bearer [YOUR_ACCESS_TOKEN]
Accept: application/json
```

Same as curl:

```sh
curl \
  'https://youtube.googleapis.com/youtube/v3/playlists?part=snippet%2CcontentDetails&maxResults=5&mine=true&key=[YOUR_API_KEY]' \
  --header 'Authorization: Bearer [YOUR_ACCESS_TOKEN]' \
  --header 'Accept: application/json' \
  --compressed
```

## httr2 (R)

```r
client = oauth_client(id = client_id,
        token_url  = token_url,
        secret = client_secret,
        key =  API_KEY,
        auth = "body",   # header or body
        name = "youtube_ONE_video_ALL_comments")

req  <-  request("https://www.googleapis.com/youtube/v3/commentThreads?videoId=Mec9sw1cJk8&part=snippet,replies")  %>%
req_oauth_auth_code(client = client, auth_url = auth_url, token_params = scope[[1]])

resp  <-  req %>% req_perform()
```

Remarks from the notes: Google is but one implementation of the various API/oauth technologies; the R package **gargle** "is uses **httr** and therefore not my preference"; the author uses httr2 to automate, wanting to understand with as little as possible (curl, browser, local server on localhost); most R work happens at the lower level in curl and httpuv. Example `playlistId = "PLlXfTHzgMRUIqYrutsFXCOmiqKUgOgGJ5"` (Pavel Grinfeld, Linear Alg 3).

## curl basics

```sh
curl -w "Response %{response_code}\n" example.com   # write response after call
curl https://api.github.com/zen
curl https://api.github.com/users/defunkt            # key=value pairs
curl -i https://api.github.com/users/defunkt          # include headers
curl --head <URL>                                     # headers only
curl -K CURL_CONFIG ...                               # config FILE
```

CURL_CONFIG file example: `url = example.com` plus `-w "Type: Hello %{local_ip} \n"`. Misc note: "State" — cookies used to be used; now state carried in headers.

## See Also

- [WebSocket vs REST](websocket-vs-rest.md)
