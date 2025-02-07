local M = {}

M.set_format_program = function(ext, program, args)
  local which_result = vim.system({ 'which', program }, { text = true }):wait()
  if which_result.code ~= 0 then
    error('program "' .. program .. '" not in PATH')
  end

  if args == nil then
    args = {}
  end
  local program_args = { program, unpack(args) }

  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*.' .. ext,
    group = vim.api.nvim_create_augroup(ext .. '-fortam-on-write', { clear = true }),
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      local result = vim.system(program_args, {
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
              .. '" with ' .. program .. ': ' .. string.sub(result.stderr, 1, 50))
      end
    end,
  })
end

return M
