vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = bufnr, silent = true }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

    -- diagnostics
    vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>ep", function() vim.diagnostic.jump({count = -1}) end, opts)
    vim.keymap.set("n", "<leader>en", function() vim.diagnostic.jump({count = 1}) end, opts)
  end
})
