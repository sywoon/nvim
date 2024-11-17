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
local mapex = vim.keymap.set --支持多种模式
local opt = { noremap = true, silent = true }

-- 取消<CR>默认功能
-- map("n", "<CR>", "", opt)  --有bug 会影响flash的f功能

-- 取消 s 默认功能
map("n", "s", "", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
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
map("n", "<leader>t", ":vsp | terminal<CR>", opt)
map("n", "<leader>ht", ":sp | terminal<CR>", opt)
-- map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

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
--map("n", "qq", ":q!<CR>", opt)
--map("n", "Q", ":qa!<CR>", opt)
map("n", "qq", ":wq<CR>", opt)
mapex({ "n", "i", "v" }, "<C-s>", "<ESC>:w<CR>")

-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)
map("i", "<C-j>", "<ESC>o", opt)
map("i", "<C-k>", "<ESC>O", opt)

map("i", "jk", "<ESC>", opt)
map("n", "<C-a>", "ggVG", opt)

-- nvim默认支持ctrl-v来复制 资产niv模式
-- Ctrl-c复制选中内容 鼠标双击也能选中
map("v", "<C-c>", "y", opt)
map("n", "<C-z>", "u", opt)
map("i", "<C-z>", "<ESC>u", opt)

-- 跳函数
map("n", "<C-[>", "[m", opt)
map("n", "<C-]>", "]m", opt)

-- 无效 会和搜索/功能冲突; 无论换什么键 都无效
-- map("n", "<C-\\>", "gcc", opt)
-- mapex({ "n", "v" }, "<C-\\>", "gcc")




-- 第三方插件快捷键

-- nvimTree
-- alt + m 键打开关闭tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)

-- bufferline
-- 左右Tab切换
--map("n", "<C-h>", ":bp<cr>", opt)
--map("n", "<C-l>", ":bn<cr>", opt)
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

-- 关闭
--"moll/vim-bbye"
map("n", "<leader>bc", ":Bdelete!<CR>", opt)
map("n", "<leader>bo", ":BufferLineCloseOthers<CR>", opt)
-- map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
-- map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
-- map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<leader>ff", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opt)
-- 查找最近打开的buffers
map("n", "<leader>fb", ":Telescope buffers<CR>", opt)
-- map("n", "<leader>fh", ":Telescope help_tags<CR>", opt)


-- treesitter
-- 格式化文件 后面被lsp.buf.format代替=leader-f
map("n", "<A-f>", "gg=G", opt)

-- "rainbowhxch/accelerated-jk.nvim",  --jk按键越久越快
map('n', 'j', '<Plug>(accelerated_jk_gj)', opt)
map('n', 'k', '<Plug>(accelerated_jk_gk)', opt)

-- projects
map('n', '<leader>fp', ':Telescope projects<CR>', opt)


-- 自定义 LazyGit 的入口
function open_lazygit()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
  lazygit:toggle()
end
map('n', '<leader>lg', ':lua open_lazygit()<CR>', opt)




