function ColorMyPencils(color)
  color = color or vim.g.colors_name
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

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
          "tokyonight-night",
          "tokyonight-storm",
          "tokyonight-moon",
          "zenbones",
          "lackluster",
          "lackluster-dark",
          "lackluster-night",
          "lackluster-mint",
          "carbonfox",
          "rose-pine",
          "ayu",
        },
        globalAfter = [[ColorMyPencils()]],
      })

      vim.keymap.set("n", "<leader>t", ":Themery<CR>")
    end,
  },
  -- "RRethy/base16-nvim",
  "ellisonleao/gruvbox.nvim",
  "sainnhe/gruvbox-material",
  "rebelot/kanagawa.nvim",
  "slugbyte/lackluster.nvim",
  "EdenEast/nightfox.nvim",
  "ayu-theme/ayu-vim",
  "folke/tokyonight.nvim",
  { "zenbones-theme/zenbones.nvim", dependencies = "rktjmp/lush.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
}
