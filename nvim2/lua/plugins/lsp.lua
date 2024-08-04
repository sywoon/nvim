-- require "lsp.ui"

return {
    "neovim/nvim-lspconfig",
    cmd = { "Mason", "Neoconf" },
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- "hrsh7th/cmp-nvim-lsp",  独立出去
    },
    config = function()
        -- 安装列表
        -- { key: 语言 value: 配置文件 }
        -- key 必须为下列网址列出的名称
        -- https://github.com/williamboman/nvim-lsp-installer#available-lsps
        local servers = {
            lua_ls = require("lsp.lua"), -- lua/lsp/lua.lua
            pylsp = require("lsp.python"),
            tsserver = require ("lsp.typescript"),
            eslint = {},
            html = require ("lsp.html"),
            cssls = require ("lsp.css"),
            remark_ls = require ("lsp.remark"),
            clangd = require ("lsp.clangd"),
        }
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
        require("mason-lspconfig").setup({
            -- 确保安装，根据需要填写
            -- ensure_installed = { "lua_ls", "pylsp", },
            ensure_installed = vim.tbl_keys(servers),
        })

        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        for name, svrCfg in pairs(servers) do
            -- 第一版本 所有语言一个配置
            -- lspconfig[name].setup({
            --     on_attach = require('keybindings').mapLSP
            --     -- on_attach = on_attach,
            -- })
            -- 第二版本 所有语言都独立配置
            -- lspconfig[name].setup(svrCfg)
            -- 第三版本 公共部分保留 具体语言配置 只存放个性化部分
            lspconfig[name].setup(
                --keep:后续表相同key不会覆盖之前的值
                --force:后续表相同key会覆盖之前的值
                vim.tbl_deep_extend("force",
                    {
                        -- LSP 客户端连接到缓冲区时调用的函数
                        on_attach = require('keybindings').mapLSP,
                        capabilities = capabilities
                    },
                    svrCfg
                )
            )
        end
    end
}

