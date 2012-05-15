if [ -d ~/bin ]; then
	export PATH=:~/bin:$PATH  # add your bin folder to the path, if you have it.  It's a good place to add all your scripts
fi

if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
. `brew --prefix`/etc/bash_completion
fi

# Colorize the Terminal
export CLICOLOR=1;

[[ -s "/Users/tud/.rvm/scripts/rvm" ]] && source "/Users/tud/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# Setup some colors to use later in interactive shell or scripts
export COLOR_NC='\033[0m' # No Color
export COLOR_WHITE='\033[1;37m'
export COLOR_BLACK='\033[0;30m'
export COLOR_BLUE='\033[0;34m'
export COLOR_LIGHT_BLUE='\033[1;34m'
export COLOR_GREEN='\033[0;32m'
export COLOR_LIGHT_GREEN='\033[1;32m'
export COLOR_CYAN='\033[0;36m'
export COLOR_LIGHT_CYAN='\033[1;36m'
export COLOR_RED='\033[0;31m'
export COLOR_LIGHT_RED='\033[1;31m'
export COLOR_PURPLE='\033[0;35m'
export COLOR_LIGHT_PURPLE='\033[1;35m'
export COLOR_BROWN='\033[0;33m'
export COLOR_YELLOW='\033[1;33m'
export COLOR_GRAY='\033[1;30m'
export COLOR_LIGHT_GRAY='\033[0;37m'
alias colorslist="set | egrep 'COLOR_\w*'"  # Lists all the colors, uses vars in .bashrc_non-interactive

# Hello Messsage --------------------------------------------------
echo -e "Kernel Information: " `uname -smr`
echo -e "${COLOR_BROWN}`bash --version`"
echo -ne "${COLOR_GRAY}Uptime: "; uptime
echo -ne "${COLOR_GRAY}Server time is: "; date

alias ls='ls -G'  # OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups

# Misc -------------------------------------------------------------
export HISTCONTROL=ignoredups
shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

# bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on" # note: bind used instead of sticking these in .inputrc
bind "set bell-style none" # no bell
bind "set show-all-if-ambiguous On" # show list automatically, without double tab

export PS1='\[\033[0;32m\]\w\[\033[1;31m\]$(__git_ps1 "(%s)") \[\033[01;32m\]$\[\033[00m\] '

# This runs before the prompt and sets the title of the xterm* window.  If you set the title in the prompt
# weird wrapping errors occur on some systems, so this method is superior
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*} ${PWD}"; echo -ne "\007"'  # user@host path

export PS2='> '    # Secondary prompt
export PS3='#? '   # Prompt 3
export PS4='+'     # Prompt 4

function xtitle {  # change the title of your xterm* window
  unset PROMPT_COMMAND
  echo -ne "\033]0;$1\007" 
}

# Navigation -------------------------------------------------------
alias ..='cd ..'
alias ...='cd .. ; cd ..'

# Other aliases ----------------------------------------------------
alias ll='ls -hl'
alias la='ls -a'
alias lla='ls -lah'

# Misc
alias g='grep -i'  # Case insensitive grep
alias f='find . -iname'
alias ducks='du -cksh * | sort -rn|head -11' # Lists folders and files sizes in the current folder
alias top='top -o cpu'
alias systail='tail -f /var/log/system.log'
alias m='more'
alias df='df -h'
alias h='history'

# Editors ----------------------------------------------------------
export EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"
#export EDITOR='mate -w'  # OS-X SPECIFIC - TextMate, w is to wait for TextMate window to close
#export EDITOR='gedit'  #Linux/gnome
#export EDITOR='vim'  #Command line

# Subversion & Diff ------------------------------------------------
export SV_USER='tud'  # Change this to your username that you normally use on subversion (only if it is different from your logged in name)
export SVN_EDITOR='${EDITOR}'

