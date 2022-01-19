# simple_arch
> simple arch is will make you easy to setup arch linux with dwm 






## Install 

> type the following code below : 
> `git clone https://github.com/farookphuket/simple_arch.git && cd ~/simple_arch && sh setup.sh`



# Install Arch Linux Farook's way
> install arch linux is not easy but it is not either difficult so please 
> check this video! it's maybe can help you some.
> good luck


[![watch how to install arch linux on laptop](http://img.youtube.com/vi/yD3ub-qQGZY/0.jpg)](http://www.youtube.com/watch?v=yD3ub-qQGZY "")



## The icons theme I use now

> the icon theme call "revengeShip"


[regen_blue]:https://i.ibb.co/sRnBBTS/2021-04-28-icons.png

![my icon theme][regen_blue]


---

[cursor_theme]:https://i.ibb.co/J581Fxb/Cursor-themes.png

[icon_theme]:https://i.ibb.co/zGRGnJm/Cursor-themes-1.png


## Cursor Theme


![cursor theme][cursor_theme]




## Icon Theme

![icon theme][icon_theme]



# Report

### ============ date 19 Jan 2022
> today (19 Jan 2022 at 07:43 a.m.) I almost have to re-install arch-linux
> as I have done it as my huge mistaken before!
> The problem that I have face today was I cannot boot into my arch-os just
> after I run `pamac update` to upgrade the package on my system but after the
> upgrade done and I have re-boot all I got is just the bios boot which is make
> me shock for a long while before I can think of why? without search on google
> I just try to find my install archlinux usb then plug it in as the following
> step as my blue screen bios boot has shown.
> well this is `grub-recover` step okay? so do not get me wrong!

- plug the arch-linux install usb then press the power button to boot from usb
- I type `iwctl` as I do not have any wire connection to my laptop so I need
the internet I type `device list` to see what is the device then I found wlan0
now I know what is the interface for my network I then type
`station wlan0 get-networks` just to get the wifi network I share the wifi from
my phone my network name is "netDtac" so to connect to it network I type
`station wlan0 connect netDtac` hit Enter then I put my wifi password in hit
Enter now it connected then I type `exit` to quit out of iwctl.
- now make sure I have the internet access by send ping to google
`ping google.com` I've got a reply the next thing to do is check the media by
type `lsblk` so I've got my hard-dive name "nvme0" that has the partition as
`nvme0n1p1`,`nvme0n1p2`,`nvme0n1p3` so my command to mount is
> `mount /dev/nvme0n1p2 /mnt`
> `mount /dev/nvme0n1p1 /boot`
if I type 'lsblk' command again this shoud mount the media for me next command
is `arch-chroot /mnt /bin/bash` now I am ready to install grub.
- I type
> `grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub`

- if the above has no error the next command is below but if there any error
cannot install grub make sure you have correct when you type the command.
> `grub-mkconfig -o /boot/grub/grub.cfg`

- that's it for grub re-cover now I can type `exit` then `umount -R /mnt` then
`reboot` and my arch-linux os should be boot up again.

> so try it because it's work for me it's maybe will work for you as well.

