---
title: "Automate Your Pull Request Descriptions with Gemini and a Simple Bash Script"
date: 2025-08-13
author: "Yasmin Teles"
---

As developers, we all know the importance of a good Pull Request. A well-written PR provides context, explains the changes, and helps reviewers to understand the code better. However, writing a detailed PR description can be a tedious and time-consuming task.

What if I told you that you can automate this process and let AI do the hard work for you? In this blog post, I will share a simple bash script that uses Gemini to generate a PR title and description based on your git diff and commit messages.

## The `pr_prompts.sh` script

The script is called `pr_prompts.sh` and it has two main functions:

*   `get_pr_title`: Generates a concise and descriptive title for your PR, following the Conventional Commits format.
*   `get_pr_description`: Creates a detailed and well-structured description for your PR, including a summary of the changes, the problem it solves, and the solution implemented.

The script uses the `gemini` CLI to interact with the Gemini API and `gum` to display a beautiful spinner while generating the content.

## How to use it

To use the script, you first need to have `gemini` and `gum` installed on your machine. Then, you can simply source the script and use it with the `gh` CLI to create a new PR:

```bash
source scripts/pr_prompts.sh
gh pr create --title "$(get_pr_title)" --body "$(get_pr_description)"
```

And that's it! The script will automatically generate a title and description for your PR and open it in your browser.

## The result

The generated title will be a single line that summarizes the changes, following the Conventional Commits format. The description will be a detailed and well-structured text that includes:

*   A summary of the changes.
*   A list of the key changes, bug fixes, or new features introduced.
*   The problem that this PR solves.
*   The solution implemented and any alternative approaches that were considered.
*   Any potential side effects or areas for the reviewer to pay special attention to.
*   The Jira ticket number, if found in the commit messages.

## Conclusion

This simple script can save you a lot of time and effort, and help you to create better Pull Requests. By automating the process of writing PR descriptions, you can focus on what really matters: writing code.

I hope you find this script useful. If you have any questions or suggestions, feel free to reach out to me.
