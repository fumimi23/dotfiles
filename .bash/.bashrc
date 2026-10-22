DOTFILES="${BASHDOTDIR%/*}"

# mise の置き場所。~/.profile が足すのはログインシェルだけなので、非ログインの対話シェルでも見つかるようにする
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) export PATH="$HOME/.local/bin:$PATH" ;;
esac

source "$DOTFILES/common/env.sh"
source "$DOTFILES/common/init.sh"
