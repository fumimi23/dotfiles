# $SHELL はログインシェルを指すので、実行中のシェルは変数で判定する
if [ -n "$ZSH_VERSION" ]; then
  _shell=zsh
else
  _shell=bash
fi

if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate "$_shell")"
  # shim 経由で呼ぶと、mise/global.toml の版が未インストールのときシェル起動中に自動インストールが走る。
  # 実体が無ければ starship は諦め、素のプロンプトで起動する
  _starship="$(mise which starship 2>/dev/null)"
else
  _starship="$(command -v starship)"
fi

if [ -n "$_starship" ]; then
  eval "$("$_starship" init "$_shell")"
fi

unset _shell _starship

source "$DOTFILES/common/aliases.sh"
