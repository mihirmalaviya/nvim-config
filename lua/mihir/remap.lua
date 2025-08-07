vim.g.mapleader = " "

local map = vim.keymap.set

map({ "n", "v" }, "<Up>", "<Nop>")
map({ "n", "v" }, "<Down>", "<Nop>")
map({ "n", "v" }, "<Left>", "<Nop>")
map({ "n", "v" }, "<Right>", "<Nop>")

map({ "n", "v" }, ";", ":", { noremap = true })

map("n", "<leader>o", ":update<CR> :source<CR>")
map("n", "<leader>w", ":write<CR>")
map("n", "<leader>q", ":quit<CR>")

map({ "n", "v", "x" }, "<leader>s", ":e #<CR>")
map({ "n", "v", "x" }, "<leader>S", ":sf #<CR>")

map("v", "<leader>x", ":lua<CR>")

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

map(
  "n",
  "<leader>T",
  function() vim.o.background = (vim.o.background == "dark") and "light" or "dark" end,
  { desc = "Toggle dark/light mode" }
)

map("x", "<leader>p", [["_dP]])

-- map(
--   "n",
--   "<leader>s",
--   [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
--   { desc = "Replace all instances of word" }
-- )
-- map("v", "<leader>s", [["hy:%s/\V<C-r>h/<C-r>h/gI<Left><Left><Left>]], { desc = "Replace all instances of selection" })
