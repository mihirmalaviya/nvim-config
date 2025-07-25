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
				ensure_installed = { "lua_ls", "pyright", "html", "ts_ls", "clangd" },
			})

			require("mason-conform").setup({
				ensure_installed = { "stylua", "gofmt", "ruff_format", "prettierd", "clang-format" },
			})

			for server, config in pairs(opts.servers) do
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
		end,
	},
}

-- return {
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       {
--         "folke/lazydev.nvim",
--         ft = "lua", -- only load on lua files
--         opts = {
--           library = {
--             -- See the configuration section for more details
--             -- Load luvit types when the `vim.uv` word is found
--             { path = "${3rd}/luv/library", words = { "vim%.uv" } },
--           },
--         },
--       },
--     },
--     opts = {
--       servers = {
--         lua_ls = {},
--         pyright = {},
--         html = {},
--         ts_ls = {},
--         clangd = {},
--       },
--     },
--     config = function(_, opts)
--       local lspconfig = require("lspconfig")
--       for server, config in pairs(opts.servers) do
--         -- passing config.capabilities to blink.cmp merges with the capabilities in your
--         -- `opts[server].capabilities, if you've defined it
--         config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
--         lspconfig[server].setup(config)
--       end
--
--       vim.diagnostic.config({
--         -- update_in_insert = true,
--         float = {
--           focusable = false,
--           style = "minimal",
--           border = "rounded",
--           -- source = "always",
--           header = "",
--           prefix = "",
--         },
--       })
--     end,
--   },
-- }
