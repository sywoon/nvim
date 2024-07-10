 -- <leader> key
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- map('模式', '按键', '映射为', 'options')
-- n Normal 模式
-- i Insert 模式
-- v Visual 模式
-- t Terminal 模式
-- c Command 模式
local map = vim.api.nvim_set_keymap
local map2 = vim.keymap.set
local opt = {noremap = true, silent = true}


-- 窗口管理快捷键
-- map("", "", "", opt)
map("n", "s", "", opt)  -- 取消s的默认功能
map("n", "sv", ":vsp<CR>", opt)  -- 分新列
map("n", "sh", ":sp<CR>", opt)  -- 分新行
map("n", "sc", "<C-w>c", opt)  --关闭当前
map("n", "so", "<C-w>o", opt)  --关闭其他
map("n", "<A-h>", "<C-w>h", opt)  --alt+hjkl切换不同窗口
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)


-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)


-- Terminal相关
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "A-h", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "A-j", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "A-k", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "A-l", [[ <C-\><C-N><C-w>l ]], opt)


-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv=gv", opt)
map("v", "K", ":move '<-2<CR>gv=gv", opt)

-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- ctrl+u / ctrl+d 只移动9行 默认半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)


-- 在v模式 粘贴不要复制
map("v", "p", '"_dP', opt)

-- 退出
--map("n", "q", ":q<CR>", opt)
-- map("n", "qq", ":q!<CR>", opt)
-- map("n", "Q", ":qa!<CR>", opt)

map("n", "<C-h>", ":bp<cr>", opt)
map("n", "<C-l>", ":bn<cr>", opt)

-- insert模式 调到行首尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

map2({"i","v"}, "jk", "<ESC>", opt)



-- 第三方插件
map("n", "<leader>e", ":NvimTreeToggle<cr>", opt)




