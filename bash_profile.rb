#!/usr/bin/env ruby

# File: bash_profile.rb
# Create .bash_profile based on distribution and desktop environment

aliases = [
    "export PATH=~/runz:$PATH",
    "alias map='sudo arp-scan 192.168.1.0/24'",
    "alias docs='cd ~/Documents'",
    "alias dl='cd ~/Downloads'",
    "alias usb='cd /media/usb'",
    "alias g='git status'",
    "alias ga='git add -A'",
    "alias ls='ls -1 --color'"]

distro = ARGV[0]
if ARGV.empty?
    print "Enter distro (deb/arch/fedora): "
    distro = gets.chomp
end

case distro
when "deb"
    aliases.append("alias up='sudo apt update && sudo apt upgrade' #debian")
when "arch"
    aliases.append("alias up='sudo pacman -Syu' #arch")
when "fedora"
    aliases.append("alias up='sudo dnf update' #fedora")
end

de = ARGV[1]
if ARGV.empty?
    print "Enter desktop environment (xfce/kde/gnome): "
    de = gets.chomp
    puts
end

case de
when "xfce"
    aliases.append("alias t='thunar . &' #xfce")
when "kde"
    aliases.append("alias d='dolphin . &' #kde")
when "gnome"
    aliases.append("alias n='nautilus . &' #gnome")
end

aliases.append('')

filename = File.expand_path(".bash_profile")
File.write(filename, aliases.join("\n"))

puts "#{filename} written successfully."
