# bootstraps shell environment

if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# load environment
source $HOME/.menv
