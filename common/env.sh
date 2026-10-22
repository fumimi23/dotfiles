# 既にあるパスは位置を動かさない。.zshenv は非対話の入れ子シェルでも毎回読まれるので、
# 前に足し直すと PATH が伸びるうえ、親シェルで mise が先頭に置いたツールより前に出てしまう
path_prepend() {
  case ":$PATH:" in
    *":$1:"*) ;;
    *) export PATH="$1:$PATH" ;;
  esac
}

# mise と claude の実体は ~/.local/bin にある。Ubuntu の ~/.profile は ~/.bashrc を読んだ後に
# ~/.local/bin を足すのでログインシェルでも間に合わず、zsh 側は誰も足さない
path_prepend "$HOME/.local/bin"

export STARSHIP_CONFIG="$DOTFILES/starship.toml"
export MISE_GLOBAL_CONFIG_FILE="$DOTFILES/mise/global.toml"
