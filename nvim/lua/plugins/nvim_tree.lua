local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  -- vim.keymap.set('n', '<leader>e',  api.tree.toggle,                  opts('Toggle')) 无效 额外使用NvimTreeToggle来绑定 
end

return { 
    "kyazdani42/nvim-tree.lua", 
    -- event = "VimEnter", 
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    }, 
    config = function ()
        require("nvim-tree").setup({
            on_attach = my_on_attach,
            sort = {
                sorter = "case_sensitive",
            },
            view = {
		-- 文件浏览器展示位置，左侧：left, 右侧：right
		side = "left",
		-- 行号是否显示
		number = false,
		relativenumber = false,
		signcolumn = "yes", -- 显示图标
                width = 30,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true, -- 过滤 dotfile
		custom = { "node_modules" }, -- 其他过滤目录
            },
	    -- 是否显示 git 状态
	    git = {
		enable = false,
	    },
        })
    end
}
