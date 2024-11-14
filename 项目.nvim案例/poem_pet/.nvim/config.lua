require 'nvim-tree'.setup {
    -- 不显示 git 状态图标
    git = {
        enable = false,
    },
    -- project.nvim plugin 需要这样设置
    respect_buf_cwd = true,
    update_cwd = true,
    sync_root_with_cwd = true,
    update_focused_file = {
        enable = true,                  -- 启用自动更新聚焦文件
        update_cwd = false,             -- 更新工作目录为当前文件目录
        ignore_list = {},               -- 忽略更新焦点的文件列表
    },
    -- 隐藏 .文件 和 node_modules 文件夹
  filters = {
    dotfiles = false, --true会隐藏所有.开头的文件夹
    custom = { 'node_modules', '.git', '.laya', 'assets', '.ts.meta', '.js.meta' }
  }
}


require'telescope'.setup {
  defaults = {
    file_ignore_patterns = {
        'node_modules', '.git', '.laya', '^bin\\',
        '^tools\\', '^db\\', '^docs\\', '^assets\\',
        ".meta",
    }
  }
}


