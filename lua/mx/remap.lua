vim.g.mapleader = " "

local set = vim.keymap.set
local k = vim.keycode

set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("n", "<c-n>", "<cmd>cnext<cr>zz")
set("n", "<c-p>", "<cmd>cprev<cr>zz")

set("n", "<c-j>", function()
	require("mx.tmux").navigate("j")
end)
set("n", "<c-k>", function()
	require("mx.tmux").navigate("k")
end)
set("n", "<c-l>", function()
	require("mx.tmux").navigate("l")
end)
set("n", "<c-h>", function()
	require("mx.tmux").navigate("h")
end)

set("n", "<cr>", function()
	if vim.v.hlsearch == 1 then
		vim.cmd.nohl()
		return ""
	else
		return k("<cr>")
	end
end, { expr = true })

set("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting register" })

-- NOTE: Requires those kitty mappings to work:
-- map ctrl+enter send_text all \x1b[13;5u
-- map shift+enter send_text all \x1b[13;2u
set("i", "<C-CR>", "<C-o>o")
set("i", "<S-CR>", "<C-o>O")
set("i", "<C-f>", "<Right>")
set("i", "<C-b>", "<Left>")

-- set("n", "<leader><leader>x", "<cmd>w<cr><cmd>source %<cr>", { desc = "Execute the current file" })

-- navigating tabs
-- TODO: make er to ui after removing those bindings from awesome
set("n", "<leader>tn", "<cmd>tabnew<cr>")
set("n", "<left>", "gT")
set("n", "<right>", "gt")

set("n", "<leader><leader>", function()
	vim.cmd("so")
end, { desc = "Execute the current file" })
set("n", ",cd", "<cmd>cd %:h<cr>", { desc = "Change current directory to file path of current buffer" })

-- Swith between horizontal and vertical split
set("n", ",h", function()
	vim.cmd.wincmd("K")
end)
set("n", ",v", function()
	vim.cmd.wincmd("H")
end)

vim.keymap.set("n", "<leader>db", "<cmd>DBUI<cr>", { desc = "Open dadbod ui" })

local mx_group = vim.api.nvim_create_augroup("mx", {})

vim.api.nvim_create_autocmd("LspAttach", {
	group = mx_group,
	callback = function(e)
		local builtin = require("telescope.builtin")
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "<leader>ps", builtin.lsp_document_symbols, opts)
		vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
		-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "do", vim.diagnostic.open_float, opts)
	end,
})
