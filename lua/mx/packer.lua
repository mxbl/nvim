vim.cmd [[packadd packer.nvim]]

vim.keymap.set('n', ',ps', function()
    vim.cmd.PackerSync()
end)

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'nvim-telescope/telescope-hop.nvim'
    use {
        'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'}
    }
    use 'nvim-treesitter/playground'
    use 'nvim-treesitter/nvim-treesitter-context'

    -- Colors
    use 'tjdevries/colorbuddy.nvim'
    use 'tjdevries/gruvbuddy.nvim'
    use 'norcalli/nvim-colorizer.lua'

    -- Statusline
    use 'tjdevries/express_line.nvim'
    -- use {
    --     'rose-pine/nvim', as = 'rose-pine',
    --     config = function()
    --         vim.cmd('colorscheme rose-pine')
    --     end
    -- }

    use 'theprimeagen/harpoon'
    use 'mbbill/undotree'
    use 'numToStr/Comment.nvim'
    use 'TimUntersberger/neogit'
    use 'tpope/vim-surround'

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use 'j-hui/fidget.nvim'
    use 'wbthomason/lsp-status.nvim'

    -- Tabnine
    use {
        'tzachar/cmp-tabnine', { run = './install.sh' }
    }

    use 'ray-x/go.nvim'
    use 'pearofducks/ansible-vim'

    -- subscribe ??
    --use 'github/copilot.vim'
end)
