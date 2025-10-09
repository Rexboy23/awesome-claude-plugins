# Awesome Claude Plugins

A curated marketplace of awesome plugins for Claude, following the [Claude Plugin Marketplace](https://docs.claude.com/en/docs/claude-code/plugin-marketplaces) specification.

## About

This repository serves as a plugin marketplace for Claude, providing a centralized location to discover and share Claude plugins. Plugins extend Claude's capabilities and enable integration with various tools and services.

## Marketplace Structure

This marketplace follows the Claude plugin marketplace format:

- `marketplace.json` - Marketplace metadata and configuration
- `plugins/` - Directory containing individual plugin definitions
- Each plugin is defined in a JSON file with metadata including name, description, version, author, and capabilities

## Available Plugins

Browse the `plugins/` directory to discover available plugins. Each plugin includes:

- **Name & Display Name**: Unique identifier and human-readable name
- **Version**: Semantic versioning
- **Description**: What the plugin does
- **Author**: Plugin maintainer information
- **Keywords**: Tags for discoverability
- **Category**: Plugin classification
- **Capabilities**: List of features and functionalities
- **Repository**: Source code location

### Example Plugins

- **Calculator Plugin** (`example-calculator`) - Basic arithmetic and scientific calculations
- **Weather Plugin** (`example-weather`) - Weather information and forecasts
- **Translator Plugin** (`example-translator`) - Multi-language translation support

## Adding Your Plugin

To add your plugin to this marketplace:

1. Fork this repository
2. Create a new JSON file in the `plugins/` directory following this template:

```json
{
  "name": "your-plugin-name",
  "displayName": "Your Plugin Display Name",
  "version": "1.0.0",
  "description": "A brief description of what your plugin does",
  "author": {
    "name": "Your Name",
    "email": "your.email@example.com"
  },
  "keywords": ["keyword1", "keyword2", "keyword3"],
  "license": "MIT",
  "homepage": "https://github.com/yourusername/your-plugin",
  "repository": {
    "type": "git",
    "url": "https://github.com/yourusername/your-plugin"
  },
  "main": "index.js",
  "category": "utilities",
  "capabilities": [
    "List of features",
    "Your plugin provides"
  ]
}
```

3. Submit a pull request with your plugin definition

### Plugin Guidelines

- Use semantic versioning (MAJOR.MINOR.PATCH)
- Provide clear, concise descriptions
- Include relevant keywords for discoverability
- Specify an appropriate category
- List all major capabilities
- Ensure your plugin repository is publicly accessible
- Include proper documentation in your plugin repository

### Categories

Common plugin categories include:
- `utilities` - General utility tools
- `information` - Information retrieval and search
- `language` - Translation and language processing
- `productivity` - Productivity and workflow tools
- `development` - Developer tools and integrations
- `data` - Data processing and analysis
- `communication` - Messaging and communication tools
- `media` - Media processing and manipulation

## Usage

To use this marketplace with Claude:

1. Configure your Claude instance to point to this marketplace
2. Browse available plugins through the Claude interface
3. Install plugins directly from the marketplace
4. Enable/disable plugins as needed for your workflow

Refer to the [official Claude plugin documentation](https://docs.claude.com/en/docs/claude-code/plugin-marketplaces) for detailed setup instructions.

## Contributing

Contributions are welcome! Please read our contributing guidelines before submitting pull requests.

### Contribution Process

1. Check existing plugins to avoid duplicates
2. Ensure your plugin follows the JSON schema
3. Test your plugin definition for valid JSON
4. Submit a pull request with a clear description
5. Respond to any feedback during review

## License

This marketplace is licensed under the MIT License. See [LICENSE](LICENSE) for details.

Individual plugins may have their own licenses - please check each plugin's repository for details.

## Support

For issues or questions:
- Open an issue in this repository
- Check the [Claude documentation](https://docs.claude.com)
- Review existing issues for similar problems

## Acknowledgments

Thanks to all plugin authors and contributors who help expand Claude's capabilities!
