return {
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          "gruvbox",
          "gruvbox-material",
          "gruvbox-material-dark-v1",
          "kanagawa-wave",
          "kanagawa-dragon",
          "zenbones",
          "rose-pine",
          "ayu",
        },
      })

      vim.keymap.set("n", "<leader>t", ":Themery<CR>")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    -- lazy = false,
    config = function()
      require("gruvbox").setup({
        underline = false,
        italic = {
          strings = false,
          emphasis = false,
          comments = false,
          operators = false,
          folds = false,
        },
        invert_selection = true,
        invert_intend_guides = false,
        contrast = "hard",
      })
      -- vim.cmd("colorscheme gruvbox")

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
  },
  { "sainnhe/gruvbox-material" },
  { "rebelot/kanagawa.nvim" },
  { "zenbones-theme/zenbones.nvim", dependencies = "rktjmp/lush.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "ayu-theme/ayu-vim" },
}
