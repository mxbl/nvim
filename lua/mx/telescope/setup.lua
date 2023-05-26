local actions = require'telescope.actions'
local action_layout = require'telescope.actions.layout'

require("telescope").setup {
    defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        mappings = {
            i = {
                ["<Space>"] = R('telescope').extensions.hop.hop,
                ["<C-h>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,
                ["<C-y>"] = action_layout.toggle_preview,
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
            height = 0.85,
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
                preview_height = 0.5,
            },
        },

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    },

    pickers = {
        find_files = {
            mappings = {
                n = {
                    ["kj"] = "close",
                },
            },
        },
    },

    hop = {
        sign_hl = { "WarningMsg", "Title" },
        line_hl = { "CursorLine", "Normal" },
    },

    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_cursor {
                layout_config = {
                    width = 0.4,
                    height = 16,
                }
            }
        }
    },
}
_ = require("telescope").load_extension 'file_browser'
_ = require("telescope").load_extension 'ui-select'
_ = require("telescope").load_extension 'fzf'
_ = require("telescope").load_extension 'hop'

local mx_tele = require "mx.telescope"
