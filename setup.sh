#!/bin/bash

# install the need program
#sudo pacman -S --needed --noconfirm dialog

function error() {
  clear
  printf "ERROR:\\n%s\\n" "$1" >&2
  exit 1
}

function welcome() {
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

current_dwm=~/.config/dwm

function isExistDWM() {
  if [ -d "$current_dwm" ]; then
    msg_box="\Z1Dear $USER we found your current dwm config.\\nyour current dwm config will be now renamed to \\n~/.config/dwm_old  \\n\\n-Farook"

    dialog --colors --title "\Z0 found dwm config!" --msgbox "$msg_box" 16 60
    mv $current_dwm ~/.config/dwm_old
    echo " - your current dwm config has been renamed to dwm_old"
  fi
}

isExistDWM

function setup_x() {
  if [ -d "$x_dir_target" ]; then
    sudo cp $x_dir_so/dwm.desktop $x_dir_target
  else
    sudo cp -r $x_dir_so $x_dir_target
  fi

  cd ~/
  # make basic dir
  mkdir -p Desktop Videos Pictures Documents Downloads Music .config

  # install the xorg, and the need program
  sudo pacman -Syu xorg lxsession lxappearance polkit-gnome nautilus lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings --needed --noconfirm

  sudo pacman -Syu --needed --noconfirm tree htop feh nitrogen rofi sxhkd conky rsync krusader picom usbutils

  sudo pacman -Syu --needed --noconfirm arandr xsel duf cmatrix

  # 15 Jan 2022 i3exit install
  pushd ~/
  git clone https://aur.archlinux.org/i3exit.git
  cd ~/i3exit
  makepkg -si

  cd ~/
  sleep 5s
  rm -rf ~/i3exit

  # =============================================================================
  # the folder `.dwm` is will call by `dwm` script for the auto load program like
  # slstatus(to draw the status line) nitrogen(draw wall paper) etc,
  # copy config folder
  cp -r ~/archlinux_my_config/CONFIG_FILES/.dwm/ ~/

  sleep 5s

  # enable lightdm service
  sudo systemctl enable lightdm
}

# make sure to be in the home folder
cd ~/

# clone install script
git clone https://github.com/farookphuket/archlinux_my_config.git
cd ~/archlinux_my_config

# run script
setup_x

# clone setup script,font,theme and wallpapers
pushd ~

# install font
git clone https://gitlab.com/farookphuket/my_fonts.git
cd ~/my_fonts
sh copy_font.sh
cd ~/

# install icons
git clone https://gitlab.com/farookphuket/my_icons.git
cd ~/my_icons
sh copy.sh
cd ~/

# install wallpapers
# last update command 23 Dec 2021
git clone https://gitlab.com/farookphuket/my_wallpapers_less.git
cd ~/my_wallpapers_less
sh setup.sh

conf_dir=~/.config/

# dwm source directory
dwm_so=~/archlinux_my_config/CONFIG_FILES/dwm/

# dmenu source directory
dmenu_so=~/archlinux_my_config/CONFIG_FILES/dmenu/

# st source directory
st_so=~/archlinux_my_config/CONFIG_FILES/st/

# sl source directory
sl_so=~/archlinux_my_config/CONFIG_FILES/slstatus/

# alacritty source directory
alacritty_so=~/archlinux_my_config/CONFIG_FILES/alacritty/

# copy folder to .config folder
cp -r $dwm_so $conf_dir
cp -r $dmenu_so $conf_dir
cp -r $st_so $conf_dir
cp -r $sl_so $conf_dir
cp -r $alacritty_so $conf_dir

# compile the configuration
cd $conf_dir/dwm/ && sudo make clean install && cd $conf_dir/dmenu/ && sudo make clean install && cd $conf_dir/st/ && sudo make clean install && cd $conf_dir/slstatus/ && sudo make clean install && cd ~/archlinux_my_config

sleep 5s

# run the script in archlinux_my_config
sh setup.sh

cd ~/

popd

function goodbye() {

  title="\Z1 Success! operation done!"
  b_title="\Z4 please reboot your system!"
  MSG="\Z2 your setup has been done now please reboot the system"

  dialog --clear \
    --colors \
    --title "$title" \
    --backtitle "$b_title" \
    --msgbox "$MSG" \
    14 60

  # back to home directory
  cd ~/

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
