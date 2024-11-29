echo "Type 4 for the first prompt"
printf "4\n" | sudo pacman -S  --noconfirm xorg xorg-server
sudo pacman -S gdm
printf "all"|sudo pacman -S --noconfirm gnome