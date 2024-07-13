-- 多个buffer页签
return {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function ()
        require("bufferline").setup{
            options = {
		close_command = "bdelete! %d",       -- 点击关闭按钮关闭
		--right_mouse_command = "bdelete! %d", -- 右键点击关闭
		indicator = {
			icon = '▎', -- 分割线
			style = 'underline',
		},
		buffer_close_icon = '󰅖',
		modified_icon = '●',
		close_icon = '',
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "left",
                        separator = true,
                    },
                },
            },
        }
    end,
}
