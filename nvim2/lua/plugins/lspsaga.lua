return {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    },
    config = function()
        require('lspsaga').setup({
            finder = {
                max_width = 0.9,
                max_height = 0.8,
                left_width = 0.4,
                methods = {},
                default = 'ref+imp',
                layout = 'normal', --可选 "normal"（上下布局） 或 "float"（浮动窗口）
                -- 如果使用浮动窗口模式，调整浮动窗口大小  测试无效
                -- float = {
                --     max_height = 0.9,
                --     max_width = 0.9,
                -- },
                border_style = "rounded",  -- 可选 "single", "double", "rounded", "bold", "plus"
                -- preview_width = 0.5,  -- 预览区域占窗口宽度的比例
                silent = false,
                filter = {},
                fname_sub = nil,
                sp_inexist = false,
                sp_global = false,
                ly_botright = false,
                number = vim.o.number,
                relativenumber = vim.o.relativenumber,
                keys = {
                    shuttle = '[w',
                    toggle_or_open = 'o',
                    vsplit = 's',
                    split = 'i',
                    tabe = 't',
                    tabnew = 'r',
                    quit = 'q',
                    close = '<C-c>k',
                },
            },
            definition = {
                width = 0.7,
                height = 0.6,
                save_pos = false,
                number = vim.o.number,
                relativenumber = vim.o.relativenumber,
                keys = {
                    edit = '<C-o>',
                    vsplit = '<C-v>',
                    split = '<C-x>',
                    tabe = '<C-t>',
                    tabnew = '<C-c>n',
                    quit = 'q',
                    close = '<ESC>',
                },
            },
        })
    end,
}
