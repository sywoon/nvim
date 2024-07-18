return {
    "rainbowhxch/accelerated-jk.nvim", --jk按键越久越快
    dependencies = {
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            config = function()
                require("nvim-autopairs").setup {}
            end
            -- use opts = {} for passing setup options
            -- this is equalent to setup({}) function
        },
        "mg979/vim-visual-multi",   --模拟vsc的ctrl+d多选
        "tpope/vim-commentary",     --模拟vsc的ctrl+/注释
    },
}

