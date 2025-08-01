-- TODO rewrite it better
local binds = {
  { "e", ":ene<CR>" },
}

return {
  -- { "rubiin/fortune.nvim", config = { content_type = "tips" } },
  {
    "goolord/alpha-nvim",
    lazy = false,
    dependencies = { "echasnovski/mini.icons" },
    config = function()
      local alpha = require("alpha")
      -- local fortune = require("fortune").get_fortune()
      local quotes = require("mihir.quotes")

      local dashboard = require("alpha.themes.dashboard")

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "alpha",
        callback = function()
          local opts = { buffer = true, noremap = true, silent = true }
          for _, map in ipairs(binds) do
            vim.keymap.set("n", map[1], map[2], opts)
          end
        end,
      })

      dashboard.section.header.val = {}
      dashboard.section.buttons.val = {}

      -- dashboard.section.footer.val = "An idiot admires complexity, a genius admires simplicity. -- Terry A. Davis"

      -- -- gives fortune without the author
      -- dashboard.section.footer.val = {
      --   unpack(fortune, 1, #fortune - 1),
      -- }
      dashboard.section.footer.val = quotes.random_quote()

      vim.api.nvim_set_hl(0, "AlphaQuote", { italic = true, fg = "NONE" })
      dashboard.section.footer.opts.hl = "AlphaQuote"

      dashboard.opts.opts.noautocmd = true
      alpha.setup(dashboard.opts)
    end,
  },
}
