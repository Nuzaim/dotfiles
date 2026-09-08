return {
  "numToStr/Comment.nvim",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      opts = {
        enable_autocmd = false,
      },
    },
  },
  keys = {
    {
      "<leader>/",
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      mode = "n",
      desc = "Toggle comment",
    },
    {
      "<leader>/",
      function()
        require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())
      end,
      mode = "x",
      desc = "Toggle comment",
    },
  },
  opts = {},
  config = function(_, opts)
    local context_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
    opts.pre_hook = function(ctx)
      local ok, commentstring = pcall(context_hook, ctx)
      return ok and commentstring or vim.bo.commentstring
    end
    require("Comment").setup(opts)
  end,
}
