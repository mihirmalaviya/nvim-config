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
          "gruvbox-material-dark-v2",
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
  {
    "sainnhe/gruvbox-material",
    init = function()
      vim.g.gruvbox_material_colors_override = {
        red = { "#ea6962", "167" },
        orange = { "#e78a4e", "208" },
        yellow = { "#d8a657", "214" },
        green = { "#a9b665", "142" },
        aqua = { "#89b482", "108" },
        blue = { "#7daea3", "109" },
        purple = { "#d3869b", "175" },

        bg_red = { "#ea6962", "167" },
        bg_yellow = { "#d8a657", "214" },
        bg_green = { "#a9b665", "142" },

        bg_visual_red = { "#4c3432", "52" },
        bg_visual_yellow = { "#4f422e", "94" },
        bg_visual_green = { "#3b4439", "22" },
        bg_visual_blue = { "#374141", "17" },
        bg_diff_red = { "#402120", "52" },
        bg_diff_green = { "#34381b", "22" },
        bg_diff_blue = { "#0e363e", "17" },

        fg0 = { "#d4be98", "223" },
        fg1 = { "#ddc7a1", "223" },
        bg0 = { "#282828", "235" },
        bg1 = { "#32302f", "236" },
        bg2 = { "#32302f", "236" },
        bg3 = { "#45403d", "237" },
        bg4 = { "#45403d", "237" },
        bg5 = { "#5a524c", "239" },
        grey0 = { "#7c6f64", "243" },
        grey1 = { "#928374", "245" },
        grey2 = { "#a89984", "246" },
        bg_statusline1 = { "#32302f", "236" },
        bg_statusline2 = { "#3a3735", "236" },
        bg_statusline3 = { "#504945", "240" },
        bg_current_word = { "#3c3836", "237" },
        bg_dim = { "#1b1b1b", "233" },
        none = { "NONE", "NONE" },
      }
    end,
  },
  "rebelot/kanagawa.nvim",
  "slugbyte/lackluster.nvim",
  "EdenEast/nightfox.nvim",
  "ayu-theme/ayu-vim",
  "folke/tokyonight.nvim",
  { "zenbones-theme/zenbones.nvim", dependencies = "rktjmp/lush.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
}
