# Hooks

This directory contains lifecycle hooks for your plugin.

Hooks allow you to run custom code at specific points in the plugin lifecycle:
- `on_load.sh` - Runs when the plugin is loaded
- `on_unload.sh` - Runs when the plugin is unloaded
- `on_enable.sh` - Runs when the plugin is enabled
- `on_disable.sh` - Runs when the plugin is disabled

## Example

Create a file named `on_load.sh`:

```bash
#!/bin/bash
echo "Plugin loaded!"
# Add your initialization code here
```

Make sure to make your hooks executable:
```bash
chmod +x hooks/on_load.sh
```
