vim.opt_local.expandtab = true
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2

vim.lsp.config('ts_ls', {
  cmd = {'typescript-language-server', '--stdio'},
  filetypes = {'typescript', 'typescriptreact'},
  root_dir = vim.fs.root(0, { 'package.json', 'tsconfig.json', '.git' }),
  settings = {},
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.ts",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.lsp.enable('ts_ls')
