local file_marks = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

function clear_marks()
  for i = 1, #file_marks do
    local mark = file_marks:sub(i, i)
    vim.api.nvim_del_mark(mark)
  end
end

-- update file marks to the current line when leaving a buffer
vim.api.nvim_create_autocmd('BufLeave', {
  group = vim.api.nvim_create_augroup('BufLeave-update-marks-line', {clear = true}),
  callback = function()
    for i = 1, #file_marks do
      local mark = file_marks:sub(i, i)
      local mark_line, mark_col, mark_buffer, mark_file =
        unpack(vim.api.nvim_get_mark(mark, {}))
      local current_buffer = vim.api.nvim_get_current_buf()

      if mark_buffer == current_buffer then
        local current_row, current_col = unpack(vim.api.nvim_win_get_cursor(0))
        vim.api.nvim_buf_set_mark(current_buffer, mark, current_row, current_row, {})
      end
    end
  end,
})
