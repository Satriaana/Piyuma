#!/bin/bash
     
echo "Preparing Environment.."

mkdir -p $HOME/Satriaana/MailMan/temp

cd $HOME/Satriaana/MailMan/temp

orgName=$(echo $MMREPO | sed  's/\/.*//g')

git clone --quiet https://github.com/"$orgName"/MMproduct.git 

echo Connecting to Satriaana Repository...

echo "Setting Up Working Directory..."
#sleep 10

cd mailman
cp installer.sh $HOME/Satriaana/MailMan/
chmod +x base.sh

./base.sh 

cd ../..

pwd

echo "Let me clear the mess you have done..!"

rm -rf temp


echo "Thank you for using mailMan !"

cd

sleep 3
