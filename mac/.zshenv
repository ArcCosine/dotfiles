#= = = = = = = = = = = = = = = = = = = = = = = = = = = = 
# rbenv
#= = = = = = = = = = = = = = = = = = = = = = = = = = = = 
if [ -d ${HOME}/.rbenv  ] ; then
	PATH=${HOME}/.rbenv/bin:${PATH}
	export PATH
	eval "$(rbenv init -)"
fi

# set ip address
ruby ~/zshscript/htaccess.rb
