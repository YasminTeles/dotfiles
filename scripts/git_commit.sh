#!/bin/bash

#####
#  This script sets up functions to generate prompts for creating Git messages.
#
#  Example usage:
#  source scripts/git_commit.sh
#  git cm "$(get_git_message)" -m "Related to TICKET_NUMBER"
#####

_get_staged_diff() {
  local files_diff=$(git diff --staged)

  if [ -z "$files_diff" ]; then
    return 1
  fi

  echo "---
Here is the git diff for stage area:
${files_diff}
"
}

get_git_message() {
  local git_data
  git_data=$(_get_staged_diff) || {
    echo "Error: No staged changes found. Please 'git add' files first." >&2
    return 1
  }

  local prompt="
You are a skilled software developer and technical writer.
Your task is to generate a concise and descriptive for a git message based on the provided git diff of stage area.

The message should adhere to the following conventions:
1.  It must be a single line.
2.  It should clearly and concisely summarize the purpose of the changes.
3.  Make sure the message follows the Conventional Commits format.
4.  It must be in lowercase.

${git_data}
"
  gum spin --spinner dot --title "Generating the git message..." --show-output -- gemini "$prompt" -e none
}
