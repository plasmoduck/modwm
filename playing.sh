mpc -h /usr/home/cjg/.mpd/socket | awk 'NR==1 {song = $0} NR==2 {if ($1 == "[playing]") p=1; sub(/.*\//, "")} END {printf("%s %s\n", p?"^c#83A598^ ^c#a89984^":"^c#D3869B^ ^c#a89984^", song) else printf("stopped")}'


