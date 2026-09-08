return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "]b",
      "<cmd>BufferLineCycleNext<CR>",
      desc = "Next buffer",
    },
    {
      "[b",
      "<cmd>BufferLineCyclePrev<CR>",
      desc = "Previous buffer",
    },
    {
      ">b",
      "<cmd>BufferLineMoveNext<CR>",
      desc = "Move buffer right",
    },
    {
      "<b",
      "<cmd>BufferLineMovePrev<CR>",
      desc = "Move buffer left",
    },
    {
      "<leader>bb",
      "<cmd>BufferLinePick<CR>",
      desc = "Navigate to buffer",
    },
    {
      "<leader>bc",
      "<cmd>BufferLineCloseOthers<CR>",
      desc = "Close other buffers",
    },
    {
      "<leader>bC",
      "<cmd>BufferLineCloseAll<CR>",
      desc = "Close all buffers",
    },
    {
      "<leader>bd",
      "<cmd>BufferLinePickClose<CR>",
      desc = "Delete buffer",
    },
    {
      "<leader>bl",
      "<cmd>BufferLineCloseLeft<CR>",
      desc = "Close buffers to the left",
    },
    {
      "<leader>bp",
      "<cmd>BufferLineCyclePrev<CR>",
      desc = "Go to previous buffer",
    },
    {
      "<leader>br",
      "<cmd>BufferLineCloseRight<CR>",
      desc = "Close buffers to the right",
    },
  },
  opts = {},
}
