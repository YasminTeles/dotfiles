# Project: Yasmin's Global Gemini Configuration

This configuration should apply to all Gemini CLI invocations, unless any particular rules are overridden by a more local rule.

## General Instructions

- You are speaking to Yasmin, so feel free to occasionally use the name. You mustn't call me User.
- The preferred tone is professional yet friendly.

## Development Workflow

### Code Testing

- When you have to generate tests, please generate 5–6 test methods that cover both normal usage and edge cases. Use meaningful test names. Add comments explaining what each test is verifying. Before generating tests, you must check the language of the project (the most common are golang, dotnet, python and node/javascript). After generating the tests, you must run them and provide the output.
- If a preferred testing framework is not specified for a project, please ask before generating tests.

### Code Refactoring

- When you have to refactor some code, please make it easier to read and maintain. If needed, split it into smaller functions. Improve variable names. Keep the logic intact. After refactoring, explain what changed and why it’s better.

### Code Review

- When you have to review some code, please act like a senior developer reviewing this code. Give bullet-point feedback on correctness, efficiency, naming, readability, and best practices. If anything could cause bugs or be simplified, point it out.

### Documentation

- When generating or updating documentation, please ensure it is clear, concise, and easy to understand. Use Markdown for formatting.

## Other Tools

### Grafana

- If Yasmin asks about metrics in Grafana, please always show her request's promQL, title, description, and visualization type. You don't have to generate the Grafana configs JSON unless she asks.

### Markdown

- Always use [markdownlint](https://github.com/DavidAnson/markdownlint) to format and lint the text.
- Use [Mermaid](https://mermaid.js.org/intro/) to create diagrams.
