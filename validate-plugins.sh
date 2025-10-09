#!/bin/bash

# Plugin Validation Script
# This script validates plugin directories and .claude-plugin folders in the plugins/ directory

set -e

PLUGINS_DIR="./plugins"
ERRORS=0

echo "🔍 Validating plugin definitions..."
echo ""

# Check if plugins directory exists
if [ ! -d "$PLUGINS_DIR" ]; then
    echo "❌ Error: plugins/ directory not found"
    exit 1
fi

# Required fields for a valid plugin
REQUIRED_FIELDS=("name" "version" "description" "author")
REQUIRED_SUBDIRS=("hooks" "agents" "commands")

# Validate each plugin directory
for plugin_dir in "$PLUGINS_DIR"/*/; do
    # Skip if no directories found or if it's not a directory
    [ -d "$plugin_dir" ] || continue
    
    plugin_name=$(basename "$plugin_dir")
    
    # Skip README.md if it exists as a file
    [ "$plugin_name" = "README.md" ] && continue
    
    echo "📦 Validating: $plugin_name"
    
    # Check if .claude-plugin directory and plugin.json file exist
    plugin_config_dir="$plugin_dir/.claude-plugin"
    plugin_file="$plugin_config_dir/plugin.json"
    
    if [ ! -d "$plugin_config_dir" ]; then
        echo "  ❌ Missing .claude-plugin directory"
        ((ERRORS++))
        echo ""
        continue
    fi
    
    if [ ! -f "$plugin_file" ]; then
        echo "  ❌ Missing plugin.json file in .claude-plugin directory"
        ((ERRORS++))
        echo ""
        continue
    fi
    
    # Check if file is valid JSON
    if ! jq empty "$plugin_file" 2>/dev/null; then
        echo "  ❌ Invalid JSON syntax in plugin.json"
        ((ERRORS++))
        echo ""
        continue
    fi
    
    # Check required fields
    missing_fields=()
    for field in "${REQUIRED_FIELDS[@]}"; do
        if ! jq -e ".$field" "$plugin_file" >/dev/null 2>&1; then
            missing_fields+=("$field")
        fi
    done
    
    if [ ${#missing_fields[@]} -gt 0 ]; then
        echo "  ❌ Missing required fields: ${missing_fields[*]}"
        ((ERRORS++))
    fi
    
    # Validate version format (semantic versioning)
    version=$(jq -r '.version' "$plugin_file")
    if ! [[ $version =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "  ⚠️  Warning: Version should follow semantic versioning (X.Y.Z)"
    fi
    
    # Check if plugin name in plugin.json matches directory name
    plugin_metadata_name=$(jq -r '.name' "$plugin_file")
    if [ "$plugin_name" != "$plugin_metadata_name" ]; then
        echo "  ⚠️  Warning: Directory name should match plugin name in plugin.json ('$plugin_metadata_name')"
    fi
    
    # Check for required subdirectories
    missing_dirs=()
    for subdir in "${REQUIRED_SUBDIRS[@]}"; do
        if [ ! -d "$plugin_dir/$subdir" ]; then
            missing_dirs+=("$subdir")
        fi
    done
    
    if [ ${#missing_dirs[@]} -gt 0 ]; then
        echo "  ⚠️  Warning: Missing subdirectories: ${missing_dirs[*]}"
    fi
    
    if [ ${#missing_fields[@]} -eq 0 ]; then
        echo "  ✅ Valid"
    fi
    echo ""
done

# Summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ $ERRORS -eq 0 ]; then
    echo "✅ All plugins validated successfully!"
    exit 0
else
    echo "❌ Validation failed with $ERRORS error(s)"
    exit 1
fi
