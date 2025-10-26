# Template Processor

An interactive Go program that processes dotfiles templates with configurable variables.

## Features

- 🔍 **Auto-discovery**: Automatically finds all `.template` files in the dotfiles directory
- 📝 **Variable extraction**: Extracts all `{{VARIABLE}}` placeholders from templates
- ⚙️ **Interactive configuration**: Prompts for missing variables with smart defaults
- 💾 **Persistent config**: Stores configuration in `template-config.json`
- 🎨 **Smart defaults**: Provides sensible defaults for common variables (home dir, colors, fonts)

## Installation

```bash
cd template-processor
go build -o template-processor
```

Or run directly:
```bash
go run main.go
```

## Usage

1. **Run the processor** from the `template-processor` directory:
   ```bash
   ./template-processor
   ```

2. **Answer prompts** for any missing configuration variables

3. **Review configuration** before processing

4. **Confirm** to generate files from templates

## Template Syntax

Templates use `{{VARIABLE_NAME}}` syntax for variable substitution.

### Variable Naming Convention

- Use UPPERCASE with underscores: `{{HOME_DIR}}`, `{{COLOR_PRIMARY}}`
- Variable names must start with a letter or underscore
- Can contain letters, numbers, and underscores

### Example Template

```fish
# config.fish.template
set -gx GOPATH {{HOME_DIR}}/go
set -gx N_PREFIX {{HOME_DIR}}/n
```

## Configuration File

The configuration is stored in `template-config.json` at the dotfiles root:

```json
{
  "variables": {
    "HOME_DIR": "/Users/username",
    "FONT": "JetBrains Mono",
    "COLOR_PRIMARY": "#a7c080",
    "COLOR_SECONDARY": "#dbbc7f",
    "SIGN_KEY": "ABC123DEF456"
  }
}
```

## Supported Variables

The program provides smart defaults for:

- `HOME_DIR` - User's home directory (auto-detected)
- `FONT` - Default font name (defaults to "JetBrains Mono")
- `SIGN_KEY` - GPG signing key (no default)
- `COLOR_*` - Any color variable (defaults to "#000000")

## Creating Templates

1. **Create a template file** with `.template` extension:
   ```bash
   cp config.fish templates/config.fish.template
   ```

2. **Replace hardcoded values** with variables:
   ```fish
   # Before
   set -gx GOPATH /Users/ndyakov/go
   
   # After
   set -gx GOPATH {{HOME_DIR}}/go
   ```

3. **Run the processor** to generate the actual config file

4. **Add generated file to .gitignore** so only the template is tracked

## Integration with init.sh

You can integrate this into your dotfiles setup:

```bash
#!/bin/bash
# In init.sh

# Build and run template processor
cd template-processor
go build -o template-processor
./template-processor
cd ..

# Continue with rest of setup...
```

## Example Workflow

```bash
$ cd template-processor
$ go run main.go

🔧 Dotfiles Template Processor
================================

🔍 Scanning for template files...
Found 3 template file(s)

📝 Variable 'HOME_DIR' not found in config
Enter value for HOME_DIR [/Users/ndyakov]: 

📝 Variable 'COLOR_PRIMARY' not found in config
Enter value for COLOR_PRIMARY [#000000]: #a7c080

📝 Variable 'SIGN_KEY' not found in config
Enter value for SIGN_KEY: ABC123

✅ Configuration saved!

📋 Current Configuration:
========================
  HOME_DIR = /Users/ndyakov
  COLOR_PRIMARY = #a7c080
  SIGN_KEY = ABC123

🚀 Process templates now? (y/n): y

⚙️  Processing templates...
✅ Generated: fish/ndyakov/conf.d/config.fish
✅ Generated: git/gitconfig
✅ Generated: tmux/tmux.conf

🎉 Done!
```

## Tips

- Run the processor whenever you add new template files
- Edit `template-config.json` directly to update variables
- Use descriptive variable names for clarity
- Group related variables with prefixes (e.g., `COLOR_*`, `FONT_*`)

