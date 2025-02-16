-- :colorscheme tokyonight-storm
return {
    "folke/tokyonight.nvim",
    opts = { --插件扩展配置
        style = "storm",
    },
    config = function (_, opts)
        require("tokyonight").setup(opts)
		vim.cmd("colorscheme tokyonight")
    end
}
