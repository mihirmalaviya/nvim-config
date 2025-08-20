return {
  "nguyenvukhang/nvim-toggler",
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
