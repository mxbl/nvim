local Color, colors, Group, groups, styles = require('colorbuddy').setup()

vim.opt.termguicolors = true

Color.new('darkgray0', '#3a3a3a')
Color.new('darkgray1', '#404040')
Color.new('darkgray2', '#505050')
Color.new('lightblue', '#5eacd3')

require('colorizer').setup()

-- require('rose-pine').setup({
--     disable_background = true
-- })

function MxGruvbuddySetup(scheme)
    scheme = scheme or 'gruvbuddy'

    require('colorbuddy').colorscheme(scheme)

    Group.new('Whitespace', colors.darkgray0, nil, nil)
    Group.new('NonText', colors.darkgray0, nil, nil)

    if scheme == 'gruvbuddy' then
        Group.new('SignColumn', nil, nil, nil)
        Group.new('Comment', colors.darkgray2, nil, nil)
        Group.new('Normal', nil, nil, nil)
        Group.new('LineNr', colors.darkgray2, nil, nil)
    end
end

MxGruvbuddySetup()


-- Telescope
Group.new('TelescopeNormal', nil, nil, nil)
Group.new('TelescopeBorder', colors.darkgray0, nil, nil)
Group.new('TelescopeTitle', colors.darkgray0, nil, nil)

Group.new('Identifier', nil, nil, nil)
--Group.new('helpNormal', nil, colors.darkgray2, nil)
--Group.new('helpNormal', nil, colors.darkgray2, nil)
