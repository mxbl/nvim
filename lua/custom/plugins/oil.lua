return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			CustomOilBar = function()
				local path = vim.fn.expand("%")
				path = path:gsub("oil://", "")
				return " " .. vim.fn.fnamemodify(path, ":.")
			end
			require("oil").setup({
				columns = { "icon" },
				keymaps = {
					["<c-h>"] = false,
					["<c-l>"] = false,
					["<cr>"] = "actions.select",
					["-"] = { "actions.parent", mode = "n" },
					["q"] = "actions.close",
					["@"] = "actions.cd",
				},
				-- win_options = {
				-- 	winbar = "%{v:lua.CustomOilBar()}",
				-- },
				view_options = {
					show_hidden = true,
				},
				use_default_keymaps = false,
				skip_confirm_for_simple_edits = true,
			})
			vim.keymap.set("n", "<leader>pv", "<cmd>Oil<cr>", { desc = "Open parent directory" })
			-- vim.keymap.set("n", "<leader>pv", require("oil").toggle_float)
		end,
	},
}
