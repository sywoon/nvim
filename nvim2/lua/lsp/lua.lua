return {
    -- on_attach = require('keybindings').mapLSP
    settings = {
        Lua = {
            runtime = {
                -- 告诉 Lua 解释器你是使用的 LuaJIT 版本（大多数 Neovim 安装默认使用 LuaJIT）
                version = 'LuaJIT',
            },
            diagnostics = {
                -- 获取 Neovim 的全局变量
                globals = {'vim'},
            },
            workspace = {
                -- 使语言服务器意识到 Neovim 运行时文件的位置
                library = vim.api.nvim_get_runtime_file("", true),
                -- 禁用工作区检查
                checkThirdParty = false,
            },
            -- 禁用 telemetry 数据发送
            telemetry = {
                enable = false,
            },
        },
    }
}
