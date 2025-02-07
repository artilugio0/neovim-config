-- do not autocomment next line for all file types
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('all-no-autocomment', { clear = true }),
  callback = function()
    vim.opt_local.formatoptions:remove({ 'o', 'r' })
  end,
})
