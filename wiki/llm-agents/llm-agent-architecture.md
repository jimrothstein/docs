---
Title: LLM Agents: Harness, Tools, and MCP
Topic: llm-agents
Updated: 2026-11-08
Sources: tech_notes/322_LLM_agents_NOTES.md (in-place notes, undated)
Raw: [322_LLM_agents_NOTES.md](../../tech_notes/322_LLM_agents_NOTES.md)
---

# LLM Agents: Harness, Tools, and MCP

The working model from the source notes: an agent wraps an LLM, a harness bounds and drives it, and MCP standardizes how tools are reached — but who is in charge (the LLM or the developer) is the defining open question.

## Agent-agency: who controls?

The notes frame the core question as *agent-agency* — who controls the agent, the LLM or the developer. A workflow puts the developer in control ("developer controls 100%"), while an agent varies and needs care because the LLM decides.

## The harness (bounds the LLM)

Key distinction from the notes: the harness bounds the system; it is not the "driver", just limits — and it is what actually calls the tool.

Two metaphors from the source:

> LLM is "engine", HARNESS is rest of car, control speed, direction, memory, dashboard"

> LLM is brain, HARNESS is rest of body. Brain says "run", harness controls muscles, lungs, ....

**Tools.** The tool mechanism in the notes:

> When LLM needs external info (file system, web) provides agent with such a tool. Agent then runs the tool.

The flow: the LLM cannot answer a weather question itself, so it looks for a tool, which runs on the user's machine; which tool to use arrives as JSON — the notes call this "message transfer". The HARNESS actually calls the tool; the AGENT is the wrapper around all of this, a loop.

## Agent concepts (quick definitions)

- **RAG** — add "knowledge" to the context; the knowledge might be text (pdf, md ...) or a db.
- **Graph** — break a sentence into nodes (things) and edges (connect): "Joe writes python."
- **Vector search** — arrange words in n-dimension (embed) such that similar words ("cat", "kitten") are near each other, learned in training; a query finds the nearest "points".
- **Self-attention** — disambiguation over context: "I went to bank to get money." Does *bank* refer to river or building?
- **Transformer** — from the notes: transformers are neural networks that make NLP (natural language) possible and allow for reading large amounts. A transformer can resolve a pronoun like _he_ even if the referent sits several paragraphs away.
- **Attention matrix** — NxN matrix, pairs various tokens.
- **Graph RAG** — can reason *between* documents; plain RAG can not do this.
- **Orchestration** — sync tools, results.
- Linear thinking: LLM agents think linearly and are terrible at connecting insights; the notes want the agent to explore branches ("Graph of Thought") before it acts.

**ACP (Agent Client Protocol)** — any IDE; write in a buffer then send to an agent; agent-to-agent communication when both sides support it: <https://www.agentclientprotocol.com>

**Related concepts in the source**: artifact (a remnant that stays long after and yields insight into what, why, and how), ADR (a record of decisions as the process evolves), plus companion notes in `tech_notes/compact.md` (source-internal reference).

## MCP

From the notes: MCP standardizes a protocol for all actions and replaces ad-hoc per-server API calls. The LLM decides its next move — query a database, send email, search — and MCP simplifies those requests. Hand-writing API calls for each server and each call is what MCP removes; it is the common denominator, and for remote calls the tedious API code is hidden from the developer.

**The protocol stack** (verbatim from the source):

```text
MCP operation:    tools/call, resources/read, initialize, ...
Message format:   JSON-RPC 2.0, encoded as UTF-8 JSON
Transport:        stdio  OR  Streamable HTTP
Underlying I/O:   process pipes OR HTTP/TCP/TLS
```

MCP does not invent a new network protocol. It uses JSON-RPC for the *meaning* of messages — "list tools," "call this tool," "here is the result" — and picks a transport for physically moving those messages between client and server. The standard transports are **stdio** for local servers and **Streamable HTTP** for remote ones.

Key idea, quoted: "an MCP server is an RPC service for LLM applications."

**Local MCP: stdio.** The client typically starts the MCP server as a child process — much as a shell starts a command — writing requests to the server's stdin and reading replies from stdout; `stderr` stays available for logs. The concept is the same as Unix pipes (`program-a | program-b`), but both sides keep exchanging structured JSON messages. Notes: stdio is local, avoids opening a network port, and is ideal for a desktop AI application launching a filesystem, Git, database, or custom Python MCP server. The messages are newline-delimited JSON-RPC — essentially one JSON message per line.

**Remote MCP: Streamable HTTP.** The server runs independently and exposes one MCP HTTP endpoint, commonly `/mcp`. The client sends each JSON-RPC request or notification in an HTTP `POST`; the service returns a normal JSON response, or a Server-Sent Events (SSE) stream when it needs to send progress, multiple results, or server-to-client notifications over time. This rides normal web infrastructure: HTTPS, authentication, proxies, load balancers.

**The "remote" nuance**: HTTP MCP can also run on the **same** machine (for example, `localhost:3000`). “Remote” primarily means it is a separately running network service, not necessarily a physically different computer. It is still the HTTP/"remote-style" transport even when both sides run on one machine via `localhost`. And per the notes: **127.0.0.1** is not a web address — it is an endpoint.

**Local vs remote, one line each** (from the notes): local MCP is usually one machine, client starts the server as a child process and they talk through `stdin`/`stdout`; remote MCP is usually at least two machines, client connects over HTTP/HTTPS.

Specification references from the source: the MCP transports spec [modelcontextprotocol (2025-03-26)](https://modelcontextprotocol.io/specification/2025-03-26/basic/transports) and [modelcontextprotocol (2026-07-28)](https://modelcontextprotocol.io/specification/2026-07-28/basic/transports), with the Streamable HTTP variant at [modelcontextprotocol (2026-07-28, streamable-http)](https://modelcontextprotocol.io/specification/2026-07-28/basic/transports/streamable-http).

## Open weights and "free"

"Free" has at least two meanings in the notes: an open-weights model (their reading: you can download the model) and no financial cost — the two are distinct. Organizations might release open weights hoping developers adopt and build on them, test them, and give feedback before a fancier LLM ships. If a model is already trained for coding (python or R), a developer may train a small number of additional weights so it understands their code, goals, and team criteria; running locally is much cheaper, but requires open weights.

## See Also

*(none yet — first article in the wiki)*
