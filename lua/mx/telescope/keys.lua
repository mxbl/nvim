local mx_tele = require 'mx.telescope'
local builtin = require 'telescope.builtin'

vim.keymap.set('n', '<leader>dd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>pf', mx_tele.find_files, {})
vim.keymap.set('n', '<leader>pc', mx_tele.edit_neovim, {})
vim.keymap.set('n', '<leader>pe', mx_tele.file_browser, {})
vim.keymap.set('n', ',h', builtin.help_tags, {})
-- vim.keymap.set('n', '<leader>ps', function()
-- 	builtin.grep_string { search = vim.fn.input('Grep ❯ ') }
-- end)
vim.keymap.set('n', '<leader>ps', function()
    mx_tele.live_grep()
end)
vim.keymap.set('n', '<leader>pw', function()
	builtin.grep_string { search = vim.fn.expand('<cword>') }
end)
