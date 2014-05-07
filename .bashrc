# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific aliases and functions

alias c="clear"
alias s="sudo"
alias gb="git branch"
alias gs="git status"
alias co="git checkout"
alias gd="git diff"
alias gl="git log"
alias ga="git add"
alias gc="git commit"
alias st="git stash"
alias gm="git merge"
alias vi="vim"
alias home="cd /home/ppanaligan"
alias la="ll -a"
alias up="cd .."
alias gunstage="git reset HEAD ."

function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function current_repository() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

# these aliases take advantage of the previous function
alias ggpull='git pull origin $(current_branch)'
alias ggpur='git pull --rebase origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

parse_git_dirty() {
  if [[ -d .git ]]; then
    [[ $(git status | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "⚡"
  fi
}

export PS1="\[\e[00;32m\]\u\[\e[0m\]\[\e[00;36m\]@\H\[\e[0m\]\[\e[00;35m\] \w\[\e[0m\]\[\e[00;37m\] [\[\e[0m\]\[\e[00;33m\]\t\[\e[0m\]\[\e[00;37m\]] \$(parse_git_branch) \$(parse_git_dirty)\n > \[\e[0m\]"
