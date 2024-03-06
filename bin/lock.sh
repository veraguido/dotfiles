#!/bin/sh
# Shitty i3lock-colors script by github.com/mehedirm6244

declare -i SUSPEND
declare BG_PATH
BG_CACHED_PATH="${HOME}/Pictures/lock.png"

help() {
	echo "i3lock-color script by github/mehedirm6244"
	echo ""
	echo "Options:"
	echo "--help        Show this message"
	echo "--suspend     Suspend after locking"
	echo "--bg          Use the following image passed as argument as background"
	exit 0
}

create_cache() {
	size=$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')

	echo "Caching background"
	eval convert "$BG_PATH" \
		-resize "$size""^" \
		-gravity center \
		-extent "$size" \
		-brightness-contrast -15x0 \
		-filter Gaussian \
		-blur 0x5 \
		"$BG_CACHED_PATH"
}

lock() {
	# Grab ~/.Xresources colors (Thanks to: elenapan)
	XBG="#1a1b26"
	XFG="#c0caf5"
	X0="#1a1b26"
	X1="#f7768e"
	X2="#9ece6a"
	X3="#e0af68"
	X4="#7aa2f7"
	X5="#bb9af7"
	X6="#8ab4f8"
	X7="#b3b9b8"
	X8="#1a1b26"
	X9="#f7768e"
	X10="#9ece6a"
	X11="#e0af68"
	X12="#7aa2f7"
	X13="#bb9af7"
	X14="#8ab4f8"
	X15="#fcfcfc"

	trans='00'
	semitrans='88'

	font='Overpass'

	i3lock \
		--insidever-color=$X0$trans \
		--insidewrong-color=$X0$trans \
		--inside-color=$XBG$trans \
		--ringver-color=$X10 \
		--ringwrong-color=$X9 \
		--ring-color=$XFG$semitrans \
		--line-uses-inside \
		--keyhl-color=$X10 \
		--bshl-color=$X11 \
		--separator-color=$XBG \
		--verif-color=$X10 \
		--wrong-color=$X9 \
		--layout-color=$X12 \
		--date-color=$XFG \
		--time-color=$XFG \
		--screen 1 \
		--image ${BG_CACHED_PATH} \
		--clock \
		--indicator \
		--keylayout 1 \
		--time-str="%I:%M %p" \
		--time-size=56 \
		--date-str="%a, %b %e %Y" \
		--date-size=24 \
		--verif-text="" \
		--wrong-text="" \
		--noinput="" \
		--lock-text="Locking..." \
		--lockfailed="Lock Failed" \
		--time-font=$font \
		--date-font=$font \
		--layout-font=$font \
		--verif-font=$font \
		--wrong-font=$font \
		--radius=40 \
		--ring-width=5 \
		--ind-pos="w/2:h/2+60" \
		--time-pos="w/2:h/2-100" \
		--date-pos="w/2:h/2-66" \
		--layout-pos="w/2:h-66" \
		--greeter-pos="w/2:h/2" \
		--pass-media-keys \
		--pass-screen-keys \
		--pass-volume-keys \


	if [[ ${SUSPEND} == 1 ]]; then
		systemctl suspend
	fi
}

# Read arguements provided
while (($# > 0)); do
	case "$1" in
		(--bg)
			BG_PATH="$2";
			create_cache;
			shift;;
		(--help)
			help;;
		(--suspend) SUSPEND=1;;
	esac
	shift
done

lock
