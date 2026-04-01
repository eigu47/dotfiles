---
description: Generate a Git commit from the current changes
agent: build
model: opencode/claude-3-5-haiku
---

- Create a single Git commit using the **Conventional Commits** format
- Analyze **only staged changes**
  - If no files are staged, **stage all changes**
- Use a concise, imperative description
- After committing, show a summary of the commit
