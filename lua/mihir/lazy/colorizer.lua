return {
  "catgoose/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "*",
      css = { css_fn = true },
      lua = { names = false },
    })
  end,
}
