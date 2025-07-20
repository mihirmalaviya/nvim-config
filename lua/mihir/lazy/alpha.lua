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

-- local if_nil = vim.F.if_nil
-- local leader = "SPC"
--
-- --- @param sc string
-- --- @param txt string
-- --- @param keybind string? optional
-- --- @param keybind_opts table? optional
-- local function button(sc, txt, keybind, keybind_opts)
--   local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")
--
--   local opts = {
--     position = "center",
--     shortcut = "[" .. sc .. "]",
--     cursor = 0,
--     width = 50,
--     align_shortcut = "right",
--     hl_shortcut = "Keyword",
--   }
--   if keybind then
--     keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
--     opts.keymap = { "n", sc_, keybind, keybind_opts }
--   end
--
--   local function on_press()
--     local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
--     vim.api.nvim_feedkeys(key, "t", false)
--   end
--
--   return {
--     type = "button",
--     val = txt,
--     on_press = on_press,
--     opts = opts,
--   }
-- end

local binds = {
  { "e", ":ene<CR>" },
  -- { "r", ":Telescope oldfiles<CR>" },
  -- { "s", ":e ~/.config/nvim<CR>" },
  -- { "q", ":q<CR>" },
}

return {
  { "rubiin/fortune.nvim", config = { content_type = "tips" } },

  {
    "goolord/alpha-nvim",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
      local alpha = require("alpha")
      -- local fortune = require("fortune").get_fortune()

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
      -- dashboard.section.header.val = header_art

      dashboard.section.buttons.val = {}
      -- dashboard.section.buttons.val = {
      --   button("e", "New file", ":ene <BAR> startinsert <CR>"),
      --   button("r", "Recent", ":Telescope oldfiles<CR>"),
      --   button("s", "Settings", ":e ~/.config/nvim<CR>"),
      -- }

      dashboard.section.footer.val = "An idiot admires complexity, a genius admires simplicity. -- Terry A. Davis"
      -- dashboard.section.footer.val = fortune
      -- dashboard.section.footer.val = { unpack(fortune, 1, #fortune - 1) } -- gives fortune without the author

      -- dashboard.opts.opts.noautocmd = true
      alpha.setup(dashboard.opts)
    end,
  },
}
