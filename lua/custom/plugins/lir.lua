return {
  {
    'tamago324/lir.nvim',
    dependencies = {
      'tamago324/lir-git-status.nvim',
      'kyazdani42/nvim-web-devicons',
    },

    config = function() end,

    config = function()
      require'nvim-web-devicons'.set_icon({
        lir_folder_icon = {
          icon = "",
          color = "#7ebae4",
          name = "LirFolderNode",
        },
      })
      require('lir').setup {
        show_hidden_files = true,
        devicons = { enable = true },
        float = {
          winblend = 15,
          curdir_window = {
            enable = false,
            highlight_dirname = true,
          },
          win_opts = function()
            local width = math.floor(vim.o.columns * 0.8)
            return {
              border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
              width = width,
              height = math.floor(vim.o.lines * 0.8),
              row = 1,
              col = math.floor((vim.o.columns - width) / 2),
            }
          end,
        },
        mappings = {
          ['<cr>'] = require'lir.actions'.edit,
          ['-']    = require'lir.actions'.up,
          ['q']    = require'lir.actions'.quit,
          ['@']    = require'lir.actions'.cd,
          ['M']    = require'lir.actions'.mkdir,
          ['N']    = require'lir.actions'.newfile,
          ['R']    = require'lir.actions'.rename,
          ['D']    = require'lir.actions'.delete,
        },
      }

      require('lir.git_status').setup {
        show_ignored = false,
      }

      vim.keymap.set('n', '<leader>pv', function() require'lir.float'.toggle() end)
    end,
  },
}