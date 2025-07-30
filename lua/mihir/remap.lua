vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "v" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "v" }, "<Right>", "<Nop>")

vim.keymap.set({ "n", "v" }, ";", ":", { noremap = true })

vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")

vim.keymap.set("v", "<leader>x", ":lua<CR>")

-- center screen for some cursor stuff
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- moving text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set(
  "n",
  "<leader>T",
  function() vim.o.background = (vim.o.background == "dark") and "light" or "dark" end,
  { desc = "Toggle dark/light mode" }
)

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace all instances of word" }
)
vim.keymap.set(
  "v",
  "<leader>s",
  [["hy:%s/\V<C-r>h/<C-r>h/gI<Left><Left><Left>]],
  { desc = "Replace all instances of selection" }
)
