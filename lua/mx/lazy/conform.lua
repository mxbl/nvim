return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "gofumpt", "golines" },
				nim = { "nph" },
				-- nix = { "nixpkgs_fmt" },
				-- terraform = { "terraform_fmt" },
				--ruby = { "rubocop" },
			},
		})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({
					bufnr = args.buf,
					lsp_fallback = true,
					quiet = true,
				})
			end,
		})
		-- conform.formatters.injected = {
		-- 	options = {
		-- 		ignore_errors = false,
		-- 		lang_to_formatters = {
		-- 			sql = { "sleek" },
		-- 		},
		-- 	},
		-- }
	end,
}
