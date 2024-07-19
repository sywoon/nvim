require'nvim-tree'.setup {
  filters = {
    dotfiles = false,  --true会隐藏所有.开头的文件夹
    custom = { 'node_modules', '.git', 'pack', '.log' }
  }
}

