if [ -n "$ZSH_VERSION" ]; then
  _shell=zsh
else
  _shell=bash
fi

if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate "$_shell")"
  # shim 経由だと、版が未インストールのときシェル起動中に自動インストールが走る
  _starship="$(mise which starship 2>/dev/null)"
else
  _starship="$(command -v starship)"
fi

if [ -n "$_starship" ]; then
  eval "$("$_starship" init "$_shell")"
fi

unset _shell _starship

source "$DOTFILES/common/aliases.sh"
