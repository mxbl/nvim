
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Don't pass messages to |ins-completion-menu|
vim.opt.shortmess:append "c"

local ok, lspkind = pcall(require, 'lspkind')
if not ok then
    return
end

local cmp = require 'cmp'

cmp.setup {
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
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

    -- view = {
    --     entries = "native",
    -- },
} 
