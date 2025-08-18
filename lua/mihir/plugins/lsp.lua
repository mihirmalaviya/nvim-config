return {
  {
    "neovim/nvim-lspconfig",
  },
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "basedpyright",
        "ruff",
        "html",
        "clangd",
        -- "prettierd",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    keys = {
      { "<leader>f", function() require("conform").format({ bufnr = 0 }) end },
    },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "ruff_format" },
          cpp = { "clang-format" },
          html = { "prettierd" },
          css = { "prettierd" },
          javascript = { "prettierd" },
        },
      })
    end,
  },
}
