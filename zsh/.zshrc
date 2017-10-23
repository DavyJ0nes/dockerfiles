########## ZSHRC ##########
######## DavyJ0nes ########


#### ZSH Config ####
export ZSH=$HOME/.oh-my-zsh
export LC_ALL="en_US.UTF-8"
ZSH_THEME="simple"
plugins=(git zsh-syntax-highlighting)

#### PATH export ####

export GOPATH=$HOME/go
export PATH="/sbin:/usr/local/bin:/usr/sbin:/bin:/usr/bin:/usr/local/games:/usr/games:/usr/local/go/bin:$HOME/bin:$GOPATH/bin"
export TERM="xterm-256color"

#### Custom env exports ####
export EDITOR='vim'

#### Other scripts to source ####
source $ZSH/oh-my-zsh.sh

#### Aliases ####
alias c="pygmentize -O style=native -f console256 -g"
alias cp="cp -iv"
alias rm="rm -iv"
alias mv="mv -iv"
alias du="du -cksh"
alias df="df -h"
alias rgrep="grep -r"
alias pse='ps -eo pid,ppid,pcpu,args'
alias pingg="ping 8.8.8.8"
alias grepip="grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'"
alias tree="tree -L 4"
# alias curl="curl 2>/dev/null"
# linux related
# alias pbcopy="xclip -sel clip"
# alias open="xdg-open"
# git
alias gpom="git push origin $(gb | grep '^*' | sed 's/* //')"
alias gst="git status"
alias gl="git log"
# Ansible
alias a="ansible -i hosts"
alias play="ansible-playbook"
alias getip="wget http://ipinfo.io/ip -qO -"

#### Custom Functions ####
# Misc commands that don't warrant being in ~/bin
function rant() {
  echo $1 > /dev/null
  echo "Rant over, go for a walk!"
}

function note() {
  echo "$1 \n" >> ~/.notes
}
