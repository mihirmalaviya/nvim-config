require("mihir.opts")
require("mihir.remap")
require("mihir.autocmds")
require("mihir.lazy")

vim.cmd("colorscheme habamax")

vim.cmd("hi statusline   guifg=white guibg=#222222")
vim.cmd("hi statuslinenc guifg=gray  guibg=NONE")

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

  "FloatBorder",
  "FloatTitle",
  "NormalFloat",
}

for _, n in pairs(names) do
  local gr = vim.api.nvim_get_hl(0, { name = n })
  gr.bg = nil
  gr.ctermbg = nil
  gr.blend = 0
  vim.api.nvim_set_hl(0, n, gr)
end
