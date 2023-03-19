local neodev = vim.F.npcall(require, "neodev")
if neodev then
    neodev.setup {
        override = function(root_dir, library)
            library.enabled = true
            library.plugins = true
        end,
    }
end

local lspconfig = vim.F.npcall(require, "lspconfig")
if not lspconfig then
    return
end
local lspconfig_util = require "lspconfig.util"

local inlays = require "mx.lsp.inlay"

local custom_init = function(client)
    client.config.flags = client.config.flags or {}
    client.config.flags.allow_incremental_sysnc = true
end

local custom_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.name == "eslint" then
        vim.cmd.LspStop('eslint')
        return
    end

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end

local update_capabilities = vim.lsp.protocol.make_client_capabilities()

-- completion configuration
-- vim.tbl_deep_extend("force", update_capabilities, require("cmp_nvim_lsp").default_capabilities())
-- update_capabilities.textDocument.completion.completionItem.insertReplaceSupport = false

local rust_analyzer, rust_analyzer_cmd = nil, { "rustup", "run", "nightly", "rust-analyzer" }
rust_analyzer = {
    cmd = rust_analyzer_cmd,
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy"
            },
        },
    },
}

local servers = {
    rust_analyzer = rust_analyzer,
    gopls = {
        settings = {
            gopls = {
                codelenses = { test = true },
                hints = inlays and {
                    assignVariableTypes = true,
                    compositeLiteralFields = true,
                    compositeLiteralTypes = true,
                    constantValues = true,
                    functionTypeParameters = true,
                    parameteraNames = true,
                    rangeVariableTypes = true,
                } or nil,
            },
        },
        flags = {
            debounce_text_changes = 200,
        },
    },
}

require("mason").setup()
require("mason-lspconfig").setup {
    --ensure_installed = { "sumneko_lua" },
}

local setup_server = function(server, config)
    if not config then
        return
    end

    if type(config) ~= "table" then
        config = {}
    end

    config = vim.tbl_deep_extend("force", {
        on_init = custom_init,
        on_attach = custom_attach,
        capabilities = update_capabilities,
        flags = {
            debounce_text_changes = nil,
        },
    },
    config)

    lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
    setup_server(server, config)
end

require("null-ls").setup {
    sources = {
        require("null-ls").builtins.formatting.prettierd,
    },
}

return {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = update_capabilities,
}
