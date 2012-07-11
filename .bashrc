# bootstraps shell environment

if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# load environment
source $HOME/.menv

# load locals, if present
if [ ! -z $ENV_LOCAL ] && [ -e $ENV_LOCAL ]; then
    source $ENV_LOCAL
fi
