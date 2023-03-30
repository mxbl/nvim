local color, c, Group, g, _ = require('colorbuddy').setup()

vim.opt.termguicolors = true

color.new('darkgray', '#202020')
color.new('darkgray0', '#3a3a3a')
color.new('darkgray1', '#404040')
color.new('darkgray2', '#505050')
color.new('lightblue', '#5eacd3')


-- require('rose-pine').setup({
--     disable_background = true
-- })

require('colorbuddy').colorscheme 'gruvbuddy'
require('colorizer').setup()

Group.new('Whitespace', c.darkgray0, nil, nil)
Group.new('NonText', c.darkgray0, nil, nil)

Group.new('CursorLine', nil, c.darkgray)
Group.new('SignColumn', nil, c.black, nil)
Group.new('Comment', c.darkgray2, nil, nil)
Group.new('Normal', nil, nil, nil)
Group.new('LineNr', c.darkgray2, nil, nil)

-- Telescope
Group.new('TelescopeNormal', c.superwhite, nil, nil)
Group.new('TelescopeBorder', c.darkgray0, nil, nil)
Group.new('TelescopeTitle', c.lightblue, nil, nil)

Group.new('@variable', c.superwhite, nil)
Group.new('@function.bracket', g.Normal, g.Normal)
Group.new('@variable.builtin', c.purple:light():light(), g.Normal)
--Group.new('WinSeparator', nil, nil)

--Group.new('TabLine', nil, c.darkgray2, nil)
Group.new('VertSplit', c.red, nil, nil)
Group.new('TabLineFill', nil, nil, nil)

vim.cmd [[highlight link @function.call.lua LuaFunctionCall]]
