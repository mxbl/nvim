return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"lua",
					"json",
					"vim",
					"vimdoc",
					"go",
					"yaml",
					"bash",
					"terraform",
					"python",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})

			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			-- NOTE: run `TSInstall mojo`
			-- NOTE: the scm files need to be coppied by hand from this repo to this
			--   configs queries path, indents.scm needed an change to work (inherit python)
			parser_config.mojo = {
				install_info = {
					url = "https://github.com/lsh/tree-sitter-mojo",
					files = { "src/parser.c", "src/scanner.c" },
					branch = "main",
				},
				filetype = "mojo",
			}
		end,
	},
}
