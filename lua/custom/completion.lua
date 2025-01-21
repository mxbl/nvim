vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c")

local lspkind = require("lspkind")
--lspkind.init({})
lspkind.init({
	symbol_map = {
		Copilot = "",
	},
})

local cmp = require("cmp")

local ls = require("luasnip")

-- require("copilot").setup()
-- require("copilot_cmp").setup()

vim.snippet.expand = ls.lsp_expand
vim.snippet.stop = ls.unlink_current

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	override_builtin = true,
})

cmp.setup({
	sources = {
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
	},
	mapping = {
		["<c-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<c-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<c-y>"] = cmp.mapping(
			cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}),
			{ "i", "c" }
		),
	},
	formatting = {
		format = lspkind.cmp_format(),
	},

	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	experimental = {
		ghost_text = {
			hl_group = "GhostText",
		},
	},
})

-- TODO: vim-dadbod
-- cmp.setup.filetype({ 'spl' }, {
--   TODO
-- })
