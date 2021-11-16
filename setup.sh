#!/bin/bash 


# install the need program 
#sudo pacman -S --needed --noconfirm dialog 



function error(){
    clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;
}

function welcome(){
b_title="\Z4 Script will run in your system!"
title="\Z0 Dear $USER this script will run in your system"


    dialog --colors \
        --backtitle "$b_title" \
        --title "$title" \
        --yes-label "Yes, Continue" \
        --no-label "Exit" \
        --yesno "\Z5 This script is not allowed to be run as root, \
but you will be asked to enter your sudo password at various points \
during this installation. This is to give PACMAN the necessary \
permissions to install the software. \
\n\Z1 So stay near the computer.
            \nThis script will be need 1 hour 45 minute to run 
            \nit is really depending up on your internet speed." \
        14 60
}


welcome || error "User choose to exit."

x_dir_so=~/simple_arch/setup_x/xsessions
x_dir_target=/usr/share/xsessions 


function setup_x(){
    if [ -d "$x_dir_target" ] ; then
        sudo cp $x_dir_so/dwm.desktop $x_dir_target
    else
        sudo cp -r $x_dir_so $x_dir_target
    fi
    # make basic dir
    mkdir Desktop Videos Pictures Documents Downloads .config 

    # install the xorg, and the need program
    sudo pacman -S --needed --noconfirm xorg lxsession lxapperance polkit-gnome nautilus lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings

    sleep 5s

    # enable lightdm service
    sudo systemctl enable lightdm
}

setup_x 

# clone setup script,font,theme and wallpapers 
pushd ~

# install font 
git clone https://gitlab.com/farookphuket/my_fonts.git 
cd ~/my_fonts
sh copy_font.sh 
cd ~/

# install incons
git clone https://gitlab.com/farookphuket/my_icons.git 
cd ~/my_icons 
sh copy.sh
cd ~/

# install wallpapers 
git clone https://gitlab.com/farookphuket/my_wallpapers_less.git ~/Pictures/wallpapers

cd ~/
# clone install script 
git clone https://github.com/farookphuket/archlinux_my_config.git 
cd ~/archlinux_my_config 

conf_dir=~/.config

# dwm source directory
dwm_so=~/archlinux_my_config/CONFIG_FILES/dwm


# dmenu source directory
dmenu_so=~/archlinux_my_config/CONFIG_FILES/dmenu

# st source directory
st_so=~/archlinux_my_config/CONFIG_FILES/st

# sl source directory
sl_so=~/archlinux_my_config/CONFIG_FILES/slstatus


# alacritty source directory
alacritty_so=~/archlinux_my_config/CONFIG_FILES/alacritty



# copy folder to .config folder
cp -r $dwm_so $conf_dir
cp -r $dmenu_so $conf_dir
cp -r $st_so $conf_dir
cp -r $sl_so $conf_dir
cp -r $alacritty_so $conf_dir

# .dwm will call by dwm auto run script
cp -r ~/archlinux_my_config/CONFIG_FILES/.dwm ~/

# compile the configuration 
cd $conf_dir/dwm && sudo make clean install && cd $conf_dir/dmenu && sudo make clean install && cd $conf_dir/st && sudo make clean install && cd $conf_dir/slstatus && sudo make clean install && cd ~/archlinux_my_config 

sleep 5s
sh setup.sh
cd ~/

popd


function goodbye(){

    title="\Z1 Success! operation done!"
    b_title="\Z4 please reboot your system!"
    MSG="\Z2 your setup has been done now please reboot the system"

    dialog --clear \
        --colors \
        --title "$title" \
        --backtitle "$b_title" \
        --msgbox "$MSG" \
        14 60

    # delete the config dir 
    sudo rm -rf ~/archlinux_my_config 
    sudo rm -rf ~/my_fonts 
    sudo rm -rf ~/my_icons 
    sudo rm -rf ~/my_zsh 
    sudo rm -rf ~/simple_arch 

}

goodbye


sleep 5s
reboot

