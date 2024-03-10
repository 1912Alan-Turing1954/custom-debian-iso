# custom-debian-iso

## Customizing Debian ISO

## 1. Set Up a Build Environment

### Install Necessary Tools
Make sure you have the required tools installed on your system. You'll typically need tools like `debootstrap`, `chroot`, and `mkisofs`. Install them using your package manager.

```bash
sudo apt-get install debootstrap squashfs-tools genisoimage
```

# 2. Extract Debian ISO

### Mount the ISO
Create a directory to mount the ISO and then mount the Debian ISO into that directory.

```bash
mkdir ~/iso_mount
sudo mount -o loop debian.iso ~/iso_mount
```
