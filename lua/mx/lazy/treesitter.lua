return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "go", "yaml", "bash", "terraform", "python" },
				callback = function()
					vim.treesitter.start()
				end,
			})
			-- local configs = require("nvim-treesitter.configs")
			-- configs.setup({
			-- 	ensure_installed = {
			-- 		"lua",
			-- 		"json",
			-- 		"vim",
			-- 		"vimdoc",
			-- 		"go",
			-- 		"yaml",
			-- 		"bash",
			-- 		"terraform",
			-- 		"python",
			-- 	},
			-- 	sync_install = false,
			-- 	highlight = { enable = true },
			-- 	indent = { enable = true },
			-- })
		end,
	},
}
