return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    dependencies = {
        -- "nvim-treesitter/playground",
        -- "nvim-treesitter/nvim-treesitter-textobjects",
    },
    main = "nvim-treesitter.configs",
    build = ":TSUpdate",
    config = function()
        local status, treesitter = pcall(require, "nvim-treesitter.configs")
        if not status then
            vim.notify("没有找到 nvim-treesitter")
            return
        end

        treesitter.setup({
            -- 安装 language parser
            -- :TSInstallInfo 命令查看支持的语言
            ensure_installed = { "json", "html", "css", "vim", "lua", "javascript", "typescript", "tsx" },
            -- 启用代码高亮模块
            highlight = {
                enable = true,
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },

            -- 启用增量选择模块
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",
                    node_incremental = "<CR>",
                    node_decremental = "<BS>",
                    scope_incremental = "<TAB>",
                },
                -- 启用代码缩进模块 (=)  默认已开启，可以不用配置
                indent = {
                    enable = true,
                },
            },
        })
    end,
}



-- 代码折叠
-- 开启 Folding 模块
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.nofoldenable         -- Disable folding at startup.
-- -- 默认不要折叠
-- -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
-- vim.opt.foldlevel = 99

