return {
    {
        'neovim/nvim-lspconfig',
        config = function()
            require "mx.lsp"
        end,
    },
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'simrat39/inlay-hints.nvim',
    'j-hui/fidget.nvim',
    'folke/neodev.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'ray-x/go.nvim',
    --'jose-elias-alvarez/nvim-lsp-ts-utils',
}
