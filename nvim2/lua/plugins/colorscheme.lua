
local theme_names = {
    tokyonight = { "folke/tokyonight.nvim", "tokyonight"},
    tokyonight_moon = {"folke/tokyonight.nvim", "tokyonight-moon"},
    tokyonight_night = {"folke/tokyonight.nvim", "tokyonight-moon"},
    onedark = {"ful1e5/onedark.nvim", "onedark"},
    OceanicNext = {"mhartington/oceanic-next", "OceanicNext"},
    gruvbox = {"ellisonleao/gruvbox.nvim", "gruvbox"},
    nord = {"shaunsingh/nord.nvim", "nord"},   --太素了
    nightfox = {"EdenEast/nightfox.nvim", "nightfox"},
    monokai = { "tanvirtin/monokai.nvim", "monokai"},
}
local theme_name = "tokyonight_moon"

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

