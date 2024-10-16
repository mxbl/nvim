return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    -- branch = 'main',
    -- lazy = 'false',
    config = function()
      local configs = require'nvim-treesitter.configs'
      configs.setup({
        ensure_installed = { "lua", "json", "vim", "vimdoc", "go", "yaml" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
