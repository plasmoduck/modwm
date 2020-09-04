#!/bin/sh
# * ----------------------------------------------------------------------------
# * "THE BEER-WARE LICENSE" (Revision 42):
# * <plasmoduck@gmail.com> wrote this file.  As long as you retain this notice you
# * can do whatever you want with this stuff. If we meet some day, and you think
# * this stuff is worth it, you can buy me a beer in return.   Plasmoduck
# * ----------------------------------------------------------------------------
# */

playing () {
  mpc -h /usr/home/cjg/.mpd/socket | awk 'NR==1 {song = $0} NR==2 {if ($1 == "[playing]") p=1; len=$(NF-1); sub(/.*\//, "", len)} END {printf("%s (%s) %s\n", p?"^c#83A598^ ^c#a89984^":"^c#D3869B^ ^c#a89984^", len, song)}' 
}

covid19 () {
	curl https://corona-stats.online/australia\?format\=json | python3 -c 'import sys,json;data=json.load(sys.stdin)["data"][0];print("",data["cases"],"",data["deaths"])'
sleep 60s
}

memory (){
	free | awk '(NR == 18) {print $6}'
}

drive (){
	df -h | grep '/$' | awk '{print $5}'
}

cpu_temp (){
	sysctl dev.cpu.0.temperature | sed -e 's|.*: \([0-9.]*\)C|\1|'
}

volume (){
	mixer -s vol | grep -Eo '[0-9]+$'
}

print_date (){
	date "+%r "
}

weather() {
     LOCATION=Parramatta

     printf "%s" "$SEP1"
     if [ "$IDENTIFIER" = "unicode" ]; then
         printf "%s" "$(curl -s wttr.in/$LOCATION?format=1)"
     else
         printf "%s" "$(curl -s wttr.in/$LOCATION?format=1 | grep -o "[0-9].*")"
     fi
     printf "%s\n" "$SEP2"
     sleep 60s
}

while true
do
  xsetroot -name "^b#0E0708^^c#a89984^$(playing) ^c#FE8019^^c#FB4934^  $(memory) ^c#FE8019^^c#B8BB26^  $(drive) ^c#FE8019^^c#FABD2F^  $(cpu_temp) ^c#FE8019^^c#83A598^  $(volume)% ^c#FE8019^^c#8EC07C^  $(print_date)^c#FE8019^"
	sleep 1s
done
