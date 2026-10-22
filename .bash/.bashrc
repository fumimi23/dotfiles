DOTFILES="${BASHDOTDIR%/*}"

# mise の置き場所。Ubuntu の ~/.profile は ~/.bashrc を読んだ後で ~/.local/bin を足すので、ログインシェルでもここで足す必要がある
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) export PATH="$HOME/.local/bin:$PATH" ;;
esac

source "$DOTFILES/common/env.sh"
source "$DOTFILES/common/init.sh"
