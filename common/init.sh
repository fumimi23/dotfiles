# $SHELL はログインシェルを指すので、実行中のシェルは変数で判定する
if [ -n "$ZSH_VERSION" ]; then
  _shell=zsh
else
  _shell=bash
fi

# mise
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate "$_shell")"
fi

# starship
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init "$_shell")"
fi

unset _shell

# alias
source "$DOTFILES/common/aliases.sh"
