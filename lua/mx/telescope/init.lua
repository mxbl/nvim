local M = {}

function M.edit_neovim()
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
