return {
  "catgoose/nvim-colorizer.lua",
  lazy = false,

  config = function()
    require("colorizer").setup({
      user_default_options = { names = false },
      "*",
      css = { names = true, css_fn = true },
    })
  end,
}
