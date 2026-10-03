# Vanilla Neovim configuration

This is a small Neovim configuration with lazy.nvim as the plugin manager.
Space is the leader key. The file explorer is toggled with `<leader>e`.

Telescope search mappings:

- `<leader>ff`: find files
- `<leader>fg`: search words across the project
- `<leader>fw`: search for the word under the cursor

Python language support uses Pyright, installed automatically through Mason.
Requires Neovim 0.11 or newer and Node.js/npm. Restart Neovim after adding the
configuration so lazy.nvim can install the plugins, then open a Python file.
Use `:Mason` to check the server installation and `:checkhealth vim.lsp` to check
LSP status.

Neovim's built-in LSP mappings include `K` for hover, `grn` for rename, `grr`
for references, and `gra` for code actions. Use `<C-x><C-o>` in insert mode for
LSP completion and `[d`/`]d` to move between diagnostics.
