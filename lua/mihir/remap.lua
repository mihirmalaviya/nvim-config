local map = vim.keymap.set

vim.g.mapleader = " "
map("", "<space>", "<nop>", { desc = "space is only a leader key now" })

-- unmap non ergonomic stuffs
map({ "n", "v" }, "<Up>", "<Nop>")
map({ "n", "v" }, "<Down>", "<Nop>")
map({ "n", "v" }, "<Left>", "<Nop>")
map({ "n", "v" }, "<Right>", "<Nop>")

map("n", "dd", "<Nop>")

-- leader keys
map("n", "<leader>o", ":update<CR>:source<CR>")
map("n", "<leader>w", ":write<CR>")
map("n", "<leader>q", ":quit<CR>")
map({ "n", "v", "x" }, "<leader>s", ":e #<CR>")
map({ "n", "v", "x" }, "<leader>S", ":sf #<CR>")
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>d", '"+d')
map("v", "<leader>x", ":lua<CR>")
map("x", "<leader>p", [["_dP]])
map("n", "<leader>r", ":edit `=v:oldfiles[0]`<CR>")

-- moving text
map("v", "J", ":move '>+1<CR>gv=gv")
map("v", "K", ":move '<-2<CR>gv=gv")

-- moving cursor
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

map("v", "P", [["ay:!play_songs.sh "a"<CR>]], { silent = true })
map("n", "<leader>mo", ":edit songs<CR>ggdG:r !read_songs.sh<CR>ggdd")
map("n", "<leader>mn", "$F/v0*GNjzz", { remap = true })
map("n", "<leader>mN", "$F/v0*ggnk$F/v0*ggnzz", { remap = true })

local toggle = false
map("n", "<leader>zc", function()
  toggle = not toggle
  vim.opt.number = toggle
  vim.opt.relativenumber = toggle
  vim.opt.signcolumn = toggle and "yes" or "number"
  vim.opt.laststatus = toggle and 2 or 0
  vim.opt.colorcolumn = toggle and "80" or "0"
end, { noremap = true, silent = true })
