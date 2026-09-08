-- Vanilla Neovim configuration. Space is the leader key.
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 4
vim.opt.wrap = false
vim.opt.fillchars:append({ eob = " " })
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"

local undodir = vim.fn.stdpath("state") .. "/undo"
vim.fn.mkdir(undodir, "p")
vim.opt.undodir = undodir

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent selected lines" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Dedent selected lines" })
vim.keymap.set("n", "<leader>uw", function()
  vim.opt.wrap = not vim.opt.wrap:get()
  vim.opt.linebreak = vim.opt.wrap:get()
end, { desc = "Toggle word wrap" })

local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, "lazy")
if not ok then
  error(("Unable to load lazy.nvim from %s"):format(lazypath))
end

lazy.setup({ { import = "plugins" } }, {
  install = { colorscheme = { "darkearth-nuzaim", "habamax" } },
  ui = { backdrop = 100 },
  performance = {
    rtp = {
      disabled_plugins = { "gzip", "netrwPlugin", "tarPlugin", "tohtml", "zipPlugin" },
    },
  },
})

vim.cmd.colorscheme "darkearth-nuzaim"
