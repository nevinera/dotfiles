/home/nevinera/.screenlayout/default.sh
xscreensaver &
xinput set-int-prop "Logitech USB Trackball" "Evdev Wheel Emulation Button" 8 8
xinput set-int-prop "Logitech USB Trackball" "Evdev Wheel Emulation" 8 1
xinput set-int-prop "Logitech USB Trackball" "Evdev Middle Button Emulation" 8 1
xinput set-prop "Logitech USB Trackball" "Evdev Wheel Emulation" 5 7 4 5
xinput set-button-map "Logitech USB Trackball" 1 2 3 5 4 6 7 8 9
setxkbmap -option ctrl:nocaps &
xmonad