local pluginKeys = {}

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
    i = {
        -- 上下移动
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Down>"] = "move_selection_next",
        ["<Up>"] = "move_selection_previous",
        -- 历史记录
        ["<C-n>"] = "cycle_history_next",
        ["<C-p>"] = "cycle_history_prev",
        -- 关闭窗口
        ["<C-c>"] = "close",
        -- 预览窗口上下滚动
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down",
    },
}

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(_, bufnr) -- _=client
    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopt = { noremap = true, silent = true, buffer = bufnr }
    -- local bufmap = function (...)
    --     vim.api.nvim_buf_set_keymap(bufnr, ...)
    -- end
    -- local bufopt = function (...)
    --     vim.api.nvim_buf_set_option(bufnr, ...)
    -- end
    local bufmap = mapex

    bufmap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", bufopt)
    bufmap("n", "<F2>", "<cmd>Lspsaga rename<CR>", bufopt)
    bufmap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopt)
    bufmap('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', bufopt)
    bufmap('n', 'gD', '<cmd>Lspsaga peek_definition<CR>', bufopt)
    bufmap("n", "gh", "<cmd>Lspsaga hover_doc<cr>", bufopt)
    bufmap("n", "gr", "<cmd>Lspsaga finder<CR>", bufopt)

    -- bufmap("n", "<F2>", vim.lsp.buf.rename, bufopts)
    -- bufmap("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    -- bufmap("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    -- bufmap('n', 'gd', vim.lsp.buf.definition, bufopts)
    -- bufmap('n', 'gh', vim.lsp.buf.hover, bufopts)
    -- bufmap('n', 'gr', vim.lsp.buf.references, bufopts)
    -- 这两个什么功能？
    -- bufmap('n', 'gD', vim.lsp.buf.declaration, bufopts)
    -- map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
    bufmap('n', 'gi', vim.lsp.buf.implementation, bufopt)
    -- bufmap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- bufmap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- bufmap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- bufmap('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
    -- bufmap('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    -- bufmap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", bufopt)
    bufmap("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
    end, bufopt)

    -- diagnostic  错误提示太长看不全
    bufmap("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopt)
    bufmap("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", bufopt)
    bufmap("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", bufopt)
    -- bufmap("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", bufopt)
    -- bufmap("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", bufopt)
    -- bufmap("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", bufopt)
end


pluginKeys.nvimCmp = function(cmp)
    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    return cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        -- 出现补全
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        -- 取消
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),

        -- Use <C-k/j> to switch in items
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --     local luasnip = require("luasnip")
        --     if cmp.visible() then
        --         cmp.select_next_item()
        --         -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
        --         -- they way you will only jump inside the snippet region
        --     elseif luasnip.expand_or_jumpable() then
        --         luasnip.expand_or_jump()
        --     elseif has_words_before() then
        --         cmp.complete()
        --     else
        --         fallback()
        --     end
        -- end, { "i", "s" }),
        --
        -- ["<S-Tab>"] = cmp.mapping(function(fallback)
        --     local luasnip = require("luasnip")
        --     if cmp.visible() then
        --         cmp.select_prev_item()
        --     elseif luasnip.jumpable(-1) then
        --         luasnip.jump(-1)
        --     else
        --         fallback()
        --     end
        -- end, { "i", "s" }),
        -- 自定义代码段跳转到下一个参数

        ["<C-l>"] = cmp.mapping(function()
            if vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            end
        end, { "s" }),

        -- 自定义代码段跳转到上一个参数
        ["<C-h>"] = cmp.mapping(function()
            if vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "s" }),

        -- Super Tab
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --         cmp.select_next_item()
        --     elseif vim.fn["vsnip#available"](1) == 1 then
        --         feedkey("<Plug>(vsnip-expand-or-jump)", "")
        --     elseif has_words_before() then
        --         cmp.complete()
        --     else
        --         fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        --     end
        -- end, { "i", "s" }),
        --
        -- ["<S-Tab>"] = cmp.mapping(function()
        --     if cmp.visible() then
        --         cmp.select_prev_item()
        --     elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        --         feedkey("<Plug>(vsnip-jump-prev)", "")
        --     end
        -- end, { "i", "s" })
        -- end of super Tab
    })
end

-- nvim-dap
pluginKeys.mapDAP = function()
    map(
        "n",
        "<leader>de",
        ":lua require'dap'.close()<CR>"
        .. ":lua require'dap'.terminate()<CR>"
        .. ":lua require'dap.repl'.close()<CR>"
        .. ":lua require'dapui'.close()<CR>"
        .. ":lua require('dap').clear_breakpoints()<CR>"
        .. "<C-w>o<CR>",
        opt
    )
    -- 配置快捷键
    map('n', '<F5>', "<cmd>lua require'dap'.continue()<CR>", opt)
    map('n', '<F10>', "<cmd>lua require'dap'.step_over()<CR>", opt)
    map('n', '<F11>', "<cmd>lua require'dap'.step_into()<CR>", opt)
    map('n', '<F12>', "<cmd>lua require'dap'.step_out()<CR>", opt)
    map('n', '<F9>', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opt)
    map('n', '<leader>db', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opt)
    map("n", "<leader>dc", "<cmd>lua require('dap').clear_breakpoints()<CR>", opt)
    -- map('n', '<leader>lp', "<cmd>lua require.dap".set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<CR>', { noremap = true, silent = true })
    map('n', '<leader>dr', '<cmd>lua require\'dap\'.repl.open()<CR>', opt)
    -- map('n', '<leader>dl', '<cmd>lua require\'dap\'.run_last()<CR>', { noremap = true, silent = true })
    -- 弹窗
    map("n", "<leader>dh", ":lua require'dapui'.eval()<CR>", opt)
end

pluginKeys.flashMap = {
    { "f",         mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    { "S",         mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    -- 下面几个没搞懂
    { "r",         mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    { "R",         mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<leader>s", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
}

return pluginKeys
