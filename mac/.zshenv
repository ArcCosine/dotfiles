#= = = = = = = = = = = = = = = = = = = = = = = = = = = = 
# rbenv
#= = = = = = = = = = = = = = = = = = = = = = = = = = = = 
if [ -d ${HOME}/.rbenv  ] ; then
	PATH=${HOME}/.rbenv/bin:${PATH}
	export PATH
	eval "$(rbenv init -)"
fi

PATH=${HOME}/.rvm/bin:${PATH} # Add RVM to PATH for scripting

# set ip address
ruby ~/zshscript/htaccess.rb
