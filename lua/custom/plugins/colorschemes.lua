return {
  {
    lazy = false,
    priority = 1000,
    'tjdevries/colorbuddy.nvim',
    dependencies = {
      'norcalli/nvim-colorizer.lua'
    },
    config = function()
      vim.cmd.colorscheme 'gruvbuddy'
      require'colorizer'.setup()

      local Color = require'colorbuddy'.Color
      local Group = require'colorbuddy'.Group
      local c = require'colorbuddy'.colors
      Color.new('darkgray0', '#101010')
      Color.new('darkgray1', '#202020')
      Color.new('darkgray2', '#3a3a3a')
      Color.new('darkgray3', '#505050')
      Color.new('lightblue', '#5eacd3')

      --Group.new('Normal', nil, nil, nil)
      --Group.new('SignColumn', nil, nil, nil)
      --Group.new('LineNr', c.darkgray3, nil, nil)

      Group.new('CursorLine', nil, c.darkgray1)
      Group.new('LirFloatBorder', c.darkgray0, nil)
      Group.new('TelescopeNormal', c.superwhite, nil)
      Group.new('TelescopeTitle', c.lightblue, nil)
      Group.new('TelescopeBorder', c.darkgray2, nil)

      Group.new('Whitespace', c.darkgray2, nil, nil)
      Group.new('NonText', c.darkgray2, nil, nil)
    end,
  }
}
