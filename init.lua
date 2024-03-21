-- Setup globals expected to be always available.
require 'mx.globals'

-- It's a good idea to set this early, because mappings set before doing this
-- will be set to the old leader.
vim.g.mapleader = " "

vim.cmd([[
  autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
  autocmd TermOpen * startinsert
  autocmd BufWinEnter,WinEnter term://* startinsert
]])

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    }
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("custom.plugins", {
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
    },
  },
})

--require 'mx.packer'
--require 'mx.lsp'
