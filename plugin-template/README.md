# Plugin Template

This is a template for creating new Claude plugins.

## Usage

1. Copy this entire directory to `plugins/your-plugin-name/`
2. Edit the `.claude-plugin/plugin.json` file with your plugin details
3. Add hooks, agents, and commands as needed
4. Test your plugin
5. Submit a pull request

## Structure

- `.claude-plugin/` - Plugin configuration directory
  - `plugin.json` - Plugin metadata (edit this with your details)
- `hooks/` - Lifecycle hooks (see hooks/README.md)
- `agents/` - Agent definitions (see agents/README.md)
- `commands/` - Custom commands (see commands/README.md)

## Next Steps

1. Update the `name` field in `.claude-plugin/plugin.json` to match your directory name
2. Update the `version`, `description`, and `author` fields
3. Add your implementation in the hooks/, agents/, and commands/ directories
4. Validate using `./validate-plugins.sh`
