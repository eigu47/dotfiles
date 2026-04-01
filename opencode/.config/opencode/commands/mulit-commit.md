---
description: Generate Git commits following the Conventional Commits specification
agent: build
model: opencode/gpt-5.1-codex-mini
---

Assist in creating clean, well-structured Git commits using the **Conventional Commits** format

## Behavior

- Analyze the current working tree and staged changes
- Group changes by feature, scope, or theme when appropriate
- Suggest **separate commits** if multiple logical changes are detected
- **Ask for explicit user confirmation** before creating any commit, showing:
  - The proposed commit message
  - The files included in each commit
- Use a concise, imperative description
- Omit the scope if it is not applicable
- After committing, show a summary of the commits
