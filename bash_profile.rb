#!/usr/bin/env ruby

# File: universal.rb
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
	aliases[8] = "alias up='sudo apt update && sudo apt upgrade' #debian"
when "arch"
	aliases[8] = "alias up='sudo pacman -Syu' #arch"
when "fedora"
	aliases[8] = "alias up='sudo dnf update' #fedora"
end

de = ARGV[1]
if ARGV.empty?
	print "Enter desktop environment (xfce/kde/gnome): "
	de = gets.chomp
	puts
end

case de
when "xfce"
	aliases[9] = "alias t='thunar . &' #xfce"
when "kde"
	aliases[9] = "alias d='dolphin . &' #kde"
when "gnome"
	aliases[9] = "alias n='nautilus . &' #gnome"
end

aliases.append('')

filename = ".bash_profile"
File.write(filename, aliases.join("\n"))

puts "#{filename} written succesfully."
