local neodev = vim.F.npcall(require, "neodev")
if neodev then
    neodev.setup {
        override = function(_, lib)
            lib.enabled = true
            lib.plugins = true
        end,
    }
end

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

-- lsp.configure('rust_analyzer', {
--     setttings = {
--     },
-- })

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.name == "gopls" then
        require("inlay-hints").on_attach(client, bufnr)
    end

    if client.name == "eslint" then
        vim.cmd.LspStop('eslint')
        return
    end

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

local ok, lspkind = pcall(require, 'lspkind')
if not ok then
    return
end

lspkind.init()

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
