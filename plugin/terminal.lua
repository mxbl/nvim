local set = vim.opt_local

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", {}),
	callback = function()
		set.number = false
		set.relativenumber = false
		set.scrolloff = 0
		set.signcolumn = "no"
		vim.bo.filetype = "terminal"
	end,
})

vim.keymap.set("t", "<esc>", "<c-\\><c-n>")
vim.keymap.set("t", "<M-u>", "<c-\\><c-n>gT")
vim.keymap.set("t", "<M-i>", "<c-\\><c-n>gt")
vim.keymap.set("t", "<c-h>", "<c-\\><c-n><c-w>h")
vim.keymap.set("t", "<c-j>", "<c-\\><c-n><c-w>j")
vim.keymap.set("t", "<c-k>", "<c-\\><c-n><c-w>k")
vim.keymap.set("t", "<c-l>", "<c-\\><c-n><c-w>l")
vim.cmd([[
	autocmd TermOpen term://* startinsert
	autocmd BufWinEnter,WinEnter term://* startinsert
]])

-- vim.keymap.set("n", ",st", function()
-- 	vim.cmd.new()
-- 	vim.cmd.wincmd("J")
-- 	vim.api.nvim_win_set_height(0, 12)
-- 	vim.wo.winfixheight = true
-- 	vim.cmd.term()
-- end)

vim.keymap.set("n", ",tt", function()
	vim.cmd.tabnew()
	vim.cmd.term()
end)
