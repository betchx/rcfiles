
alias ls='ls -hF --color=none --show-control-chars' # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

alias up='cd ..'
alias back='cd "$OLDPWD"'
alias lsn='ls | cat -n'

alias dl="find . -maxdepth 1 -type d | sed 1d | sed 's/\\.\\///'"
alias how="du -S * | sort -nr | head "

alias disp='export DISPLAY=localhost:0.0'

case `uname` in
  CYGWIN*)
    alias s=cygstart
    ;;
  MINGW*)
    alias s=start
    ;;
esac


# Default to human readable figures
alias df='df -h'
alias du='du -h'

# use vim instead of vi
alias vi=vim

