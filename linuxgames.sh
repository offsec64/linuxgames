#!/bin/bash

#               ___   ___                                                                                       
#     / /          / /    /|    / / //   / / \\ / /     //   ) )  // | |     /|    //| |     //   / /  //   ) ) 
#    / /          / /    //|   / / //   / /   \  /     //        //__| |    //|   // | |    //____    ((        
#   / /          / /    // |  / / //   / /    / /     //  ____  / ___  |   // |  //  | |   / ____       \\      
#  / /          / /    //  | / / //   / /    / /\\   //    / / //    | |  //  | //   | |  //              ) )   
# / /____/ / __/ /___ //   |/ / ((___/ /    / /  \\ ((____/ / //     | | //   |//    | | //____/ / ((___ / /    

# V1.0 By OffSec64

# Game installer and launcher for command-line based games




# Makes and changes the directory to linuxgames
mkdir /home/$USER/linuxgames/ > /dev/null 2>&1
cd /home/$USER/linuxgames/

# Make the installer file to install the games and also makes it so it writes to the stasus file so the script knows it has been run.
echo '# LINUXGAMES v1.0 installer file' > installer.sh
echo sudo apt update -y >> installer.sh
echo sudo apt install bastet -y >> installer.sh
echo sudo apt install pacman4console -y >> installer.sh
echo sudo apt install nsnake -y >> installer.sh
echo 'echo LINUXGAMES script by OffSec64 file for showing the status if the games are installed > stats.txt' >> installer.sh
echo 'echo INSTALLED >> stats.txt' >> installer.sh

# Writes the whiptail popup message file for if the program has never been ran. 
echo 'if (whiptail --title "QUESTION" --yesno "It looks like LINUXGAMES has never been run. Would you like to install the game dependencies? It may take a few minutes." 8 78); then' > installerquestion.sh
echo '   sh installer.sh # Runs the installer script' >> installerquestion.sh
echo 'else' >> installerquestion.sh
echo '   echo "Please Wait." # If the user does not want to install the games, than this displays for a split second before the next menu pops up' >> installerquestion.sh
echo fi >> installerquestion.sh

# Checks to see if the "stats.txt" file exists, if not, than runs installer question. This is to see if the game has been run so it doesn't have to install every time.
[ -f /home/$USER/linuxgames/stats.txt ] || sh installerquestion.sh

# Writes the status file so the script has been ran.
echo LINUXGAMES script by OffSec64 file for showing the status if the games are installed > stats.txt
echo INSTALLED >> stats.txt


echo '
    ADVSEL=$(whiptail --title "LINUXGAMES v1.0" --menu "Choose an option" 15 60 4 \
        "1" "Tetris" \
        "2" "Pac Man" \
        "3" "Snake" 3>&1 1>&2 2>&3)
    case $ADVSEL in
        1)
            bastet
        ;;
        2)
            pacman4console
        ;;
        3)
           nsnake
        ;;
    esac
' > mainmenu.sh

# Allows execution and runs the menu file.
chmod +x mainmenu.sh
sh mainmenu.sh
