local augroup_codelens = vim.api.nvim_create_augroup('custom-lsp-codelens', { clear = true })
local autocmd_clear = vim.api.nvim_clear_autocmds
local autocmd = require"mx.auto".autocmd

local filetype_attach = setmetatable({
    ocaml = function()
        -- Display type information
        autocmd_clear { group = augroup_codelens, buffer = 0 }
        autocmd {
            { "BufEnter", "BufWritePost", "CusorHold" },
            augroup_codelens,
            require"mx.lsp.codelens".refresh_virtlines,
            0,
        }

        -- vim.keymap.set(
        --     "n",
        --     "<space>tt",
        --     require("mx.lsp.codelens").toggle_virtlines,
        --     { silent = true, desc = "[T]oggle [T]ypes", buffer = 0 }
        -- )
    end,
}, {
    __index = function()
        return function() end
    end,
})

return function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.name == "copilot" then
        return
    end

    local filetype = vim.api.nvim_buf_get_option(0, "filetype")

    if client.name == "gopls" then
        require("inlay-hints").on_attach(client, bufnr)
    end

    if client.name == "eslint" then
        vim.cmd.LspStop('eslint')
        return
    end

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>lr", function() R"mx.lsp.codelens".run() end, opts)
    vim.keymap.set("n", "<leader>tt", require"mx.lsp.codelens".toggle_virtlines, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

    filetype_attach[filetype]()
end
