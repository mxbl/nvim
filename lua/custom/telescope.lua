local set = vim.keymap.set
local data = assert(vim.fn.stdpath("data")) --[[@as string]]

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<c-s>"] = require("telescope.actions").select_vertical,
			},
		},
	},
	extensions = {
		wrap_results = true,
		fzf = {},
		history = {
			path = vim.fs.joinpath(data, "telescope_history"),
			limit = 100,
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "smart_history")
pcall(require("telescope").load_extension, "ui-select")

local builtin = require("telescope.builtin")

set("n", "<leader>pf", builtin.find_files)
set("n", "<leader>gf", builtin.git_files)
set("n", "<leader>gs", builtin.live_grep)
set("n", "<leader>gw", builtin.grep_string)
set("n", "<leader>ff", builtin.current_buffer_fuzzy_find)
set("n", "<leader>fh", builtin.help_tags)
set("n", "<leader>pb", builtin.buffers)

set("n", "<leader>la", function()
	---@diagnostic disable-next-line: param-type-mismatch
	builtin.find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") })
end)

set("n", "<leader>nv", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end)
set("n", "<leader>fi", function()
	builtin.find_files({ cwd = "~/.config/fish" })
end)
set("n", "<leader>aw", function()
	builtin.find_files({ cwd = "~/.config/awesome" })
end)
set("n", "<leader>do", function()
	builtin.find_files({ cwd = "~/.dotfiles/", hidden = true })
end)
set("n", "<leader>gi", function()
	builtin.find_files({ cwd = "~/git/" })
end)
set("n", "<leader>md", function()
	builtin.find_files({ cwd = "~/md/" })
end)
