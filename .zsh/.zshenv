DOTFILES="${ZDOTDIR%/*}"
source "$DOTFILES/common/env.sh"

# homebrew
export PATH="/opt/homebrew/bin:$PATH"
PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"

# devcontainer CLI は VS Code 拡張が globalStorage 配下に置くので、通常の bin には無い
export PATH="$HOME/Library/Application Support/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin:$PATH"
