function xtitle {  # change the title of your xterm* window
  unset PROMPT_COMMAND
  echo -ne "\033]0;$1\007" 
}

svgetinfo (){
 	sv info $@
	sv log $@
}

function tabc {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi
  osascript -e "tell application \"iTerm\" to set current settings of front window to settings set \"$NAME\""
}

function ssh2 {
  tabc "Solarized Dark ansi"
  /usr/bin/ssh "$@"
  tabc "IR_Black"
}
