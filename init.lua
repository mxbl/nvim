-- Setup globals expected to be always available.
require 'mx.globals'

-- It's a good idea to set this early, because mappings set before doing this
-- will be set to the old leader.
vim.g.mapleader = " "

require 'mx.packer'
require 'mx.remap'
require 'mx.lsp'
