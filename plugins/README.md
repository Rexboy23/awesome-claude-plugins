# Plugin Definitions

This directory contains JSON definitions for all plugins available in the Awesome Claude Plugins marketplace.

## Plugin Schema

Each plugin must be defined as a JSON file with the following structure:

### Required Fields

- `name` (string): Unique identifier for the plugin (lowercase, hyphens allowed)
- `displayName` (string): Human-readable name shown in UI
- `version` (string): Semantic version (e.g., "1.0.0")
- `description` (string): Brief description of plugin functionality
- `author` (object): Plugin author information
  - `name` (string): Author's name
  - `email` (string, optional): Contact email
- `keywords` (array): Tags for search and discovery
- `license` (string): License identifier (e.g., "MIT", "Apache-2.0")
- `repository` (object): Source code location
  - `type` (string): Repository type (usually "git")
  - `url` (string): Repository URL
- `main` (string): Entry point file
- `category` (string): Plugin category

### Optional Fields

- `homepage` (string): Plugin website or documentation URL
- `capabilities` (array): List of key features and functionalities
- `dependencies` (object): Plugin dependencies
- `engines` (object): Required runtime versions
- `config` (object): Configuration options

## Example

```json
{
  "name": "example-plugin",
  "displayName": "Example Plugin",
  "version": "1.0.0",
  "description": "An example plugin demonstrating the schema",
  "author": {
    "name": "Plugin Author",
    "email": "author@example.com"
  },
  "keywords": ["example", "demo", "template"],
  "license": "MIT",
  "homepage": "https://github.com/example/plugin",
  "repository": {
    "type": "git",
    "url": "https://github.com/example/plugin"
  },
  "main": "index.js",
  "category": "utilities",
  "capabilities": [
    "Feature 1",
    "Feature 2",
    "Feature 3"
  ]
}
```

## Naming Convention

Plugin definition files should be named using the plugin's unique identifier:
- Format: `{name}.json`
- Example: `example-calculator.json` for a plugin named "example-calculator"

## Validation

Before submitting, ensure your plugin definition:
1. Is valid JSON (use a JSON validator)
2. Contains all required fields
3. Uses semantic versioning
4. Has a unique name (not already in use)
5. Points to a publicly accessible repository
6. Includes clear, accurate descriptions

## Categories

Choose the most appropriate category for your plugin:

- **utilities**: General-purpose tools and helpers
- **information**: Search, lookup, and information retrieval
- **language**: Translation, NLP, and language processing
- **productivity**: Task management, scheduling, and workflow
- **development**: Developer tools, code helpers, and integrations
- **data**: Data processing, analysis, and visualization
- **communication**: Messaging, notifications, and collaboration
- **media**: Image, audio, and video processing
- **finance**: Financial tools and integrations
- **education**: Learning and educational resources
- **entertainment**: Games and entertainment
- **other**: Plugins that don't fit standard categories

## Submission Process

1. Create a new JSON file in this directory
2. Follow the schema and naming conventions
3. Test your JSON for validity
4. Submit via pull request to the main repository
5. Wait for review and approval

## Questions?

For help with plugin definitions, see the main README or open an issue in the repository.
