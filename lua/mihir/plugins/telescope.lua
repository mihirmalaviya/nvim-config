-- TODO make some more sensible keybinds and integrate the lazy loading
return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.5",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    require("telescope").setup({
      -- defaults = require("telescope.themes").get_ivy(),
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
      },
    })

    local builtin = require("telescope.builtin")

    -- vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
    vim.keymap.set("n", "<leader>ve", function() builtin.find_files({ cwd = vim.fn.stdpath("config") }) end, {})
    -- vim.keymap.set("n", "<leader>wf", function() builtin.find_files({ cwd = "~/workspace/projects" }) end, {})
    -- vim.keymap.set("n", "<leader>wv", function() builtin.find_files({ cwd = "~/vaults/vault" }) end, {})
    vim.keymap.set("n", "<leader>pr", builtin.oldfiles, {})
    vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<C-p>", builtin.git_files, {})
    vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})

    -- vim.keymap.set("n", "<leader>ps", function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end)
    -- vim.keymap.set("n", "<leader>pws", function() builtin.grep_string({ search = vim.fn.expand("<cword>") }) end)
    -- vim.keymap.set("n", "<leader>pWs", function() builtin.grep_string({ search = vim.fn.expand("<cWORD>") }) end)
  end,
}
