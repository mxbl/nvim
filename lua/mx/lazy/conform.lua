return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "gofumpt", "golines" },
				-- nix = { "nixpkgs_fmt" },
				-- terraform = { "terraform_fmt" },
				--ruby = { "rubocop" },
			},
		})
		conform.formatters.injected = {
			options = {
				ignore_errors = false,
				lang_to_formatters = {
					sql = { "sleek" },
				},
			},
		}
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function(args)
				local extension = vim.fn.expand("%:e")
				if extension == "mlx" then
					return
				end
				require("conform").format({
					bufnr = args.buf,
					lsp_fallback = true,
					quiet = true,
				})
			end,
		})
	end
}
