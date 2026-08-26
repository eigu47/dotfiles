---
description: Generate Git commits following the Conventional Commits specification
agent: build
---

Create clean Git commits using the **Conventional Commits** format.

## Workflow

1. Inspect `git status`, the full diff for tracked changes, staged changes, and the recent commit history. Establish exactly which files and hunks are candidates; account for every modified file before proposing a commit.
2. Group changes into vertical slices by task or purpose, including all relevant file types and layers. Split independent tasks into separate commits; do not split by file type or layer, and keep unrelated user changes out.
3. Draft one Conventional Commit message per proposed commit: `type(scope): imperative description`. Use a valid type, omit `scope` when it adds no information, and keep the description concise.
4. Present each proposal with its message and exact file list. Call the native `question` tool, when available, with explicit options for confirmation or cancellation. If it is unavailable, ask for confirmation in plain text and wait for the user's reply. Do not stage, commit, or amend anything until the user confirms.
5. After confirmation, stage only the confirmed files or hunks and create the proposed commit(s) without `--amend`. If staging or committing changes the plan, stop and ask again through `question`.
6. Verify the result with `git status` and the commit summary, then report the commit hash, message, and files committed. If anything remains uncommitted, identify it explicitly.

## Completion

The task is complete only when every confirmed commit has been created and verified, and all remaining working-tree changes have been reported.
