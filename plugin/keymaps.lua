--vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Tmux aware window switching
vim.keymap.set('n', '<C-l>', function() require'mx.tmux'.navigate("l") end)
vim.keymap.set('n', '<C-h>', function() require'mx.tmux'.navigate("h") end)
vim.keymap.set('n', '<C-j>', function() require'mx.tmux'.navigate("j") end)
vim.keymap.set('n', '<C-k>', function() require'mx.tmux'.navigate("k") end)

-- Switch between tabs
vim.keymap.set("n", "<Right>", function() vim.api.nvim_feedkeys("gt", "n", true) end)
vim.keymap.set("n", "<Left>", function() vim.api.nvim_feedkeys("gT", "n", true) end)
