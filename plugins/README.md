# Plugin Definitions

This directory contains JSON definitions for all plugins available in the Awesome Claude Plugins marketplace.

**Note:** The plugin schema is based on the [official Claude Code plugin format](https://github.com/anthropics/claude-code/tree/main/plugins).

## Plugin Schema

Each plugin must be defined as a JSON file with the following structure:

### Required Fields

- `name` (string): Unique identifier for the plugin (lowercase, hyphens allowed)
- `version` (string): Semantic version (e.g., "1.0.0")
- `description` (string): Brief description of plugin functionality
- `author` (object): Plugin author information
  - `name` (string): Author's name
  - `email` (string): Contact email

## Example

```json
{
  "name": "example-plugin",
  "version": "1.0.0",
  "description": "An example plugin demonstrating the schema",
  "author": {
    "name": "Plugin Author",
    "email": "author@example.com"
  }
}
```

For more examples, see the [official Claude Code plugins](https://github.com/anthropics/claude-code/tree/main/plugins).

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
5. Includes clear, accurate descriptions

## Submission Process

1. Create a new JSON file in this directory
2. Follow the schema and naming conventions
3. Test your JSON for validity
4. Submit via pull request to the main repository
5. Wait for review and approval

## Questions?

For help with plugin definitions, see the main README or open an issue in the repository.
