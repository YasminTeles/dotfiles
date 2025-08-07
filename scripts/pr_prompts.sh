#!/bin/bash

#####
#  This script sets up environment variables for AI prompts used in creating Pull Requests.
#
#  Example usage:
#  gemini --prompt "$PR_DESCRIPTION_PROMPT"
#  gemini --prompt "$PR_TITLE_PROMPT"
#  gh pr create --title "$(gemini --prompt "$PR_TITLE_PROMPT")" --body "$(gemini --prompt "$PR_DESCRIPTION_PROMPT")"
#####

local COMMIT_MESSAGES=$(git log origin/HEAD..)
local FILES_DIFF=$(git diff origin/HEAD)

export PR_DESCRIPTION_PROMPT="
You are an expert software developer and technical writer.
Your task is to write a detailed, well-structured, and professional Pull Request description based on the provided git diff and commit messages.

The description should follow these rules:
1.  Start with the Jira ticket number, if found. The ticket number is typically in a format like 'PROJ-1234' and is usually in the commit message. Add the ticket number at the ending of the description. It must be in the format 'Related to PROJ-1234'.
2.  Provide a clear and concise summary of the changes.
3.  List the key changes, bug fixes, or new features introduced. Use bullet points for readability.
4.  Explain the problem that this PR solves.
5.  If applicable, describe the solution implemented and any alternative approaches that were considered.
6.  Mention any potential side effects or areas for the reviewer to pay special attention to.
7.  The tone should be professional and informative.

---
Here are the commit messages for this branch:
${COMMIT_MESSAGES}

---
Here is the git diff for this branch:
${FILES_DIFF}
"

export PR_TITLE_PROMPT="
You are a skilled software developer and technical writer.
Your task is to generate a concise and descriptive title for a Pull Request based on the provided git diff and commit messages.

The title should adhere to the following conventions:
1.  It must be a single line.
2.  It should clearly and concisely summarize the purpose of the changes.
3.  Make sure the PR title follows Conventional Commits format.
4.  It must be in lowercase.

---
Here are the commit messages for this branch:
${COMMIT_MESSAGES}

---
Here is the git diff for this branch:
${FILES_DIFF}
"
