return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',

        -- For vsnip users.
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',

        -- For luasnip users.
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',

        -- For ultisnips users.
        -- Plug 'SirVer/ultisnips',
        -- Plug 'quangnguyen30192/cmp-nvim-ultisnips',

        -- For snippy users.
        -- Plug 'dcampos/nvim-snippy',
        -- Plug 'dcampos/cmp-snippy',

        -- 常见编程语言代码段
        'rafamadriz/friendly-snippets',
    },
    config = function()
        local cmp = require 'cmp'

        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            experimental = {
                ghost_text = true,
            },
            -- 快捷键设置
            mapping = require("keybindings").nvimCmp(cmp),
            -- mapping = cmp.mapping.preset.insert({
            --     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            --     ['<C-f>'] = cmp.mapping.scroll_docs(4),
            --     ['<C-Space>'] = cmp.mapping.complete(),
            --     ['<C-e>'] = cmp.mapping.abort(),
            --     ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            -- }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'vsnip' }, -- For vsnip users.
                { name = 'path' },
                -- { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
            }, {
                { name = 'buffer' },
            }),

            -- 这块官方没有 从别的文章里复制来的 和telescope的format有何区别？
            formatting = {
                -- Set order from left to right
                -- kind: single letter indicating the type of completion
                -- abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
                -- menu: extra text for the popup menu, displayed after "word" or "abbr"
                fields = { 'abbr', 'menu' },

                -- customize the appearance of the completion menu
                format = function(entry, vim_item)
                    vim_item.menu = ({
                        nvim_lsp = '[Lsp]',
                        -- luasnip = '[Luasnip]',
                        buffer = '[File]',
                        path = '[Path]',
                    })[entry.source.name]
                    return vim_item
                end,
            },
        })

        -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
        -- Set configuration for specific filetype.
        --[[ cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'git' },
            }, {
                { name = 'buffer' },
            })
        })
        require("cmp_git").setup() ]] --

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })

        -- 这部分移入lsp中  做什么用的？
        -- Set up lspconfig.
        -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
        -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
        --     capabilities = capabilities
        -- }
    end,
}
