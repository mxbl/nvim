local neodev = vim.F.npcall(require, "neodev")
if neodev then
    neodev.setup {
        override = function(_, lib)
            lib.enabled = true
            lib.plugins = true
        end,
    }
end

local augroup_codelens = vim.api.nvim_create_augroup('custom-lsp-codelens', { clear = true })

local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.ensure_installed({
--    'sumneko_lua',
    'rust_analyzer',
    'eslint',
    'tsserver',
    'gopls',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    setttings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local inlays = require "mx.lsp.inlay"

lsp.configure('gopls', {
    settings = {
        gopls = {
            codelenses = { test = true },
            hints = inlays and {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            } or nil,
        },
    },
    flags = {
        debounce_text_changes = 200,
    },
})

local on_attach = require"mx.lsp.on_attach"

require"lspconfig".ocamllsp.setup{
    on_attach = on_attach,
}

require"lspconfig".pylsp.setup{
    on_attach = on_attach,
}

-- lsp.configure('rust_analyzer', {
--     setttings = {
--     },
-- })

lsp.on_attach(on_attach)

local ok, lspkind = pcall(require, 'lspkind')
if not ok then
    return
end

lspkind.init {
    symbol_map = {
        Copilot = "",
    },
}
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

local cmp = require 'cmp'
lsp.setup_nvim_cmp({
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-c>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping (
            cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            },
            { 'i', 'c' }
        ),

        ['<C-Space>'] = cmp.mapping.complete(),
        ['<tab>'] = cmp.config.disable,
    },

    sources = cmp.config.sources({
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "copilot" },
        { name = "path" },
        { name = "buffer", keyword_length = 5 },
    }),

    formatting = {
        format = lspkind.cmp_format {
            mode = 'symbol_text',
            --with_text = true,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[path]",
                luasnip = "[snip]",
            },
        },
    },
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

-- local tabnine = require'cmp_tabnine.config'
-- tabnine.setup({
--     max_lines = 1000,
--     max_num_results = 20,
--     sort = true,
--     run_on_every_keystroke = true,
--     snippet_placeholder = "..",
-- })

require("fidget").setup {
    text = {
        spinner = "moon",
    },
    align = {
        bottom = true,
    },
    window = {
        relative = "editor",
    },
}
