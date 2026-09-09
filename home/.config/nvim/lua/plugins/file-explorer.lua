return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  event = "VimEnter",
  cmd = "Neotree",
  keys = {
    {
      "<leader>e",
      "<cmd>Neotree toggle left<CR>",
      desc = "Toggle file explorer",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
    },
    window = {
      position = "left",
      width = 30,
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)

    local startup_path = vim.fn.argv(0)
    if startup_path ~= "" and vim.fn.isdirectory(startup_path) == 1 then
      vim.schedule(function()
        require("neo-tree.command").execute({
          action = "focus",
          source = "filesystem",
          position = "current",
          dir = vim.fn.fnamemodify(startup_path, ":p"),
        })
      end)
    end
  end,
}
