#if [ -t 1 ]; then
#	exec zsh
#fi

if type nvim > /dev/null 2>&1; then
  alias vi='nvim'
fi

