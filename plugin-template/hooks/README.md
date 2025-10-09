# Hooks

This directory contains hooks for your plugin.

Hooks allow you to run custom code at specific points during Claude Code execution. Hooks are defined in a `hooks.json` file and can be triggered by various events.

## Hook Events

Available hook events include:

- **PreToolUse** - Runs before a tool is executed (can modify tool inputs or block execution)
- **PostToolUse** - Runs after a tool completes
- **SessionEnd** - Runs when a session ends
- **Stop** - Runs when Claude stops execution
- **SubagentStop** - Runs when a subagent stops
- **PreCompact** - Runs before context compaction
- **UserPromptSubmit** - Runs when user submits a prompt

## Example

Create a `hooks.json` file:

```json
{
  "description": "Example hooks for your plugin",
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "python3 ${CLAUDE_PLUGIN_ROOT}/hooks/validate_bash.py"
          }
        ]
      }
    ]
  }
}
```

Create the hook script (e.g., `validate_bash.py`):

```python
#!/usr/bin/env python3
import json
import sys

# Read hook input from stdin
input_data = json.load(sys.stdin)

tool_name = input_data.get("tool_name", "")
tool_input = input_data.get("tool_input", {})

# Validate or modify the tool input
# Exit codes:
# 0 - Allow tool to proceed
# 1 - Show stderr to user but not Claude
# 2 - Block tool and show stderr to Claude

sys.exit(0)
```

## Hook Input

Hooks receive JSON input on stdin with the following fields:

- `session_id` - Current session identifier
- `tool_name` - Name of the tool being used
- `tool_input` - Input parameters for the tool
- `hook_event_name` - Name of the triggered event
- `working_directory` - Current working directory

## Exit Codes

- **0** - Allow the tool to proceed normally
- **1** - Show stderr to user but not to Claude
- **2** - Block tool execution and show stderr to Claude (PreToolUse only)

## Matchers

The `matcher` field in hooks.json can match specific tools:
- `"Bash"` - Bash command execution
- `"Edit"` - File editing
- `"Write"` - File writing
- `"MultiEdit"` - Multiple file edits
- `"Read"` - File reading
- Or any other Claude Code tool name

For more information, see the [official hooks documentation](https://docs.claude.com/en/docs/claude-code/hooks).
