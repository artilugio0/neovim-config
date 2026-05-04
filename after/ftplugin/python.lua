vim.opt_local.expandtab = true
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

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

local group = vim.api.nvim_create_augroup("custom_group_python", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  pattern = "*.py",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.lsp.enable('pyright')
vim.lsp.enable('ruff')
