#!/bin/bash

# 1. Install required tools
sudo apt-get install debootstrap squashfs-tools genisoimage

# 2. Extract Debian ISO
# - Download Debian ISO manually and move it to /mnt (or your preferred work environment)
# - Replace "debian.iso" with the actual ISO filename

# 3. Mount the ISO
mkdir iso_mount
sudo mount -o loop /mnt/debian.iso iso_mount

# 4. Create the necessary mount points inside iso-mount
sudo mkdir -p iso_mount/proc
sudo mkdir -p iso_mount/sys
sudo mkdir -p iso_mount/dev
sudo mkdir -p iso_mount/dev/pts

# 5. Mount the root filesystem
sudo mount --bind / iso_mount

# Mount virtual filesystems
sudo mount -t proc none iso_mount/proc
sudo mount -o bind /sys iso_mount/sys
sudo mount -o bind /dev iso_mount/dev
sudo mount -o bind /dev/pts iso_mount/dev/pts

# Optional: If you're using a separate boot partition
# sudo mkdir -p iso_mount/boot
# sudo mount --bind /boot iso_mount/boot

# 6. Create a Working Directory
# - Copy ISO contents to a working directory
mkdir custom_debian
cp -r iso_mount/* custom_debian

# 7. Make Customizations
# - Chroot into the system
sudo chroot custom_debian
