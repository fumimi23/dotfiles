# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# /etc/zprofile の path_helper が /usr/bin を前に並べ直すので、GNU grep を先頭へ移し直す（path_prepend は既にあるパスを動かさないので使えない）
gnubin=/opt/homebrew/opt/grep/libexec/gnubin
path=($gnubin ${path:#$gnubin})
unset gnubin
