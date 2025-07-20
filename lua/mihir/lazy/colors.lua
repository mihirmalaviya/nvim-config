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
          "lackluster",
          "lackluster-dark",
          "lackluster-night",
          "lackluster-mint",
          "carbonfox",
          "rose-pine",
          "ayu",
        },
      })

      vim.keymap.set("n", "<leader>t", ":Themery<CR>")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
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
    end,
  },
  "sainnhe/gruvbox-material",
  "rebelot/kanagawa.nvim",
  "slugbyte/lackluster.nvim",
  "EdenEast/nightfox.nvim",
  "ayu-theme/ayu-vim",
  { "zenbones-theme/zenbones.nvim", dependencies = "rktjmp/lush.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
}
