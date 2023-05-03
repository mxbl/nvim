require 'go'.setup({
    goimport = 'gopls',
    gofmt = 'gofumpt',
    max_line_len = 80,
    lsp_gofumpt = true,
    lsp_inlay_hints = {
        enable = false,
    },
})

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require('go.format').goimport()
        require('go.format').gofmt()
    end,
    group = format_sync_grp,
})
