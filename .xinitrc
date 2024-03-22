##################################################
###  Purpose  :	Configuration for startx      ####
###  File     : $HOME/.xinitrc		      ####
###  Date     : Sun. Feb 18 2024 13:58:24     ####
###  Author   : Franky Wong		      ####
##################################################

###
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &

# [[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults &

# change wallpager periodically
bash ~/.scripts/auto-wallpapers.sh &

# xscreensaver
xscreensaver &

# xcompmgr
xcompmgr &

# picom
picom &

# slstatus
#exec /home/admin/slstatus/slstatus &

# dwm statusbar - show current date and time 

while true
do 
#	"`date` 	`uptime | sed 's/.*,//'`"

	xsetroot -name "$(date "+%a. %d %b. %Y %l:%M %p")" 
#	VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
#	LOCALTIME=$(date +%Z\=%Y-%m-%dT%H:%M)
#	OTHERTIME=$(TZ=Asia/Hongkong date +%Z\=%H:%M)
#	IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
#	TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"

#	if acpi -a | grep off-line > /dev/null
#	then
#		BAT="Bat. $(acpid -b | awk '{ print $4 " " $5 }' | tr -d ',')"
#		xsetroot -name "$IP $BAT $VOL $TEMP $LOCALTIME $OTHERTIME"
#	else
#		xsetroot -name "$IP $VOL $TEMP $LOCALTIME $OTHERTIME"
#	fi
	sleep 30s
done &

# input method
export LANG=en_US.UTF-8
export LC_CTYPE=zh_CN.UTF-8
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

fcitx -d &

# dbus
eval "$(dbus-launch --sh-syntax --exit-with-session)" &

# start dwm
exec /home/admin/dwm/dwm

############################################
###	Kill Processes by name		####
###	Before quitting X-Window	####
############################################
killall feh
killall conky
killall fcitx
killall xinit
killall dwm
