local colorbuddy = require('colorbuddy')
local Color = colorbuddy.Color
local Group = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles

vim.opt.termguicolors = true

Color.new('darkgray', '#202020')
Color.new('darkgray0', '#3a3a3a')
Color.new('darkgray1', '#404040')
Color.new('darkgray2', '#505050')
Color.new('lightblue', '#5eacd3')
Color.new('limegreen', '#6dfc18')

-- require('rose-pine').setup({
--     disable_background = true
-- })

-- colorbuddy.colorscheme 'gruvbuddy'
vim.cmd.colorscheme 'gruvbuddy'

require('colorizer').setup()

Group.new('Whitespace', c.darkgray0, nil, nil)
Group.new('NonText', c.darkgray0, nil, nil)

Group.new('CursorLine', nil, c.darkgray)
Group.new('SignColumn', nil, nil, nil)
--Group.new('Comment', c.darkgray2, nil, nil)
Group.new('Normal', nil, nil, nil)
Group.new('LineNr', c.darkgray2, nil, nil)

-- Telescope
Group.new('TelescopeNormal', c.superwhite, nil, nil)
Group.new('TelescopeBorder', c.darkgray0, nil, nil)
Group.new('TelescopeTitle', c.lightblue, nil, nil)

-- NOTE: needs to stay golang does not use lsp.type.* why?
--   lua and rust do
Group.new('@variable', c.superwhite, nil)
Group.new('@parameter', c.superwhite, nil)
Group.new('@lsp.type.variable', c.superwhite, nil)
Group.new('@lsp.type.parameter', c.superwhite, nil)

Group.new('@function.bracket', g.Normal, g.Normal)
Group.new('@variable.builtin', c.purple:light():light(), g.Normal)

Group.new('WinSeparator', c.gray:dark():dark(), nil, nil)
Group.new('TabLineFill', nil, nil, nil)

vim.cmd [[
  hi link @function.call.lua LuaFunctionCall
  hi link @lsp.type.variable.lua variable
  hi link @lsp.type.variable.rust variable
]]

Group.new("CmpItemAbbr", c.lightblue:light(), nil, nil)
Group.new("CmpItemAbbrMatch", g.CmpItemAbbr.fg:dark(), nil, s.underline)
Group.new("CmpItemAbbrDeprecated", g.Error)
--Group.new("CmpItemAbbrMatchFuzzy", g.CmpItemAbbr.fg:dark(), nil, s.underline)
Group.new("CmpItemKind", g.Special)
Group.new("CmpItemMenu", g.NonText)

Group.new('LspInlayHints', c.lightblue:dark(), nil, nil)
