local map = vim.keymap.set

vim.g.mapleader = " "
map("", "<space>", "<nop>", { desc = "space is only a leader key now" })

-- ergonomics
map({ "n", "v" }, "<Up>", "<Nop>")
map({ "n", "v" }, "<Down>", "<Nop>")
map({ "n", "v" }, "<Left>", "<Nop>")
map({ "n", "v" }, "<Right>", "<Nop>")

map("n", "dd", "<Nop>") -- use VD
map("n", "cc", "<Nop>") -- use VC
map("n", "gg", "<Nop>") -- use go
map("n", "go", "gg")

-- leader keys
map("n", "<leader>w", ":write<CR>")
map("n", "<leader>q", ":quit<CR>")
map("n", "<leader>o", ":update<CR>:source<CR>")
map({ "n", "v", "x" }, "<leader>s", ":e #<CR>")
map({ "n", "v", "x" }, "<leader>S", ":vertical sf #<CR>")
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>d", '"+d')
map("x", "<leader>p", [["_dP]])
map("n", "<leader>r", ":edit `=v:oldfiles[0]`<CR>")
map("n", "<leader>x", ":.lua<CR>")
map("v", "<leader>x", ":lua<CR>")

-- picker
map("n", "<leader>h", ":Pick help<CR>")
map("n", "<leader>pr", ":Pick oldfiles<CR>")
map("n", "<leader>pf", ":Pick files<CR>")
map("n", "<leader>pb", ":Pick buffers<CR>")
map("n", "<leader>pg", ":Pick grep_live<CR>")

-- moving text
map("v", "J", ":move '>+1<CR>gv=gv")
map("v", "K", ":move '<-2<CR>gv=gv")

-- moving cursor
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "*", "*zzzv")
map("n", "#", "#zzzv")

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

map("v", "P", [["ay:!play_songs.sh "a"<CR>]], { silent = true })
map("n", "<leader>mo", ":edit songs<CR>ggdG:r !read_songs.sh<CR>ggdd")
map("n", "<leader>mn", "$F/v0*GNjzz", { remap = true })
map("n", "<leader>mN", "$F/v0*ggnk$F/v0*ggnzz", { remap = true })

local toggle = true
map("n", "<leader>zc", function()
  toggle = not toggle
  vim.opt.laststatus = toggle and 2 or 0
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    vim.api.nvim_set_option_value("number", toggle, { win = win })
    vim.api.nvim_set_option_value("relativenumber", toggle, { win = win })
    vim.api.nvim_set_option_value("signcolumn", toggle and "yes" or "number", { win = win })
    vim.api.nvim_set_option_value("colorcolumn", toggle and "80" or "", { win = win })
  end
end, { noremap = true, silent = true })
