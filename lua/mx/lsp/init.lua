local status = require "mx.lsp.status"
if status then
    status.activate()
end

-- local tabnine = require("cmp_tabnine.config")
-- tabnine:setup({
--     max_lines = 1000,
--     max_num_results = 20,
--     sort = true,
--     run_on_every_keystroke = true,
--     snippet_placeholder = "..",
-- })

require("mx.lsp.rust").setup()
require("mx.lsp.rust").inlay_hints.enable()
