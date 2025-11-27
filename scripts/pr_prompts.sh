#!/bin/bash

#####
#  This script sets up functions to generate prompts for creating Pull Requests.
#
#  Example usage:
#  source scripts/pr_prompts.sh
#  gh pr create --title "$(get_pr_title)" --body "$(get_pr_description)"
#####

_get_git_data() {
  local commit_messages=$(git log "origin/HEAD"..)
  local files_diff=$(git diff "origin/HEAD")

  echo "---
Here are the commit messages for this branch:
${commit_messages}

---
Here is the git diff for this branch:
${files_diff}
"
}

get_pr_description() {
  local git_data=$(_get_git_data)
  local prompt="
You are an expert software developer and technical writer.
Your task is to write a detailed, well-structured, and professional Pull Request description based on the provided git diff and commit messages.

The description should follow these rules:
1. Provide a clear and concise summary of the changes.
2. List the key changes, bug fixes, or new features introduced. Use bullet points for readability.
3. The tone should be professional and informative.
4. Scan commit messages for Jira tickets (e.g., 'PROJ-1234') and incident tickets (e.g., 'INC-1234'). If found, append 'Related to TICKET_NUMBER' to the end of the description. You can append many tickers in one line, such like, 'Related to TICKET_NUMBER1 and TICKET_NUMBER2'.

${git_data}
"
  gum spin --spinner dot --title "Generating the PR description..." --show-output -- gemini "$prompt"
}

get_pr_title() {
  local git_data=$(_get_git_data)
  local prompt="
You are a skilled software developer and technical writer.
Your task is to generate a concise and descriptive title for a Pull Request based on the provided git diff and commit messages.

The title should adhere to the following conventions:
1.  It must be a single line.
2.  It should clearly and concisely summarize the purpose of the changes.
3.  Make sure the PR title follows Conventional Commits format.
4.  It must be in lowercase.

${git_data}
"
  gum spin --spinner dot --title "Generating the PR title..." --show-output -- gemini "$prompt"
}
