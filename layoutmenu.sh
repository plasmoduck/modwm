#!/usr/local/bin/bash

choice=$(cat <<EOF | dmenu
[\] Fibonacci
|M| Centered
><> Floating
[]= Tiled
||| Columns
>M> CFM	
[M] Monocle
[D] Deck
TTT Bstack
=== BstrackHoriz
::: Grid
(@) Spiral
|+| Tatami
EOF)

case $choice in
'[\\] Fibonacci')
	printf 0
	;;

'|M| Centered')
	printf 1
	;;

'><> Floating')
	printf 2
	;;

'[]= Tiled')
	printf 3
	;;

'||| Columns')
	printf 4
	;;

'>M> CFM')
	printf 5
	;;

'[M] Monocle')
	printf 6
	;; 

'[D] Deck')
	printf 7
	;;

'TTT Bstack')
	printf 8
	;;

'=== BstrackHoriz')
	printf 9
	;;

'::: Grid')
	printf 10
	;;

'(@) Spiral')
	printf 11
	;;

'|+| Tatami')
	printf 12
	;;
esac
