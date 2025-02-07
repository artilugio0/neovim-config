vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

local fmtprogram = 'goimports'
local which_result = vim.system({ 'which', fmtprogram }, { text = true }):wait()
if which_result.code ~= 0 then
  fmtprogram = 'gofmt'
  which_result = vim.system({ 'which', fmtprogram }, { text = true }):wait()
end

if which_result.code == 0 then
  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*.go',
    group = vim.api.nvim_create_augroup('go-formatting', { clear = true }),
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      local result = vim.system({ fmtprogram }, {
        text = true,
        stdin = vim.api.nvim_buf_get_lines(bufnr, 0, -1, true),
      }):wait()
      if result.code == 0 then
        local lines = {}
        for l in string.gmatch(result.stdout, '([^\n]*)\n') do
          table.insert(lines, l)
        end
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, lines)
      else
        print('Error: could not format file "' .. vim.api.nvim_buf_get_name(bufnr)
              .. '" with ' .. fmtprogram .. ': ' .. result.stderr)
      end
    end,
  })
end
