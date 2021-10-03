mkfs.fat -F32 /dev/vda1
mkfs.ext4 /dev/vda3
mkswap /dev/vda2
mount /dev/vda3 /mnt
mkdir /mnt/boot
mount /dev/vda1 /mnt/boot
swapon /dev/vda2
pacstrap /mnt base base-devel linux linux-firmware nano
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/America/Detroit /etc/localtime
hwclock --systohc
# Uncomment en_US.UTF-8 UTF-8
nano /etc/locale.gen
locale-gen
# LANG=en_US.UTF-8
nano /etc/locale.conf
# myhostname
nano /etc/hostname
mkinitcpio -P
passwd
pacman -Sy grub efibootmgr
# Add --removable after --efi-directory=esp if installing on a removable drive or have an MSI motherboard
grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
exit
reboot
