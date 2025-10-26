# Neovim Keybindings Reference

Leader key: `,` (comma)

## File Navigation

| Key | Action |
|-----|--------|
| `<Tab>` | Find files (Telescope) |
| `<C-b>` | List buffers (Telescope) |
| `<F20>` | Live grep (Telescope) |
| `` ` `` | Tags (Telescope) |
| `<leader>f` | Search word under cursor |
| `<BS>` | Toggle NvimTree |
| `<leader>nf` | Find file in NvimTree |

## Editing

| Key | Action |
|-----|--------|
| `<C-s>` | Save file (works in normal, insert, visual) |
| `U` | Redo |
| `<leader>v` | Select just pasted text |
| `<leader>w` | Show trailing whitespace |
| `<leader>W` | Clear trailing whitespace |
| `<leader>s` | Toggle spell check |

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
| `<leader>+` | Increase height |
| `<leader>_` | Decrease height |
| `<leader>>` | Increase width |
| `<leader><` | Decrease width |

## Quickfix & Location Lists

| Key | Action |
|-----|--------|
| `[q` | Previous quickfix item |
| `]q` | Next quickfix item |
| `,q` | Toggle quickfix list |
| `[a` | Previous location list item |
| `]a` | Next location list item |
| `,a` | Toggle location list |
| `,aa` | First location list item |

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

## Go Development

| Key | Action |
|-----|--------|
| `<leader>gd` | Go to definition |
| `<leader>t` | Run tests |
| `<leader>tf` | Run test function |

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

