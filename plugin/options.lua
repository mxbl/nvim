local o = vim.opt

o.inccommand = "split"
o.smartcase = true
o.ignorecase = true

o.number = true
o.relativenumber = true

o.splitbelow = true
o.splitright = true

o.signcolumn = "yes"
o.shada = { "'10", "<0", "s10", "h" }

o.clipboard = "unnamedplus"

o.formatoptions:remove "o"
