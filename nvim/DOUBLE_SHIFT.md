# IntelliJ/GoLand-Style Shift+Shift File Finder

This Neovim configuration implements the beloved **Shift+Shift** file finder from IntelliJ IDEA and GoLand.

## 🎯 How It Works

Since Neovim cannot detect raw Shift key presses (Shift is a modifier key, not a regular key), we use a clever workaround:

**Press `Shift+Space` twice quickly (within 300ms)**

This mimics the IntelliJ Shift+Shift behavior and opens the Telescope file finder.

## 🚀 Usage

### In Normal Mode

```
1. Press Shift+Space
2. Press Shift+Space again (within 300ms)
→ File finder opens!
```

### In Insert Mode

```
1. Press Shift+Space
2. Press Shift+Space again (within 300ms)
→ Exits insert mode and opens file finder!
```

## ⚡ Quick Demo

```
Normal mode:
  [Shift+Space] → (wait < 300ms) → [Shift+Space] → 🎉 File Finder!

Insert mode:
  typing code... [Shift+Space] [Shift+Space] → 🎉 File Finder!
```

## 🎨 Why Shift+Space?

| Reason | Explanation |
|--------|-------------|
| **Closest to Shift+Shift** | Shift+Space requires holding Shift, just like the second Shift press |
| **Natural muscle memory** | Your fingers are already on Shift, just tap Space twice |
| **Fast** | Space bar is large and easy to hit quickly |
| **Non-intrusive** | Doesn't conflict with other common shortcuts |

## 🔧 Technical Details

- **Timeout**: 300ms (same as IntelliJ default)
- **Implementation**: `nvim/lua/config/double_shift.lua`
- **Detection**: Timer-based rapid succession detection
- **Modes**: Works in normal and insert mode

## 📊 Comparison with IntelliJ

| Feature | IntelliJ | Neovim (This Config) |
|---------|----------|----------------------|
| Trigger | Shift+Shift | Shift+Space+Space |
| Timeout | 300ms | 300ms ✅ |
| Search | Files everywhere | Files (Telescope) ✅ |
| Fuzzy search | ✅ | ✅ (Telescope) |
| Preview | ✅ | ✅ (Telescope) |

## 🎯 Alternative Shortcuts

If you prefer other shortcuts, these are also available:

| Shortcut | Description |
|----------|-------------|
| `<Tab>` | Find files (original) |
| `;;` | Double semicolon |
| `<C-p>` | Ctrl+P (VSCode style) |

## 💡 Tips

1. **Practice the rhythm**: Shift+Space, Shift+Space (like a double-tap)
2. **Don't wait too long**: Must be within 300ms (about 1/3 of a second)
3. **Works everywhere**: Normal mode, insert mode, anywhere!
4. **Muscle memory**: After a few uses, it becomes second nature

## 🐛 Troubleshooting

### "It's not working!"

1. Make sure you're pressing Shift+Space (not just Space twice)
2. Press them quickly (within 300ms)
3. Check that Telescope is installed: `:checkhealth telescope`

### "It's too fast/slow!"

Edit `nvim/lua/config/double_shift.lua` and change:
```lua
local double_shift_timeout = 300 -- Change this number (milliseconds)
```

### "I want to use a different key"

Edit `nvim/lua/config/double_shift.lua` and change `<S-Space>` to your preferred key combination.

## 🎉 Enjoy!

You now have IntelliJ/GoLand-style Shift+Shift file finding in Neovim!

Press `Shift+Space` twice quickly and watch the magic happen! ✨

