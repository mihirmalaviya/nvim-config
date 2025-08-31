-- TODO make my own version
return {
  "nguyenvukhang/nvim-toggler",
  keys = { "<leader>i" },
  config = function()
    require("nvim-toggler").setup({
      inverses = {
        ["dark"] = "light",
      },
    })
  end,
}
