# 既にあるパスは動かさない。入れ子のシェルで、親の mise が先頭に置いたツールより前に出さないため
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
