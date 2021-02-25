#!/bin/sh -e

pidfile=/tmp/statbar-$(id -u)-$DISPLAY

printf %s "$$" >"$pidfile"

trap update TRAP

# set the deliminter character
DELIM=' '

cpu (){
        _cpu=$(vmstat | awk 'NR==3 {print $(NF-2)}')     # See man vmstat(1)
        _cpuicon=
        printf ^c#FB4934^%s^c#D5C4A1^%s "$_cpuicon" "$_cpu"% "$DELIM"
}

cpu_temp (){
       _temp=$(sysctl dev.cpu.0.temperature | sed -e 's|.*: \([0-9]*\).*|\1|')  # See man sysctl(1)
        if test "$_temp" -ge 55; then
                _tempicon=
        elif test "$_temp" -ge 1; then
                _tempicon=
        fi
        printf ^c#E78A4E^%s^c#D5C4A1^%s "$_tempicon" "$_temp"° "$DELIM"
}

memory (){
	_memory=$(free | awk '(NR == 18) {print $6}')      # free is a perl script to show free ram on FreeBSD.
        _memoryicon=
        printf ^c#FABD2F^%s^c#D5C4A1^%s "$_memoryicon" "$_memory" "$DELIM"
}

drive (){
	_drive=$(df -h | grep '/$' | awk '{print $5}')
        _driveicon=
        printf ^c#B8BB26^%s^c#D5C4A1^%s "$_driveicon" "$_drive" "$DELIM"
}

volume (){
	_vol=$(mixer -s vol | grep -Eo '[0-9]+$')       # FreeBSD uses mixer(1) for audio.
        if test "$_vol" -ge 52; then
                _volicon=
        elif test "$_vol" -ge 22; then
                _volicon=
        elif test "$_vol" -ge 2; then
                _volicon=
        elif test "$_vol" -eq 0; then
                _volicon=
        fi
        printf ^c#83A598^%s^c#D5C4A1^%s "$_volicon" "$_vol"% "$DELIM"
}

battery(){
	_acstat=$(apm -a)	# A/C status, 0 means disconnected, 1 means connected (check apm(1) -a)
	_battperc=$(apm -l)	# the estimated battery life time in percent (check apm(1) -l)
	if test "$_acstat" -eq 1; then
		_batticon=
	else
		if test "$_battperc" -ge 60; then
			_batticon=
		elif test "$_battperc" -ge 40; then
			_batticon=
		elif test "$_battperc" -ge 1; then
			_batticon=
		fi
	fi
	printf ^c#8EC07C^%s^c#D5C4A1^%s "$_batticon" "$_battperc"% "$DELIM"
}

weather() {
        LOCATION=Granville,NSW     # Set your location.
        find ~/.cache/weather.txt '!' -newermt '1 hour ago' -exec curl -s -o '{}' wttr.in/$LOCATION?format=1 ';'
        _weather=$(printf "%s\n""$SEP2""$(tr -d ' ' < ~/.cache/weather.txt)")
        printf ^c#D5C4A1^%s "$_weather" "$DELIM"
}
                                

wifi (){
#       ifconfig wlan0 | grep ssid | cut -w -f 3        # Print wireless SSID name.
        _wifiperc=$(ifconfig wlan0 | grep txpower | cut -w -f 3)     # Print wireless SSID signal strength.
        _wifiicon=
        printf ^c#665C54^%s^c#D5C4A1^%s "$_wifiicon" "$_wifiperc"% "$DELIM"
}

datetime (){
        _date=$(date "+%H:%M")
        _dateicon=
        printf ^c#D3869B^%s^c#D5C4A1^%s "$_dateicon" "$_date"
}

status()
{
        cpu
        cpu_temp
        memory
        drive
        volume
        battery
        wifi
        weather
        datetime
}

update()
{
        dwm -s "$(status)" &
        wait
}

while :; do
        update
        sleep 60 &
        wait
done
