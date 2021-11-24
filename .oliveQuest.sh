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

# cat uses input of a here document
while true
do	      
	echo 	
	echo -e "WELCOME TO OLIVE QUEST!!"
	echo "Lets help get Olive home, be careful walking around don't run into Toast (The neighborhood watch dog) he will send olive to the pound if she's caught walking aruond without her human"
	

read -p "Enter command: " selection

      # Clear area beneath menu
      tput cup 10 0 # positions the cursor
      echo -n ${BG_BLACK}${FG_GREEN}
      tput ed # Clears curosr to end of line
      tput cup 11 0
# Act on selection
# Act on selection
	case $selection in 
	ls) echo "LOOKING AROUND" 
		#CONTINUE
		;;
	h) echo "You've selected to use a hint!" 
	   echo "Be careful using hints you only have 3"
	   h=$((h+=1))
	   echo h : $h
	  
	   ;;
	*) echo "INVALID TERMINATING"
		break
	esac   
done
