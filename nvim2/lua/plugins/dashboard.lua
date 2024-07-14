return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { 
      'nvim-tree/nvim-web-devicons',
      'ahmedkhalf/project.nvim',
  },
  config = function()
    local db = require "dashboard"
    db.setup {
        theme = 'hyper',  --hyper doom
        config = {
            header = {
                [[]],
                [[███████╗██╗   ██╗██╗    ██╗ ██████╗  ██████╗ ███╗   ██╗]],
                [[██╔════╝╚██╗ ██╔╝██║    ██║██╔═══██╗██╔═══██╗████╗  ██║]],
                [[███████╗ ╚████╔╝ ██║ █╗ ██║██║   ██║██║   ██║██╔██╗ ██║]],
                [[╚════██║  ╚██╔╝  ██║███╗██║██║   ██║██║   ██║██║╚██╗██║]],
                [[███████║   ██║   ╚███╔███╔╝╚██████╔╝╚██████╔╝██║ ╚████║]],
                [[╚══════╝   ╚═╝    ╚══╝╚══╝  ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝]],
                [[                                              ]],
                [[]],
                [[]],
            },
            week_header = {
                enable = false,
            },
            shortcut = {
                { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
                {
                    icon = ' ',
                    icon_hl = '@variable',
                    desc = 'Files',
                    group = 'Label',
                    action = 'Telescope find_files',
                    key = 'f',
                },
                {
                    icon = "  ",
                    desc = "Projects",
                    action = "Telescope projects",
                    key = 'p',
                },
            },
        },
    }
  end,
}
