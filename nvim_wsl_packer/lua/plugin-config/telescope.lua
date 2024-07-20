local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("没有找到 telescope")
  return
end

telescope.setup({
  defaults = {
    -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
    initial_mode = "insert",
    -- 窗口内快捷键
    mappings = require("keybindings").telescopeList,
  },
  pickers = {
    -- 内置 pickers 配置
    find_files = {
      -- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
      -- theme = "ivy", 
    }
  },
  extensions = {
     -- 扩展插件配置
                fzf = {
                    fuzzy = true,                    -- false will only do exact matching
                    override_generic_sorter = true,  -- override the generic sorter
                    override_file_sorter = true,     -- override the file sorter
                    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                                -- the default case_mode is "smart_case"
                }
  },
})


-- telescope extensions
        pcall(telescope.load_extension, "env")
        require('telescope').load_extension('fzf')
        
        -- 使用keybinding代替 这里保留参考
        -- local builtin = require('telescope.builtin')
        -- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        -- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        -- vim.keymap.set('n', '<leader><space>', builtin.buffers, {})
        -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        -- vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
        -- vim.keymap.set('n', '<leader>/', function()
        --     -- You can pass additional configuration to telescope to change theme, layout, etc.
        --     require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        --         winblend = 10,
        --         previewer = false,
        --     })
        -- end, { desc = '[/] Fuzzily search in current buffer' })