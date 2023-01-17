local telescope = require'telescope'
local actions = require'telescope.actions'
local action_layout = require'telescope.actions.layout'

telescope.setup {
    defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        mappings = {
            i = {
                ["<C-f>"] = R('telescope').extensions.hop.hop,
                ["<C-h>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,
                ["<C-Space>"] = action_layout.toggle_preview,
                ["<PageUp>"] = actions.preview_scrolling_up,
                ["<PageDown>"] = actions.preview_scrolling_down,
            }
        },
        winblend = 0,
        layout_strategy = "horizontal",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        scroll_strategy = "cycle",
        color_devicons = true,
        layout_config = {
            width = 0.95,
            height = 0.5,
            prompt_position = "top",
            horizontal = {
                preview_width = function(_, cols, _)
                    if cols > 200 then
                        return math.floor(cols * 0.4)
                    else
                        return math.floor(cols * 0.6)
                    end
                end,
            },
            vertical = {
                width = 0.9,
                height = 0.95,
                preview_width = 0.5,
            },
        },
    },

    hop = {
        sign_hl = { "WarningMsg", "Title" },
        line_hl = { "CursorLine", "Normal" },
    },
}
telescope.load_extension 'fzf'
telescope.load_extension 'hop'

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', ',h', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string { search = vim.fn.input('Grep ❯ ') }
end)
vim.keymap.set('n', '<leader>pw', function()
	builtin.grep_string { search = vim.fn.expand('<cword>') }
end)
