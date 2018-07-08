List profiles: dconf dump /org/gnome/terminal/legacy/profiles:/ | grep -e "\[\:\|visible-name"

dump /org/gnome/terminal/legacy/profiles:/:xx-xx-xx-xx/ > sample.dconf

load /org/gnome/terminal/legacy/profiles:/:xx-xx-xx-xx/ < sample.dconf
