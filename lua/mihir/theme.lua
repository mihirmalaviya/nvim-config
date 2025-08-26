-- vim.cmd("colorscheme wildcharm")
-- vim.cmd("colorscheme habamax")
vim.cmd("colorscheme moonfly")
-- vim.cmd("colorscheme alabaster")
-- vim.cmd("colorscheme github_dark_high_contrast")

function HlPreferences()
  vim.cmd("hi StatusLine   guifg=white   guibg=#222222")
  vim.cmd("hi StatusLineNC guifg=gray    guibg=NONE")
  vim.cmd("hi ColorColumn  guibg=#171717")
  -- vim.cmd("hi Visual       cterm=reverse gui=reverse")
end

function TransparentBg()
  local names = {
    "Normal",
    "NormalNC",
    "EndOfBuffer",
    "MsgArea",
    "MsgSeparator",
    "VertSplit",
    "WinSeparator",

    -- "StatusLine",
    -- "StatusLineNC",
    -- "StatusLineTerm",
    -- "StatusLineTermNC",

    "FoldColumn",
    "LineNr",
    "LineNrAbove",
    "LineNrBelow",
    "SignColumn",

    -- "FloatBorder",
    -- "FloatTitle",
    -- "NormalFloat",
  }

  for _, n in ipairs(names) do
    local ok, gr = pcall(vim.api.nvim_get_hl, 0, { name = n })
    if ok and gr then
      gr.bg = nil
      gr.ctermbg = nil
      gr.blend = 0
      vim.api.nvim_set_hl(0, n, gr)
    end
  end
end

HlPreferences()
TransparentBg()
