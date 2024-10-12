local o = vim.opt

o.inccommand = "split"
o.hlsearch = true
o.incsearch = true
o.smartcase = true
o.ignorecase = true

o.number = true
o.relativenumber = true
o.cursorline = true
o.cursorlineopt = "screenline,number"

o.splitbelow = true
o.splitright = true

o.signcolumn = "yes"
o.shada = { "'10", "<0", "s10", "h" }

o.clipboard = "unnamedplus"

o.formatoptions:remove "o"

o.ruler = false
o.fillchars = { vert = "│", eob = "~" }
o.list = true
o.listchars = {
  tab   = "» ",
  eol   = "↲",
  space  = "·",
  trail = "~"
}

o.scrolloff = 8
o.breakindent = true
o.wrap = true
o.linebreak = true
o.showbreak = "   │" --string.rep(" ", 3)
o.linebreak = true

o.tabstop = 4
o.shiftwidth = 4

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

o.isfname:append("@-@")

o.more = false
