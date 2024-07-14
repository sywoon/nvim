return {
    "nvim-lualine/lualine.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function ()
        -- 如果找不到lualine 组件，就不继续执行
        local status, lualine = pcall(require, "lualine")
        if not status then
            vim.notify("没有找到 lualine")
            return
        end

        lualine.setup({
        options = {
            theme = "auto",  --tokyonight
            component_separators = { left = "|", right = "|" },
            -- https://github.com/ryanoasis/powerline-extra-symbols
            icons_enabled = true,
            component_separators = { left = '', right = ''},
            -- section_separators = { left = '', right = ''},
            section_separators = { left = " ", right = "" },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        extensions = { "nvim-tree", "toggleterm" },
        sections = {
            lualine_c = {
            "filename",
            {
                "lsp_progress",
                spinner_symbols = { " ", " ", " ", " ", " ", " " },
            },
            },
            lualine_x = {
            "filesize",
            {
                "fileformat",
                -- symbols = {
                --   unix = '', -- e712
                --   dos = '', -- e70f
                --   mac = '', -- e711
                -- },
                symbols = {
                    unix = "LF",
                    dos = "CRLF",
                    mac = "CR",
                },
            },
            "encoding",
            "filetype",
            },
        },
        })
    end
}
