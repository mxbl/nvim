local M = {}

function M.edit_neovim()
    local opts
    opts = {
        prompt_title = "~ neovim ~",
        cwd = "~/.config/nvim/",
        layout_strategy = "flex",
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
        layout_config = {
            width = 0.9,
            height = 0.8,
            horizontal = {
                width = { padding = 0.15 },
            },
            vertical = {
                preview_height = 0.75,
            },
            prompt_position = "top",
        },
    }

    require("telescope.builtin").find_files(opts)
end

function M.edit_fish()
end

function M.live_grep()
    require("telescope.builtin").live_grep {
        previewer = false,
        fzf_separator = "|>",
    }
end

function M.file_browser()
    local opts
    opts = {
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
        layout_config = {
            prompt_position = "top",
        },
    }

    require("telescope").extensions.file_browser.file_browser(opts)
end

function M.find_files()
    local opts
    opts = {
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
        layout_config = {
            prompt_position = "top",
        },
    }

    require("telescope.builtin").find_files(opts)
end

return M
