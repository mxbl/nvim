local set = vim.keymap.set
local k = vim.keycode

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")
set("n", "<c-n>", "<cmd>cnext<cr>zz")
set("n", "<c-p>", "<cmd>cprev<cr>zz")

set("n", "<c-j>", function()
	require("custom.tmux").navigate("j")
end)
set("n", "<c-k>", function()
	require("custom.tmux").navigate("k")
end)
set("n", "<c-l>", function()
	require("custom.tmux").navigate("l")
end)
set("n", "<c-h>", function()
	require("custom.tmux").navigate("h")
end)

set("n", "<cr>", function()
	if vim.v.hlsearch == 1 then
		vim.cmd.nohl()
		return ""
	else
		return k("<cr>")
	end
end, { expr = true })

-- set("n", "<leader><leader>x", "<cmd>source %<cr>", { desc = "Execute the current file" })

-- navigating tabs
-- TODO: make er to ui after removing those bindings from awesome
set("n", "<M-n>", "<cmd>tabnew<cr>")
set("n", "<M-u>", "gT")
set("n", "<M-i>", "gt")

set("n", ",x", "<cmd>so %<cr>", { desc = "Execute the current file" })
set("n", ",cd", "<cmd>cd %:h<cr>", { desc = "Change current directory to file path of current buffer" })

-- Swith between horizontal and vertical split
set("n", ",h", function()
	vim.cmd.wincmd("K")
end)
set("n", ",v", function()
	vim.cmd.wincmd("H")
end)
