return {
  "nguyenvukhang/nvim-toggler",
  lazy = true,
  keys = { "<leader>i" },
  config = function()
    require("nvim-toggler").setup({
      inverses = {
        ["vim"] = "emacs",
        ["dark"] = "light",
      },
    })
  end,
}
