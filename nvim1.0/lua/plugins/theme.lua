local theme_names = {
    monokai = { "tanvirtin/monokai.nvim", "monokai"},
    tokyonight = { "folke/tokyonight.nvim", "tokyonight"},
    tokyonight_moon = { "folke/tokyonight.nvim", "tokyonight-moon"},
}
local theme_name = "monokai"

return {
    -- the colorscheme should be available when starting Neovim
    {
        theme_names[theme_name][1],
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        opts = {},
        config = function()
            -- load the colorscheme here
            -- vim.cmd("colorscheme tokyonight")
            vim.cmd("colorscheme " .. theme_names[theme_name][2])
        end,
    },
}
