#!/bin/sh

#reading external files
artwork=`cat $HOME/Satriaana/MailMan/.artwork`
echo "$artwork"
mapfile -t config < $HOME/Satriaana/MailMan/.config
len=`expr ${#config[@]} - 1`

#loading mailAddress
selectingMailAddress=( $(
  mapfile -t config < $HOME/Satriaana/MailMan/.config
  len=`expr ${#config[@]} - 1`
  count=1
  while [ $count -le $len ]; do
    for N in ${config[@]:1} ; do
      echo "($count) $N"
    count=$(($count + 1))
  done
  done))

#gui I - welcome & selecting email
mailAddress=( $(zenity --list \
 --title="Welcome to Talaria" \
 --column="Choose the email address" \
 echo ${selectingMailAddress[@]}))

#dialog box to confirm selected mailAddress
zenity --info --width 300 --text "Sending mail as $mailAddress"

#adding mail Address to mailAddress.txt file
echo ${mailAddress} > temp/mailAddress.txt

#gathering mail details
OUTPUT=$(zenity --forms --title="Talaria" --text="Details" --separator="," --add-entry="Reciepent's mail address" --add-entry="Subject" --add-entry="Message body with signature")
accepted=$?
if ((accepted != 0)); then
    zenity --warning --title "Talaria ERROR" --width 300 --text "Some information couldn't found"
    exit 1
fi

#assigning OUTPUT data to variables
choice3=$(awk -F, '{print $1}' <<<$OUTPUT)
choice4=$(awk -F, '{print $2}' <<<$OUTPUT)
choice5=$(awk -F, '{print $2}' <<<$OUTPUT)

#building mail.txt
echo -e "To: $choice3
Subject: $choice4
From: $mailAddress

$choice5" > temp/mail.txt

#git commit progress
function git-commit () {
  git status

  git add .

  git commit -m '$USER updated'

  git remote set-url origin https://github.com/Satriaana/Talaria

  git push

  git config --unset-all credential.helper

  git remote remove origin
}
git-commit | zenity --progress --title "Sending Mail" --auto-close
if [ "$?" = -1 ] ; then
        zenity --error \
          --text="Sending Failed"
fi
