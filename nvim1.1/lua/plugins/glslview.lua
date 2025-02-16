return {
    'timtro/glslView-nvim',
    config = function()
        require("glslView").setup {
            viewer_path = 'glslViewer',
            args = { '-l' },
        }
    end,
}
