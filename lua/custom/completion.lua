vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.shortmess:append 'c'

local lspkind = require'lspkind'
lspkind.init {}

local cmp = require'cmp'

cmp.setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
  },
  mapping = {
    ['<c-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ['<c-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ['<c-y>'] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { 'i', 'c' }
    ),
  },

  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
}

-- TODO: vim-dadbod
-- cmp.setup.filetype({ 'spl' }, {
--   TODO
-- })