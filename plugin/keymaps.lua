local set = vim.keymap.set

set("n", "<c-j>", function() require('custom.tmux').navigate('j') end)
set("n", "<c-k>", function() require('custom.tmux').navigate('k') end)
set("n", "<c-l>", function() require('custom.tmux').navigate('l') end)
set("n", "<c-h>", function() require('custom.tmux').navigate('h') end)

set("n", "<cr>", function()
  if vim.opt.hlsearch:get() then
    vim.cmd.nohl()
    return ""
  else
    return "<cr>"
  end
end, { expr = true })
