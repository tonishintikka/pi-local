# Pi agent instructions

## Context search

Search the knowledge vault before starting a task:

```
rg "keyword" /obsidian/
```

Add a relevant note as read-only context with `/read /obsidian/path/to/note.md`.

## Task scope

- One file or one function per task
- If a task touches more than 2 files, ask to split it first
- Minimal diffs — only change what the task requires

## Code style

- Follow conventions already in the file
- No comments unless the WHY is non-obvious
- No auto-commits without confirmation

## Context budget

Running on a local model. Keep tool output concise:
- Use `rg -l` to find files before reading them
- Pipe long output through `head -20`
