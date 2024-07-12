return {
    "rainbowhxch/accelerated-jk",  --jk按键越久越快
    dependencies = {
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            config = function ()
                require("nvim-autopairs").setup {}
            end
            -- use opts = {} for passing setup options
            -- this is equalent to setup({}) function
        }
    },
}
