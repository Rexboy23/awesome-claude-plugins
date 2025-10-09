# Contributing to Awesome Claude Plugins

Thank you for your interest in contributing to the Awesome Claude Plugins marketplace! This document provides guidelines for submitting plugins and improvements.

**Note:** Our plugin format is based on the [official Claude Code plugin examples](https://github.com/anthropics/claude-code/tree/main/plugins).

## How to Contribute

### Adding a New Plugin

1. **Fork the Repository**
   - Fork this repository to your GitHub account
   - Clone your fork locally

2. **Create a Plugin Directory**
   - Navigate to the `plugins/` directory
   - Copy the `plugin-template/` directory to a new directory named `{your-plugin-name}/`
   - Follow the plugin structure documented in `plugins/README.md`

3. **Fill in Plugin Details**
   - Edit the `.claude-plugin/plugin.json` file with your plugin metadata
   - Provide accurate and complete information
   - Use clear, concise descriptions
   - Ensure your plugin repository is publicly accessible

4. **Add Plugin Components**
   - Add lifecycle hooks in the `hooks/` directory as needed
   - Add agent definitions in the `agents/` directory as needed
   - Add custom commands in the `commands/` directory as needed

5. **Validate Your Submission**
   - Verify the `.claude-plugin/plugin.json` file has valid JSON syntax
   - Verify all required fields are present
   - Ensure your plugin name is unique
   - Run `./validate-plugins.sh` to check your plugin structure

6. **Submit a Pull Request**
   - Commit your changes with a clear message: `Add {plugin-name} plugin`
   - Push to your fork
   - Create a pull request to the main repository
   - Provide a brief description of your plugin in the PR

### Plugin Quality Standards

To be accepted, plugins should:

- **Be Functional**: The plugin should work as described
- **Be Well-Documented**: Include clear documentation in the plugin repository
- **Be Maintained**: Show evidence of active maintenance
- **Be Accessible**: Have a publicly accessible repository
- **Be Original**: Not duplicate existing plugins (unless significantly different)
- **Follow Best Practices**: Use semantic versioning, proper licensing, etc.

### Plugin Naming Guidelines

- Use lowercase letters
- Separate words with hyphens (kebab-case)
- Be descriptive but concise
- Avoid special characters
- Examples: `weather-forecast`, `code-formatter`, `task-manager`

### Required Plugin Structure

Each plugin must follow this directory structure:

```
your-plugin-name/
├── .claude-plugin/         # Plugin configuration directory
│   └── plugin.json         # Plugin metadata (JSON)
├── hooks/                  # Lifecycle hooks
├── agents/                 # Agent definitions
└── commands/               # Custom commands
```

The `.claude-plugin/plugin.json` file must contain:

```json
{
  "name": "plugin-name",
  "version": "1.0.0",
  "description": "Clear description of what the plugin does",
  "author": {
    "name": "Your Name",
    "email": "your.email@example.com"
  }
}
```

For more examples, see the [official Claude Code plugins](https://github.com/anthropics/claude-code/tree/main/plugins).

### Updating an Existing Plugin

If you maintain a plugin and need to update its information:

1. Fork the repository
2. Update your plugin's `.claude-plugin/plugin.json` file in the `plugins/{your-plugin-name}/` directory
3. Update any hooks, agents, or commands as needed
4. Increment the version number according to semantic versioning
5. Submit a pull request with the changes

### Removing a Plugin

To request removal of a plugin:

1. Open an issue explaining the reason for removal
2. If you're the plugin author, you can submit a PR removing the directory
3. Reasons for removal might include:
   - Plugin is no longer maintained
   - Plugin repository no longer exists
   - Plugin has security issues
   - Duplicate of another plugin

### Suggesting Improvements

We welcome suggestions for improving the marketplace:

- Open an issue with your suggestion
- Describe the improvement clearly
- Explain the benefits
- If possible, submit a pull request implementing the improvement

### Code of Conduct

Please note that this project follows a Code of Conduct:

- Be respectful and inclusive
- Welcome newcomers
- Give constructive feedback
- Focus on the work, not the person
- Respect different viewpoints and experiences

### Review Process

1. **Initial Review**: Pull requests are reviewed for completeness and format
2. **Validation**: Plugin definitions are checked against the schema
3. **Quality Check**: Plugin repositories are verified for accessibility and documentation
4. **Approval**: Maintainers approve and merge acceptable submissions
5. **Feedback**: If changes are needed, reviewers will provide clear guidance

### Questions?

If you have questions about contributing:

- Check the main [README](README.md)
- Review the [plugins README](plugins/README.md)
- Open an issue for clarification
- Check existing issues and PRs for similar questions

## License

By contributing to this repository, you agree that your contributions will be licensed under the MIT License.

Thank you for helping make Claude more powerful and useful for everyone!