alias svshowcommands="echo -e '${COLOR_BROWN}Available commands: 
   ${COLOR_GREEN}sv
   ${COLOR_GREEN}sv${COLOR_NC}help
   ${COLOR_GREEN}sv${COLOR_NC}import    ${COLOR_GRAY}Example: import ~/projects/my_local_folder http://svn.foo.com/bar
   ${COLOR_GREEN}sv${COLOR_NC}checkout  ${COLOR_GRAY}Example: svcheckout http://svn.foo.com/bar
   ${COLOR_GREEN}sv${COLOR_NC}status    
   ${COLOR_GREEN}sv${COLOR_NC}status${COLOR_GREEN}on${COLOR_NC}server
   ${COLOR_GREEN}sv${COLOR_NC}add       ${COLOR_GRAY}Example: svadd your_file
   ${COLOR_GREEN}sv${COLOR_NC}add${COLOR_GREEN}all${COLOR_NC}    ${COLOR_GRAY}Note: adds all files not in repository [recursively]
   ${COLOR_GREEN}sv${COLOR_NC}delete    ${COLOR_GRAY}Example: svdelete your_file

   ${COLOR_GREEN}sv${COLOR_NC}diff      ${COLOR_GRAY}Example: svdiff your_file
   ${COLOR_GREEN}sv${COLOR_NC}commit    ${COLOR_GRAY}Example: svcommit
   ${COLOR_GREEN}sv${COLOR_NC}update    ${COLOR_GRAY}Example: svupdate
   ${COLOR_GREEN}sv${COLOR_NC}get${COLOR_GREEN}info${COLOR_NC}   ${COLOR_GRAY}Example: svgetinfo your_file
   ${COLOR_GREEN}sv${COLOR_NC}blame     ${COLOR_GRAY}Example: svblame your_file
'"
   
alias sv='svn --username ${SV_USER}'
alias svimport='sv import'
alias svcheckout='sv checkout'
alias svstatus='sv status'
alias svupdate='sv update'
alias svstatusonserver='sv status --show-updates' # Show status here and on the server
alias svcommit='sv commit'
alias svadd='svn add'
alias svaddall='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add'
alias svdelete='sv delete'
alias svhelp='svn help' 
alias svblame='sv blame'

svgetinfo (){
 	sv info $@
	sv log $@
}

# You need to create fmdiff and fmresolve, which can be found at: http://ssel.vub.ac.be/ssel/internal:fmdiff
alias svdiff='sv diff --diff-cmd fmdiff' # OS-X SPECIFIC
# Use diff for command line diff, use fmdiff for gui diff, and svdiff for subversion diff

export ORACLE_HOME=/Users/tud/instantclient_10_2
export TNS_ADMIN=$ORACLE_HOME
export LD_LIBRARY_PATH=$ORACLE_HOME
#export DYLD_LIBRARY_PATH=$ORACLE_HOME
export SQLPATH=$ORACLE_HOME
export NLS_LANG="AMERICAN_AMERICA.UTF8"
export PATH=/usr/local/git/bin:/usr/local/bin:/usr/local/sbin:$PATH:$ORACLE_HOME:/usr/bin

alias sc=script/console
alias ss=script/server
alias pex='cd ~/Rails/plmexplorer'
alias log='tail -f log/development.log'
alias rmsvn="find . -name .svn -print0 | xargs -0 rm -rf"
#alias htdocs="cd /Applications/xampp/xamppfiles/htdocs"
alias vmwarestop="sudo /Applications/VMware\ Fusion.app/Contents/Library/services.sh --stop"
alias vmwarestart="sudo /Applications/VMware\ Fusion.app/Contents/Library/services.sh --start"

# export JAVA_OPTS="-Xms512M -Xmx768M -XX:PermSize=256m -XX:MaxPermSize=512m -Djava.awt.headless=true -XX:+CMSClassUnloadingEnabled -XX:+CMSPermGenSweepingEnabled -XX:+UseConcMarkSweepGC. "
#export JRUBY_HOME="/opt/local/share/java/jruby"

alias startmongo='mongod --dbpath ~/mongodb'
alias cleanlogtermonal='sudo rm -f /private/var/log/asl/*.asl'
#alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
#alias vi='/Applications/MacVim.app/Contents/MacOS/Vim'

alias offile='wget --mirror --html-extension --convert-links'

if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

alias gdiff='git diff | mvim -R -f -'

alias jr="rvm use jruby;export JRUBY_OPTS=--1.9"

alias g=git
complete -o default -o nospace -F _git g

function tabc {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi
  osascript -e "tell application \"iTerm\" to set current settings of front window to settings set \"$NAME\""
}

function ssh2 {
  tabc "Solarized Dark ansi"
  /usr/bin/ssh "$@"
  tabc "IR_Black"
}

#alias firedev='/Applications/Firefox.app/Contents/MacOS/firefox-bin -no-remote -P Development 2>/dev/null &'

#complete -W "$(echo $(grep '^ssh ' .bash_history | sort -u | sed 's/^ssh \([a-zA-Z0-9_-@]*\).*/\1/'))" ssh

[[ -s "/Users/tud/.rvm/scripts/rvm" ]] && source "/Users/tud/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NODE_PATH=/usr/local/lib/node_modules
