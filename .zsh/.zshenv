DOTFILES="${ZDOTDIR%/*}"
source "$DOTFILES/common/env.sh"

# homebrew
path_prepend /opt/homebrew/bin
path_prepend /opt/homebrew/opt/grep/libexec/gnubin

# devcontainer CLI は VS Code 拡張が globalStorage 配下に置くので、通常の bin には無い
path_prepend "$HOME/Library/Application Support/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin"
