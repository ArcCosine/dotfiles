#change la_JP.UTF-8
export LANG=ja_JP.UTF-8

#set prompt
PROMPT="%m:%n%% "
RPROMPT="[%~]"
SPROMPT="correct: %R -> %r ? "

#vilike
bindkey -v

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

## Completion configuration
#
autoload -U compinit
compinit

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

#set vim alias
alias vim=/opt/local/bin/vim

#set svn editor
export SVN_EDITOR=vim
export GIT_EDITORA=vim

#alias
alias ls='gls -v --color=auto'

PATH=$HOME/bin:/opt/local/bin:/opt/local/sbin:/opt/local/lib/php/pear/bin:/usr/local/bin:/usr/local:$PATH
export MANPATH=/opt/local/share/man:$MANPATH  #for macports

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM

# for tmux
if [ -z "$TMUX" -a -z "$STY" ]; then
	if type tmuxx >/dev/null 2>&1; then
		tmuxx
	elif type tmux >/dev/null 2>&1; then
		if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
			tmux attach && echo "tmux attached session "
		else
			tmux new-session && echo "tmux created new session"
		fi
	fi
fi

#for sudo.vim
sudo() {
  local args
  case $1 in
    vi|vim)
      args=()
      for arg in $@[2,-1]
      do
        if [ $arg[1] = '-' ]; then
          args[$(( 1+$#args ))]=$arg
        else
          args[$(( 1+$#args ))]="sudo:$arg"
        fi
      done
      command vim $args
      ;;
    *)
      command sudo $@
      ;;
  esac
}

# for cdd
source ~/zshscript/cdd
function chpwd() {
	_reg_pwd_screennum
}

#for term color
alias ssh='TERM=xterm ssh'


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
