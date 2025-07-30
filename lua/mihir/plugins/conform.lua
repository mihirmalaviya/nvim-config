return {
  "stevearc/conform.nvim",
  opts = {},
  keys = {
    { "<leader>f", function() require("conform").format({ bufnr = 0 }) end },
  },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format" },
        cpp = { "clang-format" },
        go = { "gofmt" },
        html = { "prettierd" },
        css = { "prettierd" },
        javascript = { "prettierd" },
      },
    })
  end,
}
