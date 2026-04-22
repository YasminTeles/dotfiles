---
name: slack-announcer
description: Drafts professional, "Short & Punchy" Slack messages for library announcements and project updates. Use this skill when announcing new versions, features, or improvements to Diagnostics or other libraries in general or product-facing channels.
---

# Slack Announcer

Use this skill to create engaging, professional, and concise Slack announcements for library releases and updates.

## Core Mandates

- **Mandatory Information**: The library name and the version are mandatory. If the library name or the version number is not provided, you MUST stop and ask Yasmin for it before proceeding with the draft.
- **Channel Targeting**: This skill is for **general, product, or team channels**. If the announcement is specifically for the `#foundation-releases-feed` channel, use the `foundation-release-announcer` skill instead.
- **Tone**: "Short & Punchy". It must be professional yet friendly and accessible. Avoid overly dense technical jargon unless it adds specific value to the "What's new" section.
- **Structure**:
    1. **Hook**: A friendly greeting and a high-level statement of what's happening (e.g., "We are excited to announce...", "We just pushed a round of improvements...").
    2. **Value Proposition/Context**: Briefly explain *what* the change is and *why* it matters (e.g., "What are Events?", "What's new?").
    3. **Key Highlights**: Use clear headings or bullet points for specific updates (e.g., "Node.js v5.1.8 Updates").
    4. **Closing**: A brief sentence on the impact or a call to check the docs.

## Workflow

1. **Gather Details**: Identify the library name, version number, and the key features/fixes being released. **Crucial**: If the version is missing, you MUST ask Yasmin for it.
2. **Identify Audience**: Determine if this is a general announcement or a specific technical update.
3. **Draft Message**: Apply the "Short & Punchy" tone using the structure above.
4. **Reference Examples**: Refer to [examples.md](references/examples.md) for the preferred style and formatting.

## Guidelines for Content

- **Formatting**: Use Slack-style Markdown (bold for emphasis, single backticks for versions or small code snippets).
- **Clarity**: Explain business or system impact clearly (e.g., "This allows for better tracking... without cluttering standard logs").
- **Conciseness**: Keep the total message length manageable for quick reading in a busy channel.
