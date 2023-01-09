require'nvim-treesitter.configs'.setup {
    ensure_installed = { "help", "c", "lua", "rust" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    playground = {
        enable = true,
    }
}

vim.keymap.set('n', '<leader>tp', vim.cmd.TSPlaygroundToggle)
