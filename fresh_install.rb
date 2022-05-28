#!/usr/bin/env ruby

# File: fresh_install.rb
# Creates script to remove and install desired packages after fresh installion

remove = [
    "transmission",
    "thunderbird"]

install = [
    "vim",
    "git",
    "htop",
    "qbittorrent",
    "gparted",
    "redshift",
    "nmap",
    "arp-scan",
    "simple-scan",
    "retext"]

distro = ARGV[0]
if ARGV.empty?
    print "Enter distro (deb/arch/fedora): "
    distro = gets.chomp
end

case distro
when "deb"
    cmd_install = "sudo apt install "
    cmd_remove= "sudo apt purge "
when "arch"
    cmd_install = "sudo pacman -S "
    cmd_remove = "sudo pacman -R "
when "fedora"
    cmd_install = "sudo dnf install "
    cmd_remove = "sudo dnf remove "
end

filename = File.expand_path("fresh_install.sh")
content = "#!/bin/bash\n" +
    cmd_remove + remove.join(' ') + "\n" +
    cmd_install + install.join(' ') + "\n"

File.write(filename, content)

puts "\n#{filename} written successfully."
