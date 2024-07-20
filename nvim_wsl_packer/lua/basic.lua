-- vim.g.{name} 全局变量（global variables）
-- vim.o.{name} 全局选项（global options）
-- vim.b.{name} 缓冲区变量
-- vim.w.{name} 窗口变量
-- vim.bo.{option} buffer-local选项
-- vim.wo.{option} window-local选项
--
-- utf8
vim.g.encoding = "UTF-8"  -- 设置全局编码为 UTF-8
vim.o.fileencoding = "utf-8"  -- 设置文件编码为 UTF-8

-- 鼠标支持
vim.o.mouse = "a"

-- 使用系统粘贴板
--vim.o.clipboard = "unnamedplus"
vim.opt.clipboard = 'unnamedplus'

-- 使用相对行号
vim.wo.number = true  -- 启用行号
vim.wo.relativenumber = true  -- 启用相对行号

-- 高亮所在行
vim.wo.cursorline = true

-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"  -- 始终显示符号列
-- 右侧参考线，超过表示代码太长了，考虑换行
vim.wo.colorcolumn = "80"

-- jkhl 移动时光标周围保留8行 会影响<S-h/l>的定位
-- vim.o.scrolloff = 8
-- vim.o.sidescrolloff = 8

-- 缩进4个空格等于一个Tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true

-- 新行对齐当前行
vim.o.autoindent = true  -- 自动对齐新行
vim.bo.autoindent = true
vim.o.smartindent = true   -- 智能对齐新行

-- 搜索大小写不敏感 除非包含大写
vim.o.ignorecase = true  -- 搜索时忽略大小写
vim.o.smartcase = true  -- 搜索时如果包含大写字母则区分大小写

-- 搜索不要高亮
vim.o.hlsearch = false

-- 边输入边搜索
vim.o.incsearch = true

-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 2
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true

-- 禁止折行
vim.wo.wrap = false
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.o.whichwrap = '<,>,[,]'
-- 允许隐藏被修改过的buffer
vim.o.hidden = true  -- 允许在不保存的情况下切换 buffer

-- 禁止创建备份文件
vim.o.backup = false   -- 禁用备份文件
vim.o.writebackup = false  -- 禁用写入备份文件
vim.o.swapfile = false  -- 禁用交换文件

-- smaller updatetime
vim.o.updatetime = 300

-- 设置timeoutlen 为等待键盘快捷键连击时间500毫秒 可根据需要设置
vim.o.timeoutlen = 500

-- split window 从下边和右边出现
vim.o.splitbelow = true  -- 新窗口从下边出现
vim.o.splitright = true  -- 新窗口从右边出现

-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true  -- 启用终端的真彩色支持
vim.opt.termguicolors = true

-- 不可见字符的显示 这里只把空格显示为一个点
vim.o.list = false -- 启用不可见字符显示
vim.o.listchars = "space:·"   -- 把空格显示为点

-- 补全增强
vim.o.wildmenu = true  -- 启用命令行补全菜单

-- Don't pass message to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'  -- 设置简短消息选项，避免显示过多信息

-- 补全最多显示10行
vim.o.pumheight = 10  -- 设置补全菜单最多显示10行

-- 永远显示tabline
vim.o.showtabline = 2  -- 始终显示标签栏

-- 使用增强状态栏插件  
-- 底部会以文本方式显示当前模式如： -- INSERT -- ， -- VISUAL --后不在需要vim的模式提示
-- 关闭后 用插件代替
vim.o.showmode = false


-- treesitter
-- 代码折叠
-- 开启 Folding 模块
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99

