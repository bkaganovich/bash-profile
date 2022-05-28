# Fresh Installation Configuration Generator

## Requirements
Requires Ruby language installed.

To check if Ruby is already installed run: `ruby --version`

**Debian**  
`sudo apt install ruby`

**Arch**  
`sudo pacman -S ruby`

**Fedora**  
`sudo dnf install ruby`

## Description

### bash_profile.rb  
Generates `.bash_profile` configuration file based on distribution's package manager and desktop environment.

It can be run by providing distribution (i.e. deb/arch/fedora) and desktop environment (i.e. xfce/kde/gnome) in argument vector to avoid the prompts: `./bash_profile.rb deb xfce`

Source the generated profile in shell: `. .bash_profile`

__Example Output__
```sh  
$ ./bash_profile.rb  
Enter distro (deb/arch/fedora): deb  
Enter desktop environment (xfce/kde/gnome): xfce  
  
/home/user/configs/.bash_profile written succesfully.  
```  
```sh
$ cat .bash_profile
export PATH=~/runz:$PATH
alias map='sudo arp-scan 192.168.1.0/24'
alias docs='cd ~/Documents'
alias dl='cd ~/Downloads'
alias usb='cd /media/usb'
alias g='git status'
alias ga='git add -A'
alias ls='ls -1 --color'
alias up='sudo apt update && sudo apt upgrade' #debian
alias install='sudo apt install' #debian
alias remove='sudo apt remove' #debian
alias t='thunar . &' #xfce
```
### fresh_install.rb  
Generates `fresh_install.sh` file for removal and installation of desired packages.

It can also be run by providing distribution (i.e. deb/arch/fedora) in argument vector to avoid the prompts: `./fresh_install.rb arch`

Run the generated shell script to remove and install desired packages: `sh fresh_install.sh`

__Example Output__
```sh
$ ./fresh_install.rb
Enter distro (deb/arch/fedora): arch

/home/user/configs/fresh_install.sh written successfully.
```
```sh
$ cat fresh_install.sh 
#!/bin/bash
sudo pacman -R transmission thunderbird
sudo pacman -S vim git htop qbittorrent gparted redshift nmap arp-scan simple-scan retext
```