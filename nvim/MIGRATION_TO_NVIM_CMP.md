# Migration from CoC to nvim-cmp

## What Changed

### Removed
- ✅ `coc.nvim` plugin
- ✅ `coc-settings.json` configuration file
- ✅ All CoC-specific keybindings

### Added
- ✅ `nvim-cmp` - Native Neovim completion engine
- ✅ `nvim-lspconfig` - Native LSP configuration
- ✅ `mason.nvim` - LSP server installer
- ✅ `LuaSnip` - Snippet engine
- ✅ Multiple completion sources (LSP, buffer, path, snippets)

## New Plugins

### Core Completion
- `hrsh7th/nvim-cmp` - Main completion engine
- `hrsh7th/cmp-nvim-lsp` - LSP completion source
- `hrsh7th/cmp-buffer` - Buffer completion source
- `hrsh7th/cmp-path` - Path completion source
- `hrsh7th/cmp-cmdline` - Command line completion

### LSP
- `neovim/nvim-lspconfig` - LSP configuration
- `williamboman/mason.nvim` - LSP server installer
- `williamboman/mason-lspconfig.nvim` - Bridge between mason and lspconfig
- `j-hui/fidget.nvim` - LSP progress notifications
- `folke/neodev.nvim` - Lua LSP configuration for Neovim

### Snippets
- `L3MON4D3/LuaSnip` - Snippet engine
- `saadparwaiz1/cmp_luasnip` - LuaSnip completion source
- `rafamadriz/friendly-snippets` - Snippet collection

## LSP Servers Installed

The following LSP servers will be automatically installed via Mason:

- **gopls** - Go
- **lua_ls** - Lua
- **ts_ls** - TypeScript/JavaScript
- **html** - HTML
- **cssls** - CSS
- **jsonls** - JSON
- **yamlls** - YAML
- **bashls** - Bash
- **pyright** - Python

## New Keybindings

### LSP Navigation
- `gd` - Go to definition
- `gD` - Go to declaration
- `gi` - Go to implementation
- `gt` - Go to type definition
- `gr` - Find references
- `K` - Hover documentation
- `<C-k>` - Signature help

### LSP Actions
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code action
- `<leader>fm` - Format buffer

### Diagnostics
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `<leader>e` - Show diagnostic float
- `<leader>dl` - Diagnostic location list

### Completion
- `<C-n>` - Next completion item
- `<C-p>` - Previous completion item
- `<C-Space>` - Trigger completion
- `<CR>` - Confirm selection
- `<Tab>` - Next item or expand snippet
- `<S-Tab>` - Previous item

## First Time Setup

1. **Open Neovim**
   ```bash
   nvim
   ```

2. **Install plugins** (Lazy.nvim will auto-install)
   - Wait for all plugins to install
   - You'll see a progress window

3. **Install LSP servers**
   ```vim
   :Mason
   ```
   - All configured servers should auto-install
   - Or manually install: press `i` on a server

4. **Restart Neovim**
   ```bash
   :qa
   nvim
   ```

## Features

### Autocompletion
- ✅ LSP-based completion (context-aware)
- ✅ Buffer completion (words from open buffers)
- ✅ Path completion (file paths)
- ✅ Snippet completion
- ✅ Command line completion
- ✅ Ghost text (preview)
- ✅ Icons for completion kinds

### LSP Features
- ✅ Go to definition/declaration/implementation
- ✅ Find references
- ✅ Hover documentation
- ✅ Signature help
- ✅ Rename symbol
- ✅ Code actions
- ✅ Auto-formatting
- ✅ Diagnostics (errors/warnings)
- ✅ Inline diagnostics with virtual text

### Snippets
- ✅ VSCode-style snippets
- ✅ Tab to expand and jump
- ✅ Snippet collection included

## Troubleshooting

### LSP not working
```vim
:LspInfo
```
Check if LSP is attached to the buffer.

### Install/update LSP servers
```vim
:Mason
```
Press `U` to update all, or `i` to install specific servers.

### Completion not showing
1. Make sure you're in insert mode
2. Try `<C-Space>` to manually trigger
3. Check `:LspInfo` to ensure LSP is running

### Format not working
```vim
:lua vim.lsp.buf.format()
```
Or use `<leader>fm` keybinding.

## Benefits Over CoC

| Feature | CoC | nvim-cmp |
|---------|-----|----------|
| **Performance** | Good | Better (native Lua) |
| **Dependencies** | Node.js required | None |
| **Configuration** | JSON | Lua (more flexible) |
| **Integration** | VSCode-like | Native Neovim |
| **Startup time** | Slower | Faster |
| **Memory usage** | Higher | Lower |
| **Customization** | Limited | Extensive |

## Migration Notes

- All LSP functionality is now native to Neovim
- Completion is faster and more responsive
- No Node.js dependency required
- Better integration with Neovim's native features
- More customizable and extensible

