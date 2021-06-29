export HOMEBREW_CELLAR="$HOME/.linuxbrew/Cellar"
export MANPATH="$HOME/.linuxbrew/share/man${MANPATH+:$MANPATH}:"
export HOMEBREW_REPOSITORY="$HOME/.linuxbrew/Homebrew"
export HOMEBREW_PREFIX="$HOME/.linuxbrew"
export INFOPATH="$HOME/.linuxbrew/share/info:${INFOPATH:-}"
export PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig/"

export PATH="$PATH:$HOMEBREW_PREFIX/bin"
export PATH="$PATH:$HOMEBREW_PREFIX/sbin"
export PATH="$PATH:$HOME/.fnm"
export PATH="$PATH:$HOME/.cargo/bin"

alias ,="cd"
alias ,_="cd $_"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../../"
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias c="clip.exe"
alias cr="cp -r"
alias dc="docker-compose"
alias dk="docker"
alias del="rm"
alias g="git"
alias h="history"
alias l="exa -F"
alias la="exa -A"
alias ll="exa -alF --git"
alias lll="exa -alF --git -s=mod --time-style=long-iso"
alias f="fd"
alias gr="rg"
alias o="explorer.exe"
alias oo="explorer.exe ."
alias p="bat"
alias procon="cargo compete"
alias rm="rip"
alias sz="source $HOME/.zshrc"
alias t="tmux"
alias top="top"
alias ps="procs"
alias vi="vim"


