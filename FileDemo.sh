#!/bin/bash
# this program will read the contents and also append the entered arguments text to the File.txt at mentioned location
# this program also checks if there exists company value in the file and avoids to add duplicate data
fileName=$1
n=1
r=0
array=()
while read -r line;
do
echo "$n $line"
array[ $r ]="$line"
n=`expr $n + 1`
(( r++ ))
done < $fileName

if [  "$#" -gt 1  ]  ;
then
#i=1
  for i in $@
   do
   if [ "$i" == "$1" ] ; then
    continue
   else
    for k in "${array[@]}"
     do
     #echo " $k"
      if [ "$i" == "$k" ] ; then
       echo " $i already exists hence not appended "
       continue 2
      else
       continue 1
      fi 
    done
    echo "$i" >> /home/ragh/ShellScript/File.txt
   fi
  done
else
echo ""
echo " NO company entered"
fi 

