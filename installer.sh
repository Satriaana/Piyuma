#!/bin/bash
echo "            &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&           
            &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&           
            &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&           
                   &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&           
                       &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&           
                          &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&           
                            &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&           
            &          &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&           
            &&&&*  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&           
             &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&           
                     &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&           
                         &&&&&&&&&      &&&&&&&&&&&&&&&&&&&&&&&&&&&&&           
                           &&&&&&&      &&&&&&&&&&&&&&&&&&&&&&&&&&&&&           
                            &&             &&&&&&&&&&&&&&&&&&&&&&&&&&           
           &&&              &&             &&&&&&&&&&&&&&&&&&&&&&&&&&           
           &&&&             &&&&&       &&&&&&&&&&&&&&&&&&&&&&&&&&&&&           
                            &&&&&&      &&&&&&&&&&&&&&&&&&&&&&&&&&&&&           
                           &&&&&&       &&&&&&&&&&&&&&&&&&&&&&&&&&&&&           
                         &&&               &&&&&&&&&&&&&&&&&&&&&&&&&&           
                      &&&         &        &&&&&&&&&&&&&&&&&&&&&&&&&&           
               &&&&&&&&&&&    *&&&&&&&&    &&&&&&&&&&&&&&&&&&&&&&&&&&           
            &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&           
            &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&           "

echo "       ###################################################################
       #                                                                 #
       #                   Welcome to Mail-Man Installer                 #
       #                                                                 #
       #             Copyright © 2021 Satriaana Organization             #
       #                                                                 #
       ################################################################### "

#Getting Organization Materials
read -p "Organization Mailman Repo with branch (eg- Satriaana/MailMan/main ) : " orgRepo



#Creating Installation Directory
echo Creating Installation Directory
mkdir -p $HOME/Satriaana/MailMan/
cp installer.sh $HOME/Satriaana/MailMan/
cd $HOME/Satriaana/MailMan/
wget https://raw.githubusercontent.com/"$orgRepo"/.artwork
wget https://raw.githubusercontent.com/"$orgRepo"/.config



#Building Master Script
echo Downloading Master Script
wget https://raw.githubusercontent.com/Satriaana/MMproduct/main/master.sh


#Making Master Script Executable
echo Making Master Script Executable
chmod +x $HOME/Satriaana/MailMan/master.sh

#remove this in the production
cd $HOME

echo  -e "\033[33;5mInstalling mailman!\033[0m"

echo "alias mailman='source $HOME/Satriaana/MailMan/master.sh'
alias satriaana-update='source $HOME/Satriaana/MailMan/installer.sh'
export $MMREPO=$orgRepo" >> .bashrc

sleep 5

echo "Done! Try mailman by typing mailman in terminal"

echo "Thanks for being with Satriaana!!"
