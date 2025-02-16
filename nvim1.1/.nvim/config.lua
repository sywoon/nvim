require'nvim-tree'.setup {
  filters = {
    dotfiles = false,  --true会隐藏所有.开头的文件夹
    -- 注意：custom配置的规则 猜测是string.match 
    --    因为.git会过滤掉.gitignore文件 src/db/git/文件夹(.被当做任意字符)
    -- 1. db会过滤掉所有db文件夹
    --   db/无效 
    --   db\\会过滤内部文件，但保留空壳文件夹
    --   .\\db 无效  
    --   ./db 无效  
    --   ^db$ 都消失
    --   ^db 无效 根目录和子目录都会过滤掉  为何子目录也会？按文件夹名过滤的？
    --   ^db/ 无效 因为windows路径中没有/符号
    --   ^db\\  外层空格 内部保留  inuse  不够完美
    --  解决: ^db\\ 会过滤掉根目录下的db文件夹 但会保留src\base\db文件夹
    --   .log竟然会过滤掉src/base/logs文件夹 bug？
    custom = { '^node_modules$', '^.git$', '^.laya$', '%.meta$' }
  }
}

require'telescope'.setup {
  defaults = {
    -- 注意:windows中 若只需过滤根目录文件夹 可以使用'\\'结尾 不能用'/'结尾
    --   db\\会过滤src\base\bd\文件夹 所以它是用关键字来过滤路径的
    --   采用lua的正则表达式 ^db\\ 会过滤掉根目录下的db文件夹 但会保留src\base\db文件夹
    file_ignore_patterns = {
        '^node_modules$', '^.git$', '^.laya$', '^bin\\',
        '^tools\\', '^db\\', '^docs\\', '^assets\\',
        '%.meta$',
    }
  }
}

