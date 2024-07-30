-- 快速跳跃任意位置
return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = require("keybindings").flashMap,
    -- keys = {
    --     { "f",         mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    --     { "S",         mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    --     -- 下面几个没搞懂
    --     { "r",         mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    --     { "R",         mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    --     { "<leader>s", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    -- },
    config = function()
        require("flash").setup({
            modes = {
                char = {
                    -- by default all keymaps are enabled, but you can disable some of them,
                    -- by removing them from the list.
                    -- If you rather use another key, you can map them
                    -- to something else, e.g., { [";"] = "L", [","] = H }
                    -- keys = { ["f"]="s", "F", "t", "T", ";", "," },
                    keys = { "t", "T", ";", "," },  --取消f功能 用s代替
                    jump_labels = false,  -- true: f t跳转时 后续字母会变化
                }
            }
        })
    end
}
