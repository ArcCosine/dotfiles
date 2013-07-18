#文字コードの設定
export LANG=ja_JP.UTF-8


# ヒストリの設定
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

autoload -Uz compinit
compinit
autoload colors
colors

# alias
alias ls='ls -pla'
#alias tmux='env LD_LIBRARY_PATH=~/opt/libevent/lib ~/opt/tmux/bin/tmux'

alias ping='cocot ping'
alias ifconfig="cocot ipconfig"
alias ping="cocot ping"
alias arp="cocot arp"
alias nslookup="cocot nslookup"
alias traceroute="cocot tracert"
alias route="cocot route"
alias netstat="cocot netstat" 

# like vim
bindkey -v


# history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# aut cd
setopt auto_cd
setopt auto_pushd

# editor
export EDITOR=vim

#autojump
alias j="autojump"
[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && source ~/.autojump/etc/profile.d/autojump.zsh

# for ant
export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH
export ANT_HOME=~/ant
export PATH=$ANT_HOME/bin:$PATH

#for srcreen
export TERM=xterm-256color screen

set CYGWIN=server

setopt prompt_subst
 
df=`df -h ~/|tail -n 1`
df=`echo "a$df"|awk '{printf"disk use: %s / %s", $3, $2}'`
RPROMPT='$df'
