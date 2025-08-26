-- local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- local mihir_group = augroup("Mihir", {})
-- local yank_group = augroup("Yank", {})

-- autocmd({ "BufWritePre" }, {
--   group = mihir_group,
--   pattern = "*",
--   command = [[%s/\s\+$//e]],
-- })

autocmd("LspAttach", {
  -- group = mihir_group,
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  end,
})

autocmd("TextYankPost", {
  -- group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 50,
    })
  end,
})

autocmd("VimResized", {
  pattern = "*",
  command = "wincmd =",
})

-- autocmd("VimResized", {
--   pattern = "*",
--   callback = function()
--     local bnr = vim.fn.bufnr("%")
--     local ns_id = vim.api.nvim_create_namespace("quote")
--     local line_num = 0
--     local col_num = 0
--     local opts = {
--       id = 1,
--       virt_text = { { "12345678901234567890123456789012345678901234567890123456789012345678901234567890", "Comment" } },
--       virt_text_pos = "overlay",
--       virt_text_win_col = math.floor(vim.api.nvim_win_get_width(0) / 2) - 40,
--     }
--     vim.api.nvim_buf_set_extmark(bnr, ns_id, line_num, col_num, opts)
--   end,
-- })
