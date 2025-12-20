return {
  {
    'TimUntersberger/neogit',
    config = function()
      require'neogit'.setup {
        disable_context_highlighting = false,
      }

      vim.keymap.set('n', '<leader>ng', require'neogit'.open, {}) 
    end,
  }
}

