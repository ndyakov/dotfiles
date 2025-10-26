# Neovim Keybindings Reference

Leader key: `,` (comma)

## File Navigation

| Key | Action |
|-----|--------|
| `<Tab>` | Open Buffers (FZF buffer list) |
| `<BS>` (Backspace) | Open FZF (fuzzy file finder) |
| `<Shift-F>` | Open Ag (Silver Searcher - search in files) |
| `<C-b>` | List buffers (FZF) |
| `<F20>` | Open Ag (search in files) |
| `<leader>f` | Search word under cursor with Ag |
| `<leader>nt` | Toggle NvimTree (file explorer) |
| `<leader>nf` | Find current file in NvimTree |

## Editing

| Key | Action |
|-----|--------|
| `<C-s>` | Save file (works in normal, insert, visual) |
| `U` | Redo |
| `<leader>v` | Select just pasted text |
| `<leader>w` | Show trailing whitespace |
| `<leader>W` | Clear trailing whitespace |
| `<leader>s` | Toggle spell check |

## Commenting (Comment.nvim)

| Key | Action |
|-----|--------|
| `gcc` | Toggle comment on current line |
| `gc{motion}` | Toggle comment on motion (e.g., `gcap` for paragraph) |
| `gc` | Toggle comment on selection (visual mode) |
| `gbc` | Toggle block comment on current line |
| `gb` | Toggle block comment on selection (visual mode) |
| `gcO` | Add comment on line above |
| `gco` | Add comment on line below |
| `gcA` | Add comment at end of line |

## Surround (nvim-surround)

| Key | Action | Example |
|-----|--------|---------|
| `ys{motion}{char}` | Add surround | `ysiw"` - surround word with quotes |
| `yss{char}` | Surround entire line | `yss)` - surround line with () |
| `cs{old}{new}` | Change surround | `cs"'` - change " to ' |
| `ds{char}` | Delete surround | `ds"` - delete surrounding quotes |
| `S{char}` | Surround selection (visual mode) | Select text, then `S"` |

