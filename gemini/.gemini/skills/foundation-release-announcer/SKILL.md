---
name: foundation-release-announcer
description: Helps write impactful and professional announcements for the `#foundation-releases-feed` Slack channel. Use when Yasmin needs to announce a new release, tool, or update from the Cloud Insights Foundation team.
---

# Skill: Foundation Release Announcer

This skill specializes in creating standardized, impactful, and professional announcements for the `#foundation-releases-feed` Slack channel. It ensures consistency, clarity, and a strong value proposition for every release.

## Core Principles

1.  **Standardized Template**: All announcements MUST follow the specific format below.
2.  **Impact-Driven Tone**: Focus on the *why* and the *benefits*. Use professional yet engaging language.
3.  **Default Team**: The team is always **Cloud Insights Foundation** unless specified otherwise.
4.  **Clarity**: Ensure the purpose and availability are immediately understandable.

## Announcement Template

Every announcement must include these fields:

*   *Release Name:* [Name of the release/feature]
*   *Purpose:* [One-sentence explanation of what it does/why it exists]
*   *Impact:* [Who is affected and what are the benefits (Efficiency, Reliability, DX, etc.)]
*   *Availability:* [GA/Beta/Global/Regional - include rollout status if relevant]
*   *Team:* Cloud Insights Foundation
*   *Useful Links:* [Link 1], [Link 2]

## Workflow

When asked to write an announcement:

1.  **Gather Context**: Analyze the provided context, links, and impact details.
2.  **Refine Impact**: If the impact is technical, translate it into business or developer value (e.g., "Reduced latency by 20%" becomes "Faster response times for end-users and improved system reliability").
3.  **Draft Announcement**: Fill the template using a professional and impactful tone.
4.  **Verify Fields**: Ensure all required fields are present and the team name is correct.

## Examples

**User Prompt:**
> I'm releasing the new 'Metrics Exporter' for our k8s clusters. It helps to export custom metrics to Prometheus. It's GA now. Here is the doc: https://vtex.io/docs/metrics-exporter

**Your Response:**
*Release Name:* Metrics Exporter for Kubernetes
*Purpose:* Enable seamless export of custom application metrics to Prometheus, enhancing cluster-wide observability.
*Impact:* Empower developers with granular visibility into application performance, leading to faster troubleshooting and proactive scaling.
*Availability:* GA – Available across all production clusters.
*Team:* Cloud Insights Foundation
*Useful Links:* [Documentation](https://vtex.io/docs/metrics-exporter)

---

## Resources

- **Impact Phrases**: See [references/impact-phrases.md](references/impact-phrases.md) for professional ways to describe common benefits.
- **Generator Script**: Use [scripts/generate-announcement.cjs](scripts/generate-announcement.cjs) for a structured data-to-text conversion.
