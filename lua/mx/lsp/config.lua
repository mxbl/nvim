
local capabilities = require("mx.lsp.capabilities")

local ok, nvim_status = pcall(require, "lsp-status")
if not ok then
    nvim_status = nil
end

local status = require "mx.lsp.status"
if status then
    status.activate()
end

local M = {}


-- TODO: This needs a rework :(
function M.config(_config)
    return vim.tbl_deep_extend("force", {
        --capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        --capabilities = vim.lsp.protocol.make_client_capabilities(),
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }
            if nvim_status then
                nvim_status.on_attach(client)
            end
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
            vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
            vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        end,
    }, _config or {})
end

return M
