local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  -- vim.keymap.set('n', '<leader>e',  api.tree.toggle,                  opts('Toggle')) ��Ч ����ʹ��NvimTreeToggle���� 
end

return { 
    "kyazdani42/nvim-tree.lua", 
    -- event = "VimEnter", 
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    }, 
    config = function ()
        require("nvim-tree").setup({
            on_attach = my_on_attach,
            sort = {
                sorter = "case_sensitive",
            },
            view = {
		-- �ļ������չʾλ�ã���ࣺleft, �Ҳࣺright
		side = "left",
		-- �к��Ƿ���ʾ
		number = false,
		relativenumber = false,
		signcolumn = "yes", -- ��ʾͼ��
                width = 30,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true, -- ���� dotfile
		custom = { "node_modules" }, -- ��������Ŀ¼
            },
	    -- �Ƿ���ʾ git ״̬
	    git = {
		enable = false,
	    },
        })
    end
}
