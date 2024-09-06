return {
    "ahmedkhalf/project.nvim",
    config = function()
        local status, project = pcall(require, "project_nvim")
        if not status then
            vim.notify("没有找到 project_nvim")
            return
        end

        -- nvim-tree 支持
        vim.g.nvim_tree_respect_buf_cwd = 1

        project.setup({
            -- using `:ProjectRoot` command  会将tree切换到工程目录
            manual_mode = true,  --改为手动模式 否则内嵌的git子目录会消失 或者子目录中打开自动跳转到父目录
            detection_methods = { "lsp", "pattern" },
            patterns = {
                ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".sln"
            },
            ignore_lsp = {},
            -- Ex: { "~/.cargo/*", ... }
            exclude_dirs = {},
            show_hidden = false,
            silent_chdir = true,
            scope_chdir = 'global',
            datapath = vim.fn.stdpath("data"),
        })

        local status, telescope = pcall(require, "telescope")
        if not status then
            vim.notify("没有找到 telescope")
            return
        end
        pcall(telescope.load_extension, "projects")


        -- 自动加载项目配置 让不同的项目可以有不同的配置
        local function load_project_config()
            local project_config_path = vim.fn.getcwd() .. '/.nvim/config.lua'
            if vim.fn.filereadable(project_config_path) == 1 then
                dofile(project_config_path)
            end
        end

        -- 在进入项目时加载配置
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = load_project_config
        })

        -- 在切换目录时加载配置
        vim.api.nvim_create_autocmd("DirChanged", {
            callback = load_project_config
        })
    end
}
