return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofmt" },
        python = { "ruff_format" },
        html = { "prettierd" },
        javascript = { "prettierd" },
        css = { "prettierd" },
      },
    })
  end,
}
