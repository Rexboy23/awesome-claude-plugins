#!/bin/bash

# Plugin Validation Script
# This script validates plugin JSON files in the plugins/ directory

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

# Validate each JSON file
for plugin_file in "$PLUGINS_DIR"/*.json; do
    # Skip if no JSON files found
    [ -e "$plugin_file" ] || continue
    
    filename=$(basename "$plugin_file")
    echo "📦 Validating: $filename"
    
    # Check if file is valid JSON
    if ! jq empty "$plugin_file" 2>/dev/null; then
        echo "  ❌ Invalid JSON syntax"
        ((ERRORS++))
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
    
    # Check if plugin name matches filename
    plugin_name=$(jq -r '.name' "$plugin_file")
    expected_filename="${plugin_name}.json"
    if [ "$filename" != "$expected_filename" ]; then
        echo "  ⚠️  Warning: Filename should be '${expected_filename}' (based on plugin name)"
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
