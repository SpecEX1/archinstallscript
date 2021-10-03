mkfs.fat -F32 /dev/vda1
mkfs.ext4 /dev/vda3
mkswap /dev/vda2
mount /dev/vda3 /mnt
mkdir /mnt/boot
mount /dev/vda1 /mnt/boot
swapon /dev/vda2
pacstrap /mnt base base-devel linux linux-firmware neovim git
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/America/Detroit /etc/localtime
hwclock --systohc
