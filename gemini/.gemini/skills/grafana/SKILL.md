---
name: grafana
description: Generates PromQL queries and metadata for Grafana panels. Use when asked about Grafana metrics, dashboards, or visualizations.
---
# Skill: Grafana

This skill assists in creating monitoring panels for Grafana by providing the necessary PromQL queries and associated metadata.

## Instructions

1.  When Yasmin asks for a metric, dashboard, or panel for Grafana, you MUST provide the following information in a structured Markdown block.
2.  Analyze the request to determine the correct PromQL query, a suitable title, a clear description, and the best visualization type.
3.  You MUST NOT generate the full Grafana JSON configuration unless Yasmin explicitly asks for it.

## Example

**User Prompt:**

> I need a panel to see the error rate (5xx) for the `api-gateway`.

**Your Response:**

```markdown
- **Title**: API Gateway - Error Rate (5xx)
- **Description**: This panel shows the percentage of 5xx server errors for the `api-gateway` service.
- **Visualization**: Time series
- **PromQL**:
  ```promql
  sum(rate(http_requests_total{job="api-gateway", code=~"5.."}[5m])) / sum(rate(http_requests_total{job="api-gateway"}[5m])) * 100
  ```
```
