local M = {}

-- Example using Lua callback: 
-- ```lua
--     require"mx.auto".autocmd {
--       {"BufEnter", "BufWritePost", "CursorHold"},
--       augroup_codelens,
--       require"mx.lsp.codelens".refresh_virtlines,
--       0,
--     })
-- ```
M.autocmd = function(args)
    local event = args[1]
    local group = args[2]
    local callback = args[3]

    vim.api.nvim_create_autocmd(event, {
        group = vim.api.nvim_create_augroup(group, {}),
        buffer = args[4],
        callback = function()
            callback()
        end,
        once = args.once,
    })
end

return M
