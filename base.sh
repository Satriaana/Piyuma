#!/bin/sh


artwork=`cat $HOME/Satriaana/MailMan/.artwork`
echo "$artwork"

mapfile -t config < $HOME/Satriaana/MailMan/.config


echo "       ###################################################################
       #                                                                 #
       #                   Welcome to Mail-Man V1.0                      #
       #                                                                 #
       #             Copyright © 2021 ${config[0]}
       #                                                                 #
       ################################################################### "


#echo "(1) Send mail
#auto selected option (1)"

len=`expr ${#config[@]} - 1`

#seq $len
count=1
while [ $count -le $len ]; do
  for N in ${config[@]:1} ; do
  echo "($count) $N"
  #echo "$count"

  count=$(($count + 1))

done
done

#echo ${config[$len]}
read -n2 -r -p "User Input [1-9] :" choice2

count=1
while [ $count -le $len ]; do
  case $choice2 in
		$count|0$count) mailAddress=${config[$count]} ;;
  esac
  #echo $count
  count=$(($count + 1))

done

if [ -z "$mailAddress" ]; then
	echo "Invalid Entry"
	exit
fi


	echo
	echo
	echo "Sending mail as ${mailAddress}
	"
	echo ${mailAddress} > temp/mailAddress.txt

read -p "Enter the reciepents mail : " choice3

read -p "Enter the subject : " choice4

read -d "~" -p "Enter the message body with signature (\"~\" when done): " choice5
echo -e "\n"

echo -e "To: $choice3
Subject: $choice4
From: $mailAddress

$choice5" > temp/mail.txt


#should ask for a confirmation




value=`cat temp/mail.txt`
echo "$value"

echo Updating Repo...


git status

git add .

git commit -m '$USER updated'

git remote set-url origin https://github.com/Satriaana/Talaria

git push

git config --unset-all credential.helper

git remote remove origin
