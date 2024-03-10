# custom-debian-iso


## 1. Set Up a Build Environment

### Install Necessary Tools
Make sure you have the required tools installed on your system. You'll typically need tools like `debootstrap`, `chroot`, and `mkisofs`. Install them using your package manager.

```bash
sudo apt-get install debootstrap squashfs-tools genisoimage
```

## 2. Extract Debian ISO
Install the current Debian ISO image from the portained website or the following link. 
Move said ISO to your prefered work eviroment *"/home/user or /mnt"*.

### Mount the ISO
Create a directory to mount the ISO and then mount the Debian ISO into that directory.

```bash
mkdir ~/iso_mount
sudo mount -o loop debian.iso ~/iso_mount
```
## 3. Create the necessary mount points inside iso-mount
```bash
sudo mkdir -p iso-mount/proc
sudo mkdir -p iso-mount/sys
sudo mkdir -p iso-mount/dev
sudo mkdir -p iso-mount/dev/pts
```

## 4. Mount the root filesystem
```bash
sudo mount --bind / iso-mount
```
  # Mount virtual filesystems
  ```bash
  sudo mount -t proc none iso-mount/proc
  sudo mount -o bind /sys iso-mount/sys
  sudo mount -o bind /dev iso-mount/dev
  sudo mount -o bind /dev/pts iso-mount/dev/pts
  ```

## Optional: If you're using a separate boot partition
```bash
sudo mkdir -p iso-mount/boot
sudo mount --bind /boot iso-mount/boot
```
## 5. Create a Working Directory

### Copy ISO Contents
Copy the contents of the ISO to a working directory where you can make modifications.

```bash
mkdir ~/custom_debian
cp -r ~/iso_mount/* ~/custom_debian
```

## 6. Make Customizations

### Chroot into the System
Use `chroot` to enter the Debian system in the working directory. This allows you to make changes as if you were inside a live Debian environment.

```bash
sudo chroot ~/custom_debian
```

## 7. Update Package Lists

### Update APT Repositories
Ensure that the APT package lists are updated within the chroot environment.

```bash
sudo apt update -y
```

## 8. Install Additional Packages

### Install Desired Packages
Use `apt-get` to install any additional packages you want to include in your custom ISO.

```bash
apt-get install package_name
```

## 9. Configure the System

### Edit Configuration Files
Make changes to configuration files as needed. For example, you might customize `/etc/network/interfaces`, `/etc/hostname`, etc.

In this step, you can use a text editor to modify configuration files within the chroot environment. Update the necessary settings to customize the behavior of the Debian system according to your requirements.

## 10. Clean Up

### Remove Unnecessary Files
Clean up any temporary files and unnecessary packages to reduce the size of the custom ISO.

You can use commands like `apt-get autoremove` and `apt-get clean` within the chroot environment to remove unnecessary packages and clear package cache.

```bash
apt autoremove -y
apt-get clean 
```

## 10. Unmount and Create Custom ISO

### Unmount ISO
Unmount the original ISO.

```bash
sudo umount ~/iso_mount
```
## 11. Create New Custom ISO

### Create a New ISO
Create a new ISO image that includes your modifications.

```bash
sudo mkisofs -o custom_debian.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -J -R -V "Custom Debian ISO" ~/custom_debian
```

## 12. Test the Custom ISO

### Test in a Virtual Machine
Before distributing your custom ISO, test it in a virtual machine to ensure that it boots and functions as expected.


You can use virtualization software like VirtualBox or VMware to create a virtual machine and boot from the custom Debian ISO. Verify that the installation process and the customized configurations work correctly in the virtual environment.

