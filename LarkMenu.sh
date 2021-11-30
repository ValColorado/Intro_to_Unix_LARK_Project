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
        2. Enter Player Name 
	3. Play Game
        4. RESET
        0. Quit
        
EOF

read -p "Enter selection [0-4] > " selection

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
		'cd' will allow you to MOVE around..."
	 	'cd .. ' will allow you to MOVE back after you've reached a certain point
		Once you've started up the game you can enter command 'h' for help"
		BE CAREFUL YOU ONLY GET THREE HINTS

EOF
		;;	 

        2)  read -p "What is your name? " userName
            if [ $(gawk '{print $1}' ./currentPlayer.dat) = $userName ]
               then
                 echo "Welcome back $userName"
                 sleep 2
             else
               echo $userName > ./currentPlayer.dat
               new=true
            fi
            ;;
    3)  echo "You've selected to start the game!!"
	  ./.oliveQuest.sh 

	;;
        4)  	echo "GAME WILL DELETE ALL PROGRESS ARE YOU SURE YOU WOULD LIKE TO CONTINUE? "
		echo "Would you like to continue?"
	        read -p "y/n: " answer
		case $answer in 
		y) 
			if [ new ]
               			then resetVar # resets game variables and settings
              			echo " Welcome to Lark" ; sleep 1
            		fi
            			# run start up script
              		echo "Lark is starting now $userName";sleep 1
              		 source ./.oliveQuest.sh
            		break
			;;
		n) echo "Game will not be reset"
           		 ;;
		*) echo "Invalid entry.... Please try again"
			read -p "y/n: "answer
			;;

	 	esac
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
