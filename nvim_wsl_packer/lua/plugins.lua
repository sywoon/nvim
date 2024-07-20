local packer = require("packer")
packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use 'wbthomason/packer.nvim'
        -- 你的插件列表...
        --------------------- colorschemes begin--------------------
        -- tokyonight
        use("folke/tokyonight.nvim")
        use { 'catppuccin/nvim' }
        -- OceanicNext
        use("mhartington/oceanic-next")
        -- gruvbox
        use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
        -- zephyr 暂时不推荐，详见上边解释
        -- use("glepnir/zephyr-nvim")
        -- nord
        use("shaunsingh/nord.nvim")
        -- onedark
        use("ful1e5/onedark.nvim")
        -- nightfox
        use("EdenEast/nightfox.nvim")
        --------------------- colorschemes end--------------------

        -- nvim-tree
        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
        -- bufferline
        use({
            "akinsho/bufferline.nvim",
            requires = {
                "kyazdani42/nvim-web-devicons", "moll/vim-bbye"
            }
        })
        -- lualine
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
        use("arkav/lualine-lsp-progress")
        --barbecue
        use({
            "utilyre/barbecue.nvim",
            requires = {
                "SmiteshP/nvim-navic",
                "nvim-tree/nvim-web-devicons", -- optional dependency
            },
            config = function()
                require('barbecue').setup({})
            end

        })
        -- blankline 函数前的竖线
        use "lukas-reineke/indent-blankline.nvim"
        -- telescope
        use { 'nvim-telescope/telescope-fzf-native.nvim', 
            run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' 
        }
        use { 'nvim-telescope/telescope.nvim', requires = {
            "nvim-lua/plenary.nvim",
            "LinArcX/telescope-env.nvim",
            'nvim-telescope/telescope-fzf-native.nvim',
        } }
        -- telescope extensions
        use "LinArcX/telescope-env.nvim"
        -- dashboard-nvim
        -- use("glepnir/dashboard-nvim")
        use { "nvimdev/dashboard-nvim", requires = { 'nvim-tree/nvim-web-devicons' } }
        -- project
        use("ahmedkhalf/project.nvim")
        -- treesitter
        use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

        --------------------- LSP --------------------
        use({ "neovim/nvim-lspconfig" })
        use({ "williamboman/mason.nvim" })
        use({ "williamboman/mason-lspconfig.nvim" })

        --------------------- cmp --------------------
        use({ "hrsh7th/nvim-cmp" })

        use({ 'hrsh7th/cmp-nvim-lsp' })
        use({ 'hrsh7th/cmp-buffer' })
        use({ 'hrsh7th/cmp-path' })
        use({ 'hrsh7th/cmp-cmdline' })
        use({ 'hrsh7th/cmp-vsnip' })
        use({ 'hrsh7th/vim-vsnip' })
        -- 常见编程语言代码段
        use({ 'rafamadriz/friendly-snippets' })

        --------------------- lsp saga --------------------
        use({
            "nvimdev/lspsaga.nvim",
            requires = {
                'nvim-treesitter/nvim-treesitter', -- optional
                'nvim-tree/nvim-web-devicons',     -- optional
            },
            config = function()
                require('lspsaga').setup({})
            end

        })

        use "github/copilot.vim" --Copilot Install

        --------------------- others --------------------
        use {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = function()
                require("nvim-autopairs").setup {}
            end
        }
        use({ 'mg979/vim-visual-multi' }) --模拟vsc的ctrl+d多选
        -- "tpope/vim-commentary",     --模拟vsc的ctrl+/注释
        use({ "numToStr/Comment.nvim" })

        -- 为 neovim 内置 lsp 添加类似 vscode 的象形图
        -- 美化各种lsp的窗口提示 比如重命名 语法纠正等
        use({ 'onsails/lspkind-nvim' })
        use({ 'rainbowhxch/accelerated-jk.nvim' })
        -------------------------------------------------------
    end,
    config = {
        display = { --以浮动窗口打开安装列表
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
    vim.cmd,
    [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]
)
