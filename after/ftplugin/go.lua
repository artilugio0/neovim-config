local libfmt = require('lib.fmt')

vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

if not pcall(libfmt.set_format_program, 'go', 'goimports') then
  pcall(libfmt.set_format_program, 'go', 'gofmt')
end
