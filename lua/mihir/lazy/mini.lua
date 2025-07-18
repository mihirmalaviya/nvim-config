return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    -- local statusline = require 'mini.statusline'
    -- statusline.setup {
    --     -- use_icons = false,
    -- }
    -- local starter = require 'mini.starter'
    -- starter.setup {}
    local colors = require("mini.colors")
    colors.setup({})
  end,
}
