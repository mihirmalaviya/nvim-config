return {
  "nguyenvukhang/nvim-toggler",
  -- lazy = false,
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
