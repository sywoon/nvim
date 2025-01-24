-- 禁用 Neovim 中默认的 Netrw 插件
-- 为了使用替代的文件浏览器插件
-- 如:NERDTree、vim-vinegar 或 nvim-tree.lua，以避免冲突
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- 添加 Neovide 相关设置
if vim.g.neovide then
    -- vim.print(vim.g.neovide_version)
    vim.g.neovide_iso_layout = 0
    vim.g.neovide_theme = "dark"
    vim.g.neovide_padding_left = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_transparency = 1.0
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_cursor_vfx_mode = "railgun"
    -- vim.o.guifont = "SauceCodePro Nerd Font:h12"
    vim.o.guifont = "Cousine Nerd Font:h12"
end

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

local function open_directory()
    local current_file = vim.api.nvim_buf_get_name(0)
    local directory = vim.fn.fnamemodify(current_file, ':h')
    directory = string.gsub(directory, '/', '\\')
    -- vim.notify(directory)
    --
    -- 只能在powershell中使用
    local result = vim.fn.system('explorer "'..directory..'"')
    -- print("'" .. result .. "'")  --有换行

    -- git bash不支持
    -- if string.find(result, "/usr/bin/bash: /s: No such file or directory") then
    --     directory = string.gsub(directory, '\\', '\\\\') .. '\\\\'
    --     result = vim.fn.system('explorer "'..directory..'"')
    --     print(result)
    -- end
end
vim.api.nvim_create_user_command('OpenDirectory', open_directory, {})


require "basic"
require "keybindings"
require "plugin"
require "lsp.ui"
require "dap.nvim-dap"
