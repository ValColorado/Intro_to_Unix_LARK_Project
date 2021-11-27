#!/bin/bash
#set color variables
    BG_CYAN="$(tput setab 6)"
    BG_BLACK="$(tput setab 0)"
    FG_GREEN="$(tput setaf 2)"
    FG_MAGENTA="$(tput setaf 5)"
    
function load(){ 
while true;
do	
for c in {0..9}
	do tput setab $c
 	echo -n "..........";sleep .005 # loading screen
	done
	break
done	
}
function br(){
	echo " "
}

function introStory() {
	echo "Olive is Lakeland's newest friendly neighborhood cat. Olive got a little confused after a long night out at Molly McMeow's Irish Pub and now needs help finding her way back. "
	br
	echo "Stop by some of Lakeland's well know establishments to see if you can find Olive's human (Valentina) to help Olive get back home."
	br
	echo "While wandering around Lakeland be careful walking around don't run into Toast (The neighborhood watch dog) he will send olive to the pound if she's caught walking aruond without her human (....he loves his tacos and BBQ)"
	br
	echo "hint..( to look around try ls)"
}
function hint (){
 tput smso;echo "HINTTT: You've selected to use a hint!"
 br
 echo "Be careful using hints you only have 3";tput rmso;
 h=$((h+=1))
#SHOW NUMBER OF HINTS LEFT
}
function jumpBack (){
 while true
 do
 read -p "Enter Command: " leave1
 if [ "$leave1" = "cd .." ]; then
      	echo "Jumping back"
     	br
	load;tput setab 0
	main
	break
else 
	read -p "Invalid try again" leave1
fi																										
done
}
function Revival(){
	echo " Olive started her night here with Valentina...Maybe the bartender 'Soup' knows where she went"
	br
	echo "try 'ping' Soup to see if shes available to chat.."
	while true;
	do
	read -p "Enter Command: " command
	case $command in 
	ping) 
		while true
		do
		echo "Soup: Hey Olive! welcome back I take it that you're looking for Valentina?...."
		read -p "Enter response y/n: " revival1
		case $revival1 in
			Y|y) 	echo "Soup: I heard she went out looking for coffee... I think Argo knows the passwd to get into the coffee shop"
				br
		     		echo "Soup: Good luck! I have to get back to work..."
				jumpBack
				;;

			N|n) echo "Soup: Sounds good, thanks for stopping by!"
				jumpBack
				;;
			*) read -p "Invalid try again" revival1
				;;
			esac
		done
		;;
	H|h)  
		hint
                echo "Try 'ping' by itself to talk to Soup"
		br
		;;

	*) read -p "hmm that didn't work.... try again" command
		;;
	esac
done
}
#function tacoBus(){ }
#function pitaPit(){}
#function chopShop(){}
#function frescos(){}
#function ax-Caliber(){}
#function MOJO(){}
#function federalBar(){}
#function blackBrew(){}
#function ninteen61(){}

function main() {
	br
        read -p "Enter Command: " selection # user input to determine what happens
      # Clear area beneath menu
      tput cup 10 0 # positions the cursor
      echo -n ${BG_BLACK}${FG_GREEN}
      tput ed # Clears curosr to end of line
      tput cup 11 0
	case $selection in 
	ls) echo "Down this street there is Revival, TacoBus, and PitaPit"
	    echo "Try to 'cd' into one of these establishments."
		read -p "Enter command: " blockOne
		while true
		do
		if [ "$blockOne" = "cd Revival" ]; then
			Revival
			break
		elif [ "$blockOne" = "cd TacoBus" ]; then
			echo "TACO BUS"
			break
		elif [ "$blockOne" = "cd PitaPit" ];then
			echo "PITA PIT"
			break
		else
		             
				echo try again
				read -p "Enter command: " blockOne
		fi			
		done

		;;
	h) 
		hint
		echo "Try 'ls' to see whats around"
		br
		main
	   ;;
	MENU|menu)   echo "Taking you back to the menu"
		./LarkMenu.sh 
		break  
	;;
	*) read -p "INVALID OPTION ...Try Agin:" selection

		;;
	esac   
}
br
echo "OLIVE QUEST!!";tput rmso #game title
introStory
main
