-- TODO simplify this to just be mason and lspconfig

return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "zapling/mason-conform.nvim",
    },
    lazy = false,
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        ts_ls = {},
        eslint = {},
        tailwindcss = {},
      },
    },
    config = function(_, opts)
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "html",
          "ts_ls",
          "clangd",
        },
      })

      require("mason-conform").setup({
        ensure_installed = {
          "stylua",
          "gofmt",
          "ruff_format",
          "prettierd",
          "clang-format",
        },
      })

      for server, config in pairs(opts.servers) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end,
  },
}
