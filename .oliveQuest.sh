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
 	echo -n "LOADING.....";sleep .5 # loading screen
	done
	break
done	
tput setab 0
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
echo "To jump back try 'cd ..'"
while true
 do
 read -p "Enter Command: " leave1
 if [ "$leave1" = "cd .." ]; then
      	echo "Jumping back"
     	br
	load;tput setab 0
	br
	echo "You're back on the street... use one of the previous commands you learned to LOOK around"
	break
else 
	read -p "Invalid try again" leave1
fi																										
done
}
function extraDrink(){
  cat <<EOF
                Which drink would you like
		1) Meowgarita
		2) Meowjito
		3) Catnip
EOF
	    read -p "Select an option [1-3]: " drink
	    if [ $drink == '1' ]; then
		    echo "Olive: I needed that one after the week I had..."
		    echo "I think it's time to go back to look for Valentina"
		    jumpBack
		    main
		    break
	    elif [ $drink == '2' ];then
		    echo "Olive: Uh oh... I probably should have stuck with water..."
		    echo "I think it's time to go back now..."
		    jumpBack
		    main
		    break
	    elif [ $drink = '3']; then
		    echo "Olive: ahhhh a nice treat!"
		    echo "I'm ready to go !"
		    jumpBack
		    main
		    break
	    else
		    read -p "INVALID SELECT AN OPTION [1-3]:"drink
	fi
}
function Revival(){
	echo " Olive started her night here with Valentina...Maybe the bartender 'Soup' knows where she went"
	br
	echo "try the command 'ping' to see if Soup is available to chat.."
	read -p "Enter command: " command
	while true;
	do
	case $command in 
	ping) 
	
		echo "Soup: Hey Olive! welcome back I take it that you're looking for Valentina?...."
		read -p "Enter response y/n: " revival1
		case $revival1 in
			Y|y) 	echo "Soup: I heard she went out looking for coffee... I think Argo knows the passwd to get into the coffee shop"
				br
		     		echo "Soup: Good luck! I have to get back to work..."
				br
				
				read -p "Do you wish to leave Revival (1) or Stay for one more drink (2)?: " leave
				case $leave in			
				1) 	
					jumpBack
					main
				;;
				2)
					extraDrink
					;;
					esac
					br
				;;
			N|n) echo "Soup: Sounds good, thanks for stopping by!"
				jumpBack
				main
				;;

			*) echo "Invalid try again"
				br
				;;
			
			esac
			;;
	H|h) 	
		hint
                echo "Try 'ping' by itself to talk to Soup"
		br
		;;

	*) echo "hmm that didn't work.... try again"
	       	br	
		Revival
		;;
	esac
	
	done
}

function tacoBus(){
echo "OH NO!! Toast is here!!"
br
echo "Toast: OLIVE!! WHERE IS YOUR HUMAN..."
br
echo "Toast: unfortunately since your human isn't here i'm going to have to take you in."
br

while true;
do
	cat << EOF
	You have two options:
	a) Fight 
	b) Surrender
