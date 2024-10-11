local set = vim.keymap.set
local data = assert(vim.fn.stdpath "data")

require('telescope').setup {
  extensions = {
    wrap_results = true,
    fzf = {},
    history = {
      path = vim.fs.joinpath(data, 'telescope_history.sqlite3'),
      limit = 100,
    },
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {},
    },
  },
}

pcall(require('telescope').load_extension, "fzf")
pcall(require('telescope').load_extension, "smart_history")
pcall(require('telescope').load_extension, "ui-select")

local builtin = require 'telescope.builtin'

set('n', "<leader>pf", builtin.find_files)
