return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	config = function()
		require("gruvbox").setup({
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = false,
			bold = true,
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = false,
			},
			strikethrough = true,
			invert_selection = true,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "hard", -- can be "hard", "soft" or empty string
			-- palette_overrides = {
			-- 	dark0_hard = "#0c0d0e",
			-- },
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		})
		vim.cmd("colorscheme gruvbox")

		-- local colors = require("gruvbox").palette
		--
		-- vim.o.termguicolors = true
		--
		-- -- vim.api.nvim_set_hl(0, "CursorNormal", { fg = normal.bg, bg = normal.fg })
		-- vim.api.nvim_set_hl(0, "CursorInsert", { fg = colors.dark0_hard, bg = colors.bright_blue })
		-- vim.api.nvim_set_hl(0, "CursorVisual", { fg = "#ffffff", bg = "#000000" })
		-- -- vim.api.nvim_set_hl(0, "CursorReplace", { fg = normal.bg, bg = yellow.fg })
		--
		-- vim.o.guicursor = table.concat({
		-- 	-- "n:block-CursorNormal",
		-- 	"i-ci:block-CursorInsert",
		-- 	"v:block-CursorVisual",
		-- 	-- "r-cr:block-CursorReplace",
		-- }, ",")
	end,
}
