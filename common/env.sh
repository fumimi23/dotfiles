# mise と claude の実体は ~/.local/bin にある。Ubuntu の ~/.profile は ~/.bashrc を読んだ後に
# ~/.local/bin を足すのでログインシェルでも間に合わず、zsh 側は誰も足さない。
# .zshenv は非対話シェルでも毎回読まれるため、重複して伸びないようガードする
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) export PATH="$HOME/.local/bin:$PATH" ;;
esac

export STARSHIP_CONFIG="$DOTFILES/starship.toml"
export MISE_GLOBAL_CONFIG_FILE="$DOTFILES/mise/global.toml"
