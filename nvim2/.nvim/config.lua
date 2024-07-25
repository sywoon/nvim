require'nvim-tree'.setup {
  filters = {
    dotfiles = false,  --true会隐藏所有.开头的文件夹
    custom = { 'node_modules', '.git', '.laya', 'bin', 'tools', '.log', 'pack' }
  }
}

require'telescope'.setup {
  defaults = {
    file_ignore_patterns = { 'node_modules', '.git', '.laya', 'bin', 'tools', '.log', 'docs' }
  }
}

