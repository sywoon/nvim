-- 禁用 Neovim 中默认的 Netrw 插件
-- 为了使用替代的文件浏览器插件
-- 如:NERDTree、vim-vinegar 或 nvim-tree.lua，以避免冲突
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- vim.log.info
-- ~/.local/share/nvim/log
function log(msg)
    vim.notify(msg)
    local path = vim.fn.stdpath("data")
    local file = io.open(path .. '/nvim_log.txt', 'a')
    if file then
        file:write(msg .. '\n')
        file:close()
    end
end

function clear_log()
    local path = vim.fn.stdpath("data")
    local file = io.open(path .. '/nvim_log.txt', 'w')
    if file then
        file:write('')
        file:close()
    end
end

function open_log()
    local path = vim.fn.stdpath("data")
    vim.cmd('edit ' .. path .. '/nvim_log.txt')
end


require "basic"
require "keybindings"
require "plugin"
require "lsp.ui"
require "dap.nvim-dap"
