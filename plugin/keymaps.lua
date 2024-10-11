local set = vim.keymap.set

set("n", "<c-j>", "<c-w><c-j>")
set("n", "<c-k>", "<c-w><c-k>")
set("n", "<c-l>", "<c-w><c-l>")
set("n", "<c-h>", "<c-w><c-h>")

set("n", "<cr>", function()
  if vim.opt.hlsearch:get() then
    vim.cmd.nohl()
    return ""
  else
    return "<cr>"
  end
end, { expr = true })
