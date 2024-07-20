local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

db.setup({
    theme = 'hyper',
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
})

