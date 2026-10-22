# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# /etc/zprofile の path_helper が /usr/bin を前に並べ直すので、GNU grep を先頭へ移し直す。
# path_prepend は既にあるパスを動かさないため、ここで移しておかないと入れ子のシェルも BSD grep のままになる
gnubin=/opt/homebrew/opt/grep/libexec/gnubin
path=($gnubin ${path:#$gnubin})
unset gnubin

# ssh-agent はログインごとに増やさず、起動済みがあればそれに繋ぐ。
# 状態ファイルは停止済みや別のエージェントを指すことがあるので、接続できるかで判定する
# （ssh-add -l は接続できないと 2、鍵が無いと 1 を返す）
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
