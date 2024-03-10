# custom-debian-iso

## Customizing Debian ISO

## 1. Set Up a Build Environment

### Install Necessary Tools
Make sure you have the required tools installed on your system. You'll typically need tools like `debootstrap`, `chroot`, and `mkisofs`. Install them using your package manager.

```bash
sudo apt-get install debootstrap squashfs-tools genisoimage
```

## 2. Extract Debian ISO

### Mount the ISO
Create a directory to mount the ISO and then mount the Debian ISO into that directory.

```bash
mkdir ~/iso_mount
sudo mount -o loop debian.iso ~/iso_mount
```

## 3. Create a Working Directory

### Copy ISO Contents
Copy the contents of the ISO to a working directory where you can make modifications.

```bash
mkdir ~/custom_debian
cp -r ~/iso_mount/* ~/custom_debian
```

## 4. Make Customizations

### Chroot into the System
Use `chroot` to enter the Debian system in the working directory. This allows you to make changes as if you were inside a live Debian environment.

```bash
sudo chroot ~/custom_debian
```

## 5. Update Package Lists

### Update APT Repositories
Ensure that the APT package lists are updated within the chroot environment.

```bash
sudo apt update -y
```
