# IntelliJ IDEA / GoLand Configuration

Configuration files for JetBrains IDEs.

## Files

- **vimrc** - IdeaVim configuration (symlinked to ~/.ideavimrc)
- **_@user_Everforest Dark Medium.icls** - Active color scheme from GoLand
- **Everforest-Dark.icls** - Custom dark scheme
- **options/** - IDE settings (UI, editor, colors)

## Sync Scripts

- **sync-from-idea.sh** - Export IDEA config to dotfiles
- **sync-to-idea.sh** - Import dotfiles config to IDEA

## Usage

Import to IDEA:
```bash
./idea/sync-to-idea.sh
```

Export from IDEA:
```bash
./idea/sync-from-idea.sh
```

Restart IDEA after syncing.
