-- INIT.LUA

-- Set up lazy
require("custom.lazy")

-- Commands for resourcing and testing config
vim.keymap.set("n","<space><space>x","<cmd>source %<CR>")
vim.keymap.set("n","<space>x",":.lua<CR>")
vim.keymap.set("v","<space>x",":lua<CR>")

-- Setting up per-language config done in after/ftplugin
vim.opt.shiftwidth=4
vim.opt.number=true
vim.opt.relativenumber=true
-- for p grabbing from system clipboard
vim.opt.clipboard="unnamedplus"

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
