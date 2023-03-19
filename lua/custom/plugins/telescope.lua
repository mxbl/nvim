return {
    {
        'nvim-telescope/telescope.nvim',
        config = function()
            require "mx.telescope.setup"
            require "mx.telescope.keys"
        end,
    },
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-hop.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}
