return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,

  event = {
    "BufReadPre /home/mihir/vaults/vault/*.md",
    "BufNewFile /home/mihir/vaults/vault/*.md",
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  opts = {
    workspaces = {
      {
        name = "vault",
        path = "~/vaults/vault",
      },
    },

    completion = {
      blink = true,
    },

    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
      name = "telescope.nvim",
    },
  },
}
