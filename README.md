# Awesome Claude Plugins

A curated marketplace of awesome plugins for Claude, following the [Claude Plugin Marketplace](https://docs.claude.com/en/docs/claude-code/plugin-marketplaces) specification.

## About

This repository serves as a plugin marketplace for Claude, providing a centralized location to discover and share Claude plugins. Plugins extend Claude's capabilities and enable integration with various tools and services.

**Note:** The plugin examples and structure in this repository are based on the [official Claude Code plugin examples](https://github.com/anthropics/claude-code/tree/main/plugins).

## Marketplace Structure

This marketplace follows the Claude plugin marketplace format:

- `marketplace.json` - Marketplace metadata and configuration
- `plugins/` - Directory containing individual plugin directories
- Each plugin is a directory containing:
  - `.claude-plugin/` - Plugin configuration directory
    - `plugin.json` - Plugin metadata (JSON)
  - `hooks/` - Lifecycle hooks
  - `agents/` - Agent definitions
  - `commands/` - Custom commands

## Available Plugins

Browse the `plugins/` directory to discover available plugins. Each plugin includes:

- **Name**: Unique identifier for the plugin
- **Version**: Semantic versioning
- **Description**: What the plugin does
- **Author**: Plugin maintainer information

### Example Plugins

- **Calculator Plugin** (`example-calculator`) - Basic arithmetic and scientific calculations
- **Weather Plugin** (`example-weather`) - Weather information and forecasts
- **Translator Plugin** (`example-translator`) - Multi-language translation support

## Adding Your Plugin

To add your plugin to this marketplace:

1. Fork this repository
2. Create a new directory in `plugins/` with your plugin name: `plugins/your-plugin-name/`
3. Create the required structure:
   ```
   plugins/your-plugin-name/
   ├── .claude-plugin/         # Plugin configuration directory
   │   └── plugin.json         # Plugin metadata
   ├── hooks/                  # Lifecycle hooks
   ├── agents/                 # Agent definitions
   └── commands/               # Custom commands
   ```

4. Fill in your `.claude-plugin/plugin.json` file with plugin details:

```json
{
  "name": "your-plugin-name",
  "version": "1.0.0",
  "description": "A brief description of what your plugin does",
  "author": {
    "name": "Your Name",
    "email": "your.email@example.com"
  }
}
```

5. Validate your plugin definition locally:
   ```bash
   ./validate-plugins.sh
   ```

6. Submit a pull request with your plugin

### Plugin Guidelines

- Use semantic versioning (MAJOR.MINOR.PATCH)
- Provide clear, concise descriptions
- Ensure your plugin repository is publicly accessible
- Include proper documentation in your plugin repository

For more examples, see the [official Claude Code plugins](https://github.com/anthropics/claude-code/tree/main/plugins).

## Usage

To use this marketplace with Claude:

1. Configure your Claude instance to point to this marketplace
2. Browse available plugins through the Claude interface
3. Install plugins directly from the marketplace
4. Enable/disable plugins as needed for your workflow

Refer to the [official Claude plugin documentation](https://docs.claude.com/en/docs/claude-code/plugin-marketplaces) for detailed setup instructions.

## Validation

We provide tools to validate plugin definitions:

### Local Validation

Run the validation script locally before submitting:

```bash
./validate-plugins.sh
```

This script checks:
- Valid JSON syntax
- Required fields presence
- Semantic versioning format
- Filename consistency with plugin name

### Automated CI Validation

All pull requests are automatically validated through GitHub Actions, which checks:
- Plugin JSON validity
- Marketplace.json validity
- No duplicate plugin names
- All marketplace references are valid

## Contributing

Contributions are welcome! Please read our [CONTRIBUTING.md](CONTRIBUTING.md) guidelines before submitting pull requests.

### Contribution Process

1. Check existing plugins to avoid duplicates
2. Ensure your plugin follows the JSON schema (see [plugins/README.md](plugins/README.md))
3. Validate your plugin definition: `./validate-plugins.sh`
4. Submit a pull request with a clear description
5. Respond to any feedback during review

All pull requests are automatically validated by our CI workflow to ensure quality and consistency.

## License

This marketplace is licensed under the MIT License. See [LICENSE](LICENSE) for details.

Individual plugins may have their own licenses - please check each plugin's repository for details.

## Support

For issues or questions:
- Open an issue in this repository
- Check the [Claude documentation](https://docs.claude.com)
- Review existing issues for similar problems

## Acknowledgments

This repository is inspired by and based on the [official Claude Code plugin examples](https://github.com/anthropics/claude-code/tree/main/plugins).

Thanks to all plugin authors and contributors who help expand Claude's capabilities!
