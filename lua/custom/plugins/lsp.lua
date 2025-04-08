return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"folke/neodev.nvim",
		-- "williamboman/mason.nvim",
		-- "williamboman/mason-lspconfig.nvim",
		-- "WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
		"stevearc/conform.nvim",
		"b0o/SchemaStore.nvim",
	},
	config = function()
		if vim.g.obsidian then
			return
		end

		require("neodev").setup({})

		local capabilities = nil
		if pcall(require, "cmp_nvim_lsp") then
			capabilities = require("cmp_nvim_lsp").default_capabilities()
		end

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

		local lspconfig = require("lspconfig")

		local servers = {
			bashls = true,
			gopls = {
				settings = {
					gopls = {
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
					},
				},
				flags = {
					debounce_text_changes = 200,
				},
			},
			lua_ls = {
				server_capabilities = {
					semanticTokensProvider = vim.NIL,
				},
			},
			rust_analyzer = true,
			pyright = true,
			-- nil_ls = true,
			nixd = true,
			ansiblels = true,
			-- jsonls
			-- yamlls = true,
			zls = {
				settings = {
					zls = {
						enable_build_on_save = false,
					},
				},
			},
		}

		-- local servers_to_install = vim.tbl_filter(function(key)
		-- 	local t = servers[key]
		-- 	if type(t) == "table" then
		-- 		return not t.manual_install
		-- 	else
		-- 		return t
		-- 	end
		-- end, vim.tbl_keys(servers))

		-- require("mason").setup()
		-- local ensure_installed = {
		-- 	"stylua",
		-- 	"lua_ls",
		-- 	"ansiblels",
		-- 	-- Debugger for the go programming language
		-- 	-- "delve",
		-- }

		-- vim.list_extend(ensure_installed, servers_to_install)
		-- require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		for name, config in pairs(servers) do
			if config == true then
				config = {}
			end
			config = vim.tbl_deep_extend("force", {}, {
				capabilities = capabilities,
			}, config)
			lspconfig[name].setup(config)
		end

		local disable_semantic_tokens = {
			lua = true,
		}

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")
				local settings = servers[client.name]
				if type(settings) ~= "table" then
					settings = {}
				end

				local builtin = require("telescope.builtin")
				vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
				vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
				vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
				vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

				vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = 0 })
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
				vim.keymap.set("n", "<leader>wd", builtin.lsp_document_symbols, { buffer = 0 })
				vim.keymap.set("n", "do", vim.diagnostic.open_float, { buffer = 0 })

				-- vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
				-- vim.keymap.set("n", "<leader>d", vim.diagnostic.goto_next, opts)
				-- vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
				-- vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

				local filetype = vim.bo[bufnr].filetype
				if disable_semantic_tokens[filetype] then
					client.server_capabilities.semanticTokensProvider = nil
				end

				-- Override server capabilities
				if settings.server_capabilities then
					for k, v in pairs(settings.server_capabilities) do
						if v == vim.NIL then
							---@diagnostic disable-next-line: cast-local-type
							v = nil
						end
						client.server_capabilities[k] = v
					end
				end
			end,
		})

		-- Autoformatting
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "goimports-reviser", "gofumpt", "golines" },
				nix = { "nixpkgs_fmt" },
				terraform = { "terraform_fmt" },
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

		require("lsp_lines").setup()
		vim.diagnostic.config({
			virtual_text = true,
			virtual_lines = false,
			float = {
				border = "rounded",
			},
		})
	end,
}
