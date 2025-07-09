return {
    "nvim-pack/nvim-spectre",
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local cmp = require 'spectre'

        cmp.setup({
            -- default = {
            --     find = {
            --         cmd = "rg", -- 使用 ripgrep 作为搜索引擎
            --         args = {
            --             "--case-sensitive", -- 强制大小写敏感
            --             "--color=never",
            --             "--no-heading",
            --             "--with-filename",
            --             "--line-number",
            --             "--column",
            --         },
            --     },
            -- },
        })
        require("keybindings").spectre()
    end,
}
