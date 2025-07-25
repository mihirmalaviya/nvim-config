return {
	"stevearc/conform.nvim",
	-- lazy = false,
	opts = {},
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
