-- highlight text on copy
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight yank',
  group = vim.api.nvim_create_augroup('hightlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 100 })
  end,
})
