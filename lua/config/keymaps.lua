local config_vars = require('config.vars')

-- remove highlight
vim.keymap.set('n', '<ESC><ESC>', '<CMD>noh<CR>')

-- open scratch file
vim.keymap.set('n', '<SPACE><TAB>', '<CMD>edit ' .. config_vars.scratch_file .. '<CR>')
