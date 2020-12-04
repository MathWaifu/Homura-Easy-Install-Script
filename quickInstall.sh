#!/bin/bash

# Build the package installer and install basic packages
pkg -y
pky install kde5 xorg dbus Homura

# Setup for the Plasma dekstop
sysrc dbus_enable="YES"
sysrc kld_list="linux"
echo 'linux_enable="YES"' >> /boot/loader.conf
echo exec start-session startplasma-x11 >> ~/.xinitrc
ln -s ~/.xinitrc ~/.xsession

# Start the Plasma desktop and Homura
startplasma-x11
Homura
