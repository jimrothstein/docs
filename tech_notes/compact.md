In OpenCode, the practical sign you’re approaching a limit is not a timer — it’s when the session’s token usage gets close to the model’s context window, leaving less room for the next reply and for the compaction process itself.

## What to watch

- Context usage growth.
- Fewer available response tokens.
- Large tool transcripts.
- Auto-compaction behavior.

## Practical rule

For free local or open models, treat the limit as whatever the model’s configured context window is, minus a safety buffer for the next response and compaction. If you want a simple habit, compact when the conversation starts to feel “heavy” with lots of pasted code, tool output, or repeated back-and-forth about the same task.

## Best way to estimate it

Check the model’s configured context limit in OpenCode, then watch how much of that window your ongoing session has consumed. If you use a model with a very large context window, the real bottleneck is often not money but latency, quality drift, or tool-output bloat before you hit the absolute token cap.
