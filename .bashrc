# bootstraps shell environment

if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# load environment
source $HOME/.menv

# load locals, if present
if [ -f $HOME/.locals ]; then
    source $HOME/.locals
fi
