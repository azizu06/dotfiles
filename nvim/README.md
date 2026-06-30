# Neovim config

My personal Neovim setup, built on [LazyVim](https://lazyvim.org). Part of a
fully terminal-based workflow (cmux + Ghostty, themed Catppuccin Mocha).

## Reproduce on a new machine

```bash
# tools
brew install neovim fd ripgrep lazygit tree-sitter-cli
brew install --cask font-jetbrains-mono-nerd-font   # then set terminal font to it

# config
git clone https://github.com/azizu06/nvim ~/.config/nvim
nvim    # first launch installs all plugins + LSP servers automatically
```

## What's inside

- **Languages** (LSP + formatters/linters via Mason): TypeScript/JavaScript, Python,
  Go, JSON, YAML, Markdown, Tailwind, Docker, SQL
- **Theme**: Catppuccin Mocha (`lua/plugins/colorscheme.lua`)
- **Obsidian**: `obsidian.nvim` wired to my vault (`lua/plugins/obsidian.lua`)
- **Keymaps**: `jj` / `jk` → Esc, plus all LazyVim defaults (`lua/config/keymaps.lua`)

## Structure

```
init.lua              -> bootstraps lua/config/lazy.lua
lua/config/           -> options, keymaps, autocmds, lazy + extras
lua/plugins/          -> my plugin specs / overrides
lazy-lock.json        -> pinned plugin versions (reproducible installs)
```
