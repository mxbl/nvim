return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            'neovim/nvim-lspconfig',
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            'williamboman/mason-lspconfig.nvim',
        },
    },

    'simrat39/inlay-hints.nvim',
    {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        event = 'LspAttach',
    },
    'folke/neodev.nvim',
    'jose-elias-alvarez/null-ls.nvim',

    {
        'ray-x/go.nvim',
        dependencies = {
            'ray-x/guihua.lua',
        },
    },

    'nvim-lua/lsp-status.nvim',
}

--'jose-elias-alvarez/nvim-lsp-ts-utils',
