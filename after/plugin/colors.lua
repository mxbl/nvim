local color, c, Group, _, _ = require('colorbuddy').setup()

vim.opt.termguicolors = true

color.new('darkgray0', '#3a3a3a')
color.new('darkgray1', '#404040')
color.new('darkgray2', '#505050')
color.new('lightblue', '#5eacd3')

require('colorizer').setup()

-- require('rose-pine').setup({
--     disable_background = true
-- })

require('colorbuddy').colorscheme('gruvbuddy')

Group.new('Whitespace', c.darkgray0, nil, nil)
Group.new('NonText', c.darkgray0, nil, nil)

Group.new('SignColumn', nil, nil, nil)
Group.new('Comment', c.darkgray2, nil, nil)
Group.new('Normal', nil, nil, nil)
Group.new('LineNr', c.darkgray2, nil, nil)

-- Telescope
Group.new('TelescopeNormal', c.superwhite, nil, nil)
Group.new('TelescopeBorder', c.darkgray0, nil, nil)
Group.new('TelescopeTitle', c.lightblue, nil, nil)

Group.new('@variable', c.superwhite, nil)
--Group.new('WinSeparator', nil, nil)

--Group.new('TabLine', nil, c.darkgray2, nil)
Group.new('TabLineFill', nil, nil, nil)
