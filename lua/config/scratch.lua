local config_vars = require('config.vars')

-- load scratch file on startup
pcall(vim.cmd, 'source ' .. config_vars.scratch_file)

-- reload scratch file on writes
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = config_vars.scratch_file,
  group = vim.api.nvim_create_augroup('reload-scratch-file', { clear = true }),
  callback = function()
    vim.cmd('source ' .. config_vars.scratch_file)
  end,
})
