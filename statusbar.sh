#!/bin/sh

pidfile=/tmp/statbar-$(id -u)-$DISPLAY

printf %s "$$" >"$pidfile"

trap update TRAP

# set the deliminter character
DELIM=' '

cpu (){
        _cpu=$(vmstat | awk 'NR==3 {print $(NF-2)}')     # See man vmstat(1)
        _cpuicon=
        
        if test "$_cpu" -ge 70; then
                printf ^c#FB4934^%s^c#D5C4A1^%s "$_cpuicon" "$_cpu"% "$DELIM"
        elif test "$_cpu" -ge 50; then
                printf ^c#E78A4E^%s^c#D5C4A1^%s "$_cpuicon" "$_cpu"% "$DELIM"
        else
                printf ^c#83A598^%s^c#D5C4A1^%s "$_cpuicon" "$_cpu"% "$DELIM"
        fi
}

cpu_temp (){
        _temp=$(sysctl dev.cpu.0.temperature | sed -e 's|.*: \([0-9]*\).*|\1|')  # See man sysctl(1)
        if test "$_temp" -ge 60; then
                _tempicon=
        elif test "$_temp" -ge 1; then
                _tempicon=
                fi
        
        if test "$_temp" -ge 70; then
                printf ^c#FB4934^%s^c#D5C4A1^%s "$_tempicon" "$_temp"° "$DELIM"
        elif test "$_temp" -ge 50; then
                printf ^c#E78A4E^%s^c#D5C4A1^%s "$_tempicon" "$_temp"° "$DELIM"
        elif test "$_temp" -ge 1; then
                printf ^c#83A598^%s^c#D5C4A1^%s "$_tempicon" "$_temp"° "$DELIM"
        fi
}

fan (){
        _fan=$(sysctl -n dev.acpi_ibm.0.fan_speed)
        _fanicon=

        if test "$_fan" -le 3400; then
                printf ^c#83A598^%s^c#D5C4A1^%s "$_fanicon" "$_fan"rpm "$DELIM"
        elif test "$_fan" -ge 3500; then
                printf ^c#E78A4E^%s^c#D5C4A1^%s "$_fanicon" "$_fan"rpm "$DELIM"
        else
                printf ^c#FB4934^%s^c#D5C4A1^%s "$_fanicon" "$_fan"rpm "$DELIM"
        fi
}

memory (){
	_memory=$(free | awk '(NR == 18){ sub(/%$/,"",$6); print $6; }')      # free is a perl script to show free ram on FreeBSD.
        _memoryicon=
        
        if test "$_memory" -ge 75; then
                printf ^c#FB4934^%s^c#D5C4A1^%s "$_memoryicon" "$_memory"% "$DELIM"
        else
                printf ^c#FABD2F^%s^c#D5C4A1^%s "$_memoryicon" "$_memory"% "$DELIM"
        fi
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
        
        if test "$_vol" -ge 90; then
                printf ^c#FB4934^%s^c#D5C4A1^%s "$_volicon" "$_vol"% "$DELIM"
        elif test "$_vol" -ge 80; then
                printf ^c#E78A4E^%s^c#D5C4A1^%s "$_volicon" "$_vol"% "$DELIM"
        elif test "$_vol" -ge 60; then
                printf ^c#FABD2F^%s^c#D5C4A1^%s "$_volicon" "$_vol"% "$DELIM"
        elif test "$_vol" -ge 1; then
                printf ^c#83A598^%s^c#D5C4A1^%s "$_volicon" "$_vol"% "$DELIM"
        fi
}

battery(){
	_acstat=$(apm -a)	# A/C status, 0 means disconnected, 1 means connected (check apm(1) -a)
	_battperc=$(apm -l)	# the estimated battery life time in percent (check apm(1) -l)
	if test "$_acstat" -eq 1; then
		_batticon=
	else
		if test "$_battperc" -ge 60; then
			_batticon=
		elif test "$_battperc" -ge 30; then
			_batticon=
		elif test "$_battperc" -ge 1; then
			_batticon=
		fi
	fi
        
        if test "$_battperc" -ge 60; then
                printf ^c#8EC07C^%s^c#D5C4A1^%s "$_batticon" "$_battperc"% "$DELIM"
        elif test "$_battperc" -ge 30; then
                printf ^c#E78A4E^%s^c#D5C4A1^%s "$_batticon" "$_battperc"% "$DELIM"
        elif test "$_battperc" -ge 1; then
                printf ^c#FB4934^%s^c#D5C4A1^%s "$_batticon" "$_battperc"% "$DELIM"
        fi
}

weather(){
        LOCATION=Parramatta
        find ~/.cache/weather.txt '!' -newermt '1 hour ago' -exec curl -s -o '{}' wttr.in/$LOCATION?format=1 ';'
        read _weathericon _weather < ~/.cache/weather.txt
                printf ^c#FABD2F^%s^c#D5C4A1^%s "$_weathericon" "$_weather"
}

wifi (){
#       ifconfig wlan0 | grep ssid | cut -w -f 3        # Print wireless SSID name.
        _wifiperc=$(ifconfig wlan0 | grep txpower | cut -w -f 3)     # Print wireless SSID signal strength - see ifconfig(1).
        if test "$_wifiperc" -ge 90; then
                _wifiicon=
        elif test "$_wifiperc" -ge 70; then
                _wifiicon=
        elif test "$_wifiperc" -ge 1; then
                _wifiicon=
        else
                _wifiicon=
                fi
        
        if test "$_wifiperc" -ge 90; then
                printf ^c#665C54^%s^c#D5C4A1^%s "$_wifiicon" "$_wifiperc"% "$DELIM"
        elif test "$_wifiperc" -ge 70; then
                printf ^c#665C54^%s^c#D5C4A1^%s "$_wifiicon" "$_wifiperc"% "$DELIM"
        elif test "$_wifiperc" -ge 1; then
                printf ^c#665C54^%s^c#D5C4A1^%s "$_wifiicon" "$_wifiperc"% "$DELIM"
        else
                printf ^c#665C54^%s^c#D5C4A1^%s "$_wifiicon" "$DELIM"
        fi
}

datetime (){
        _date=$(date "+%H:%M")
        _dateicon=
                printf ^c#D3869B^%s^c#D5C4A1^%s "$_dateicon" "$_date" "$DELIM"
}

status()
{
        cpu
        cpu_temp
#        fan
        memory
        drive
        volume
        battery
        wifi
        datetime
        weather
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
