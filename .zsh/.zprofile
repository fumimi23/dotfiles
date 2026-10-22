# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# ssh-agent はログインごとに増やさず、起動済みがあればそれに繋ぐ。
# 生死はプロセス数ではなく接続できるかで判定する（ssh-add -l は接続できないと 2、鍵が無いと 1 を返す）
if [ -z "$SSH_AUTH_SOCK" ]; then
  if [ -f "$HOME/.ssh/ssh-agent" ]; then
    source "$HOME/.ssh/ssh-agent" > /dev/null
  fi
  ssh-add -l > /dev/null 2>&1
  if [ $? -eq 2 ]; then
    mkdir -p -m 700 "$HOME/.ssh"
    (umask 077; ssh-agent -s > "$HOME/.ssh/ssh-agent")
    source "$HOME/.ssh/ssh-agent" > /dev/null
  fi
  if ! ssh-add -l > /dev/null 2>&1; then
    ssh-add "$HOME/.ssh/github_rsa" 2> /dev/null
  fi
fi
