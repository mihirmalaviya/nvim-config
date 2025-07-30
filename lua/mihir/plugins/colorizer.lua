return {
  "catgoose/nvim-colorizer.lua",
  lazy = "VeryLazy",

  config = function()
    require("colorizer").setup({
      user_default_options = { names = false },
      "*",
      css = { names = true, css_fn = true },
    })
  end,
}