**Common surrounds:** `"` `'` `` ` `` `(` `)` `[` `]` `{` `}` `<` `>` `t` (HTML tag)

## Visual Mode

| Key | Action |
|-----|--------|
| `<Tab>` | Indent right |
| `<Shift-Tab>` | Indent left |

## Buffers

| Key | Action |
|-----|--------|
| `<C-l>` | Next buffer |
| `<C-h>` | Previous buffer |
| `<C-q>` | Delete buffer |
| `<leader><leader>` | Toggle between last two buffers |

## Tabs

| Key | Action |
|-----|--------|
| `,to` | Open current buffer in new tab |
| `,tq` | Close tab |
| `[t` | Previous tab |
| `]t` | Next tab |

## Splits/Windows

### Create Splits
| Key | Action |
|-----|--------|
| `<leader>-` | Horizontal split |
| `<leader>=` | Vertical split |

### Navigate Splits
| Key | Action |
|-----|--------|
| `<C-k>` | Move to split above |
| `<C-j>` | Move to split below |
| `<C-h>` | Move to split left (conflicts with prev buffer) |
| `<C-l>` | Move to split right (conflicts with next buffer) |

### Resize Splits
| Key | Action |
|-----|--------|
| `<C-Up>` | Increase height by 2 |
| `<C-Down>` | Decrease height by 2 |
| `<C-Right>` | Increase width by 2 |
| `<C-Left>` | Decrease width by 2 |
| `<leader>+` | Increase height |
| `<leader>_` | Decrease height |
| `<leader>>` | Increase width |
| `<leader><` | Decrease width |

## Quickfix & Location Lists

| Key | Action |
|-----|--------|
| `[q` | Previous quickfix item |
| `]q` | Next quickfix item |
| `,q` | Open quickfix list in Telescope |
| `[a` | Previous location list item |
| `]a` | Next location list item |
| `,a` | Toggle location list |
| `,aa` | First location list item |

## Diagnostics & Errors (Trouble.nvim)

| Key | Action |
|-----|--------|
| `,xx` | Toggle diagnostics (all files) |
| `,xX` | Toggle diagnostics (current buffer only) |
| `,xs` | Toggle symbols outline |
| `,xl` | Toggle LSP definitions/references |
| `,xL` | Toggle location list |
| `,xQ` | Toggle quickfix list |

**Trouble Commands:**
- `:Trouble diagnostics` - Show all diagnostics
- `:Trouble symbols` - Show document symbols
- `:Trouble lsp` - Show LSP references/definitions

## Jumplist & f-navigation

| Key | Action |
|-----|--------|
| `[w` | Jump backward (Ctrl-o) |
| `]w` | Jump forward (Ctrl-i) |
| `[f` | Previous f/t match (,) |
| `]f` | Next f/t match (;) |

## Git (Gitsigns)

| Key | Action |
|-----|--------|
| `gp` | Preview hunk |
| `gs` | Stage hunk |
| `gu` | Undo stage hunk |
| `gr` | Reset hunk |
| `[g` | Previous hunk |
| `]g` | Next hunk |
| `gb` | Blame line |
| `gd` | Diff this |

## LSP (Language Server Protocol)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `gr` | Find references |
| `K` | Hover documentation |
| `<C-k>` | Signature help (normal & insert mode) |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>fm` | Format buffer |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>e` | Show diagnostic float |
| `<leader>dl` | Diagnostic location list |
| `<leader>dq` | Show all diagnostics in Telescope quickfix |

## Completion (nvim-cmp)

| Key | Action |
|-----|--------|
| `<C-n>` | Next completion item |
| `<C-p>` | Previous completion item |
| `<C-d>` | Scroll docs down |
| `<C-f>` | Scroll docs up |
| `<C-Space>` | Trigger completion |
| `<C-e>` | Close completion |
| `<CR>` | Confirm selection |
| `<Tab>` | Next item or expand snippet |
| `<S-Tab>` | Previous item or jump back in snippet |

## Go Development

| Key | Action |
|-----|--------|
| `<leader>gd` | Go to definition (GoDef) |
| `<leader>gf` | Smart: GoDef OR GoReferrers in Telescope (if at definition, searches only your codebase) |
| `<leader>t` | Run tests |
| `<leader>tf` | Run test function |

## AI Assistant (GitHub Copilot)

| Key | Action |
|-----|--------|
| `<Tab>` | Accept Copilot suggestion (insert mode) |
| `<leader>ce` | Copilot enable |
| `<leader>cd` | Copilot disable |
| `<leader>cs` | Copilot status |
| `<leader>cp` | Copilot panel (view suggestions) |

### Copilot Commands

| Command | Action |
|---------|--------|
| `:Copilot setup` | Initial setup and authentication |
| `:Copilot status` | View Copilot status |
| `:Copilot enable` | Enable Copilot |
| `:Copilot disable` | Disable Copilot |
| `:Copilot panel` | Open suggestions panel |
| `:Copilot signout` | Sign out of Copilot |

### Copilot Insert Mode Keys

| Key | Action |
|-----|--------|
| `<Tab>` | Accept suggestion |
| `<M-]>` (Alt-]) | Next suggestion |
| `<M-[>` (Alt-[) | Previous suggestion |
| `<M-\>` (Alt-\) | Dismiss suggestion |

## Misc

| Key | Action |
|-----|--------|
| `;` | Command mode (same as :) |
| `<leader>l` | Toggle relative line numbers |
| `<leader>n` | Toggle search highlight |
| `<leader>ev` | Edit nvim config |
| `<F1>` | Disabled (was help) |
| Arrow keys | Disabled (use hjkl) |

## Telescope Actions (in Telescope prompt)

| Key | Action |
|-----|--------|
| `<C-b>` | Send to quickfix list |
| `<C-t>` | Open in new tab |
| `<C-x>` | Open in horizontal split |
| `<C-v>` | Open in vertical split |

## Mac Option+Key Combos (if your terminal supports them)

These are preserved from the original vimrc but may not work in all terminals:

| Key | Action |
|-----|--------|
| `Option+-` (–) | Horizontal split |
| `Option+=` (≠) | Vertical split |
| `Option+k` (˚) | Move to split above |
| `Option+j` (∆) | Move to split below |
| `Option+h` (˙) | Move to split left |
| `Option+l` (¬) | Move to split right |
| `Option+q` (œ) | Close window |

## Notes

- Leader key is `,` (comma)
- Most navigation uses `[` and `]` prefixes for prev/next
- Git commands use `g` prefix
- Window/split commands use `<leader>` prefix
- Ctrl commands are for buffers and file operations

