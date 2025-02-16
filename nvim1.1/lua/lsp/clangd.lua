return {
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
    init_options = {
        clangdfilestatus = true,
        useplaceholders = true,
        completeunimported = true,
        semantichighlighting = true,
    },
    settings = {
        clangd = {
            fallbackflags = { "-std=c++17" },
        },
    },
    on_attach = function(client, bufnr)
        -- vim.notify("clangd attached", vim.log.levels.info)

        -- 设置缩进为4个空格  有效果 会覆盖ftplugin/cpp.lua中的设置 但对leader-f无效
        -- vim.api.nvim_buf_set_option(bufnr, "shiftwidth", 4)
        -- vim.api.nvim_buf_set_option(bufnr, "softtabstop", 4)
        -- vim.api.nvim_buf_set_option(bufnr, "expandtab", true)

        require('keybindings').maplsp(client, bufnr)
    end
}
