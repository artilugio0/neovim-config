vim.lsp.config('pyright', {
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = 'strict',
        autoSearchPaths = true,
      },
    },
  },
})
vim.lsp.enable('pyright')

vim.lsp.enable('ruff')
