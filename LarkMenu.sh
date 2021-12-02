#!/bin/bash
#set color variables
    BG_CYAN="$(tput setab 6)"
    BG_BLACK="$(tput setab 0)"
    FG_GREEN="$(tput setaf 2)"
    FG_MAGENTA="$(tput setaf 5)"
    h=0  #help counter
function resetVar() {
    echo "Resetting Lark environment for new game, $userName "
    sleep 2
    unset userName
    unset h
    echo "Help:" $h
    echo > ./currentPlayer.dat
# this is where you could reset variables for new game play
    }
#tcup smcup
# Display menu until selection == 0
    while [[ $REPLY != 0 ]]; do
      echo -n ${BG_CYAN} ${FG_MAGENTA}
      clear

# cat uses input of a here document
      cat <<EOF
        WELCOME TO OLIVE QUEST:

        1. START HERE 
	2. Play Game
        0. Quit
        
EOF

read -p "Enter selection [0-2] > " selection

      # Clear area beneath menu
      tput cup 10 0 # positions the cursor
      tput setab 4 # set background color
      echo -n ${BG_BLACK}${FG_GREEN}
      tput ed # Clears curosr to end of line
      tput cup 11 0
# Act on selection
# Act on selection
      case $selection in
	 1) 
		tput smso; echo "CONGRATS!! You've made it to the game menu.";tput rmso
		cat << EOF
		Before you get started these tips might help 'ls' will allow you to take a LOOK around....
		'cd (Name)' will allow you to MOVE around..." (the cd command is case sensative)
	 	'cd .. ' will allow you to MOVE back after you've reached a certain point

EOF
		;;	 

	 2)  echo "You've selected to start the game!!"
	  ./.oliveQuest.sh 
		;;

        0)  break
		exit 1
            ;;
        *)  echo "Invalid entry."
            ;;
      esac
      printf "\n\nPress any key to continue."
      read -n 1
      done
