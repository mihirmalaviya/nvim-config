return {
  {
    "kawre/leetcode.nvim",
    cmd = { "Leet" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      lang = "python",
      picker = { provider = "telescope" },
    },
  },
}
