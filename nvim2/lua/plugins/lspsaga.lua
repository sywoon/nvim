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
                default = 'ref+imp',
            },
            definition = {
                width = 0.7,
                height = 0.6,
            },
        })
    end,
}
