# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# small prompt
PS1='lapto\$ '

[ -f ~/.bash_functions ] && . ~/.bash_functions

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

[ -f ~/.bash_env ] && . ~/.bash_env


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
