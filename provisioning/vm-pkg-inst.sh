#!/bin/bash -e

# run as root


(
	sed 's/#.*//' \
	| grep -v '^[[:space:]]*$' \
	| xargs apt-get install --no-install-recommends -y
) <<EOF


# Basics
# ------

lsb-release
less rsync ssh-client
wget curl ca-certificates
pbzip2
nano vim


# File systems
# ------------

sshfs


# Compilers and development
# -------------------------

build-essential
binutils gcc g++ gfortran
python python-pip
autoconf automake autogen libtool make cmake
git git-doc git-gui
manpages


# Singularity (build) dependencies
# --------------------------------

libarchive-dev
squashfs-tools


# Utils
# -----

screen mc
zerofree sysstat nmon htop


# Desktop environment
# -------------------

software-properties-common
xubuntu-desktop
xfce4

chromium-browser
emacs
evince
gedit
meld
vim
vim-gnome


EOF

apt-get autoremove -y
apt-get clean
