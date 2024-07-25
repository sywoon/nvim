local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    -- vim.keymap.set('n', '<leader>e',  api.tree.toggle,                  opts('Toggle')) ÎÞÐ§ ¶îÍâÊ¹ÓÃNvimTreeToggleÀ´°ó¶¨
end

return {
    {
        "nvim-tree/nvim-tree.lua",                      --插件在github上的short url
        version = "*",                                  --表明使用最新版本  以后仓库有更新，则拉去最新插件代码
        dependencies = { "nvim-tree/nvim-web-devicons" }, --依赖另一个插件
        config = function()                             --插件启动加载以后，则会执行该config的代码
            local status, nvim_tree = pcall(require, "nvim-tree")
            if not status then
                vim.notify("没有找到 nvim-tree")
                return
            end
            nvim_tree.setup {
                -- 不显示 git 状态图标
                git = {
                    enable = false,
                },
                -- project.nvim plugin 需要这样设置
                respect_buf_cwd = true,
                update_cwd = true,
                sync_root_with_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_cwd = true,
                },
                -- 隐藏 .文件 和 node_modules 文件夹
                filters = {
                    dotfiles = true,
                    custom = { 'node_modules', ’.git' },
                },
                sort = {
                    sorter = "case_sensitive",
                },
                on_attach = my_on_attach,
                view = {
                    -- 宽度
                    width = 30,
                    -- 也可以 'right'
                    side = 'left',
                    -- 隐藏根目录 失效了
                    -- hide_root_folder = false,
                    -- 自定义列表中快捷键
                    -- mappings = {
                    --     custom_only = false,
                    --     list = list_keys,
                    -- },
                    -- 不显示行数
                    number = false,
                    relativenumber = false,
                    -- 显示图标
                    signcolumn = 'yes',
                },
                actions = {
                    open_file = {
                        -- 首次打开大小适配
                        resize_window = true,
                        -- 打开文件时关闭
                        quit_on_open = false,
                    },
                },
            }

            vim.cmd([[
                :hi      NvimTreeExecFile    guifg=#ffa0a0
                :hi      NvimTreeSpecialFile guifg=#ff80ff gui=underline
                :hi      NvimTreeSymlink     guifg=Yellow  gui=italic
                :hi link NvimTreeImageFile   Title
            ]])
	    -- 自动关闭: 做什么用的？  有bug  游戏工程打开会nvim会崩溃 为何？
	   --	vim.cmd([[
	   --	  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
	   --	]]
	   --	)
        end
    }
}
