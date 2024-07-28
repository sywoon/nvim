-- 禁用 Neovim 中默认的 Netrw 插件
-- 为了使用替代的文件浏览器插件
-- 如:NERDTree、vim-vinegar 或 nvim-tree.lua，以避免冲突
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require "basic"
require "keybindings"
require "plugin"
require "lsp.ui"
require "dap.nvim-dap"


