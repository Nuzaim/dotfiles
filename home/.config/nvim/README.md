# Vanilla Neovim configuration

This is a small Neovim configuration with lazy.nvim as the plugin manager.
Space is the leader key. The file explorer is toggled with `<leader>e`.

Telescope search mappings:

- `<leader>ff`: find files
- `<leader>fg`: search words across the project
- `<leader>fw`: search for the word under the cursor
- `<leader>us`: toggle spell checking in the current window
- `<leader>ss`: show spelling suggestions for the word under the cursor

Python language support uses Pyright and Go language support uses gopls; Mason
installs and enables both automatically. Requires Neovim 0.11 or newer,
Node.js with npm for Pyright, and Go available in `PATH` for gopls. Restart
Neovim after adding the configuration so lazy.nvim can install the plugins and
Mason can install the servers. Use `:Mason` to check server installations and
`:checkhealth vim.lsp` to check LSP status.

Neovim's built-in LSP mappings include `K` for hover, `grn` for rename, `grr`
for references, and `gra` for code actions. Use `<C-x><C-o>` in insert mode for
LSP completion, `<leader>f` to open line diagnostics (showing their source when
multiple sources report messages), and `[d`/`]d` to move between diagnostics.