EOF

	read -p "Enter Selection: " tB
	case $tB in
	A|a) echo "Olive tried putting up a good fight but Toast was too strong...."
		br 
		echo "Sending Olive to jail...."
		echo " Starting game menu"
		load; 
		./LarkMenu.sh
		break
		;;
	B|b) echo "OH NO.... good try"
	     echo "Loading game menu"
	     load;
	     ./LarkMenu.sh
	     break   
	     ;;
	*) echo "Invalid try again" 
		tacoBus
		break
	;;
	esac
	done

}
function blockTwo(){
br
echo "We've made it down the block!!"
br
echo "Use one of the previous commands you've learned to LOOK around the block"
read -p "Enter Command: " blockTwo
	if [ "$blockTwo" = "ls" ]; then
		cat <<EOF
		Looks like Val And Argo are somewhere around here.....

		-MOJO
		-blacknBrew
		-ChopShoip
EOF
		echo"Use one of the previous commands you've learned to MOVE into a room"
		br
		read -p "Enter Command: " selection
		if [ "$selection" = 'cd MOJO' ];then
			MOJO
			break		
	
		elif [ "$selection" = 'cd blacknBrew' ];then
			blackBrew
			break
		elif [ "$selection" = 'cd ChopShop' ];then 
			echo "CHOPSHOP"
			#TOAST WILL BE HERE
		else
			echo "INVALID TRY AGAIN..."
			blockTwo
		fi

	elif [ "$blockTwo" = "cd .." ]; then 
		jumpBack
		blockTwo
	fi
	



}
function pitaPit(){
echo "hmmm PitaPit is closed but there is a ripped note on the floor"
while true; do
	cat<<EOF
	 read note
   	 (to read the note we have to use our cat vision... try the command 'cat')
EOF
read -p "Enter Selection: " selection
case $selection in
        cat) 

	     	echo "The note says 'Argo will be at MOJO tonight'...."
	     	br
	   	echo "Lets see if Argo or Val will be in the next block"
		load
		blockTwo	
	     	break
	     ;;
     *) echo "Invalid try again" 
     	pitaPit	     
	     break
	   ;;																										 esac																														 done

}
#function chopShop(){}
function MOJO(){
br 
cat <<EOF
	LOOKS LIKE ARGO IS HERE!!
	LETS SEE IF HE CAN GIVE US THE PASSWD
	(try the 'mv' command to move next to argo
EOF
 read -p "Enter Command: " mojo1

 case $mojo1 in
	 mv) 
		cat << + 
		 Argo: OLIVE! its good to see you.... Valentina is looking for you! 
		 she is at Black and Brew.
		 I was just there..... you're going to need a password to get in.... 
		 Do you want me to tell you or do you want to try to hack your way in?
+

		read -p "Enter y/n: " passwd
		case $passwd in 
		Y|y) echo "Argo: The passwd is..... PASSWD (i guess they need to brush up on their security101 classes"
		     echo "Argo: I have to go! I might miss my train."
		     echo "Argo: Good luck! I hope you find Val... remember Toast is still out tonight"
		     jumpBack
		     br
		     blockTwo	     
			;;
		N|n) echo "Okayyyy... good luck! always remember your lucky #777 ;)"
			jumpBack
			br
			blockTwo
			;;
			
		*) echo "Invalid option try again..."
			MOJO
			;;
		esac
		;;
	
			
	*) echo "Invalid....  try again"
		MOJO
		;;
	esac
		


}
function blackBrew(){
echo "Security: Welcome to Black & Brew! Where you'll find some of lakeland's best coffee.."
br
echo "Security: To enter you can either type the password (1) or you can try to 'hack' your way in(2)"
read -p "Enter Selection: " enter
case $enter in 
	1) 
		br 
		echo "Security: You've selected to enter the password..."
		read -p "Please enter the password: " password
		if [ $password = 'passwd' ];then
			load
			
		else 
			echo "Password is incorrect.... Please try again."
			br
			echo "Remember Argo is somewhere in Lakeland (he knows the password)"
			jumpBack
			blockTwo
		fi
		;;
	2)
		br
		echo "Olive: I know I can hack my way into here...."
		br
		echo "Olive: Maybe I can trick them into thinking I'm the administrator" 
		br
		echo "Olive.... I can just 'chmod' my way in, but I will still need the three lucky numbers to grant myself permission"
		br
		read -p "Enter Command: " hack
		if [ $hack = 'chmod 777' ];then
			echo "Olive: HA! I know I could break my way in...."
			br
			echo "Looks like Valentina is right there!"
			br
			#valentina()
		else
			echo "Password is incorrect.... Please try again."
			br
			echo "Remember Argo is somewhere in Lakeland (he knows the password)"
			jumpBack
			blockTwo
		fi
	;;
	esac

}

#function valentina(){}
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
			tacoBus
			break

		elif [ "$blockOne" = "cd PitaPit" ];then
			pitaPit
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
	*) echo  "INVALID OPTION ...Try Again: " 
		main
		;;
	esac   
}
br
load
br
echo "OLIVE QUEST!!";tput rmso #game title
introStory
main
