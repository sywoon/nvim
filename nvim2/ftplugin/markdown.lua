-- 不为何 markdown 文件的缩进不生效
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2

-- 用行号测试 发现md文件是执行和生效的 且不会影响其他文件
vim.wo.number = true  -- 启用行号
vim.wo.relativenumber = false-- 启用相对行号
