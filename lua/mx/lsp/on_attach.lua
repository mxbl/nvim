return function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.name == "copilot" then
        return
    end

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
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end
