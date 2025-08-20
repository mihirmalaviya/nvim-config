vim.g.mapleader = " "

local map = vim.keymap.set

map({ "n", "v" }, "<Up>", "<Nop>")
map({ "n", "v" }, "<Down>", "<Nop>")
map({ "n", "v" }, "<Left>", "<Nop>")
map({ "n", "v" }, "<Right>", "<Nop>")

-- leader keys
map("n", "<leader>o", ":update<CR> :source<CR>")
map("n", "<leader>w", ":write<CR>")
map("n", "<leader>q", ":quit<CR>")
map({ "n", "v", "x" }, "<leader>s", ":e #<CR>")
map({ "n", "v", "x" }, "<leader>S", ":sf #<CR>")
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>d", '"+d')
map("v", "<leader>x", ":lua<CR>")
map("x", "<leader>p", [["_dP]])

-- center screen for some cursor stuff
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- moving text
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

map("v", "P", [["ay:!play_songs.sh "a"<CR>]])
map("n", "<leader>ms", ":split songs<CR>ggdG:r !read_songs.sh<CR>ggdd")
map("n", "<leader>mv", ":vertical split songs<CR>ggdG:r !read_songs.sh<CR>ggdd")
map("n", "<leader>mn", "$F/v0*GNjzz", { remap = true })
map("n", "<leader>mN", "$F/v0*ggnk$F/v0*ggnzz", { remap = true })
