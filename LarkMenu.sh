#!/bin/bash
#set color variables
    BG_CYAN="$(tput setab 6)"
    BG_BLACK="$(tput setab 0)"
    FG_GREEN="$(tput setaf 2)"
    FG_MAGENTA="$(tput setaf 5)"

function resetVar() {
    echo "Resetting Lark environment for new game, $userName "
    sleep 2
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

        1. Intro
        2. Play Game
        3. RESET
        0. Quit
        
EOF

read -p "Enter selection [0-3] > " selection

      # Clear area beneath menu
      tput cup 10 0 # positions the cursor
      tput setab 4 # set background color
      echo -n ${BG_BLACK}${FG_GREEN}
      tput ed # Clears curosr to end of line
      tput cup 11 0
# Act on selection
# Act on selection
      case $selection in
        1)  read -p "What is your name? " userName
            if [ $(gawk '{print $1}' ./currentPlayer.dat) = $userName ]
               then
                 echo "Welcome back $userName"
                 sleep 2
             else
               echo $userName > ./currentPlayer.dat
               new=true
            fi
            ;;
    2)  echo "You've selected to start the game!!"
	while true;
		do	
		for c in {0..9}
		do tput setab $c
	   
		echo -n "Game is loading.......";sleep .5 # loading screen
		done
		break
	done
		
           tput setab 0 ;./.oliveQuest.sh;  #start game

	;;
        3)  if [ new ]
               then resetVar # resets game variables and settings
              echo " Welcome to Lark" ; sleep 1
            fi
            # run start up script
              echo "Lark is starting now $userName";sleep 1
              # source ./someLarkStartScript.sh
            break
            ;;
        0)  break
            ;;
        *)  echo "Invalid entry."
            ;;
      esac
      printf "\n\nPress any key to continue."
      read -n 1
    done

