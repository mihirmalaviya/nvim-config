local header_art = {

  "",
  "",
  "",
  "",
  "",
  "",
  "",

  -- [[                                          ,,                    ]],
  -- [[`7MN.   `7MF'                             db                    ]],
  -- [[  MMN.    M                                                     ]],
  -- [[  M YMb   M  .gP"Ya   ,pW"Wq.`7M'   `MF'`7MM  `7MMpMMMb.pMMMb.  ]],
  -- [[  M  `MN. M ,M'   Yb 6W'   `Wb VA   ,V    MM    MM    MM    MM  ]],
  -- [[  M   `MM.M 8M"""""" 8M     M8  VA ,V     MM    MM    MM    MM  ]],
  -- [[  M     YMM YM.    , YA.   ,A9   VVV      MM    MM    MM    MM  ]],
  -- [[.JML.    YM  `Mbmmd'  `Ybmd9'     W     .JMML..JMML  JMML  JMML.]],

  [[ ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓]],
  [[ ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒]],
  [[▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░]],
  [[▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ]],
  [[▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒]],
  [[░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░]],
  [[░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░]],
  [[   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ]],
  [[         ░    ░  ░    ░ ░        ░   ░         ░   ]],
  [[                                ░                  ]],

  --
}

local binds = {
  { "e", ":ene<CR>" },
  -- { "r", ":Telescope oldfiles<CR>" },
  -- { "s", ":e ~/.config/nvim<CR>" },
  -- { "q", ":q<CR>" },
}

return {
  -- { "rubiin/fortune.nvim", config = { content_type = "tips" } },
  {
    "goolord/alpha-nvim",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
      local alpha = require("alpha")
      -- local fortune = require("fortune").get_fortune()
      local quotes = require("mihir.custom.quotes")

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

      -- dashboard.section.header.val = header_art

      -- dashboard.section.footer.val = "An idiot admires complexity, a genius admires simplicity. -- Terry A. Davis"
      -- gives fortune without the author
      -- dashboard.section.footer.val = {
      --   unpack(fortune, 1, #fortune - 1),
      -- }
      dashboard.section.footer.val = quotes.random_quote()

      -- dashboard.opts.opts.noautocmd = true
      alpha.setup(dashboard.opts)
    end,
  },
}
