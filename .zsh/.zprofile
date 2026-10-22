# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# ssh-agent はログインごとに増やさず、起動済みがあればそれに繋ぐ
if [ -z "$SSH_AUTH_SOCK" ]; then
  RUNNING_AGENT="$(ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]')"
  if [ "$RUNNING_AGENT" = "0" ]; then
    ssh-agent -s &> "$HOME/.ssh/ssh-agent"
  fi
  eval "$(cat "$HOME/.ssh/ssh-agent")" > /dev/null
  ssh-add "$HOME/.ssh/github_rsa" 2> /dev/null
fi
