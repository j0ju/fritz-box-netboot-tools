UBUNTU_MIRROR=http://de.archive.ubuntu.com/ubuntu/

mkdir -p grub images

cp -a /usr/lib/grub/i386-pc grub

#wget $UBUNTU_MIRROR/dists/xenial/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/linux -O images/xenial-netinst.kernel
#wget $UBUNTU_MIRROR/dists/xenial/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/initrd.gz -O images/xenial-netinst.initrd
#
#wget $UBUNTU_MIRROR/dists/xenial-updates/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/linux -O images/xenial-updates-netinst.kernel
#wget $UBUNTU_MIRROR/dists/xenial-updates/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/initrd.gz -O images/xenial-updates-netinst.initrd

wget $UBUNTU_MIRROR/dists/xenial-updates/main/installer-amd64/current/images/hwe-netboot/ubuntu-installer/amd64/linux -O images/xenial-hwe-netinst.kernel
wget $UBUNTU_MIRROR/dists/xenial-updates/main/installer-amd64/current/images/hwe-netboot/ubuntu-installer/amd64/initrd.gz -O images/xenial-hwe-netinst.initrd

wget $UBUNTU_MIRROR/dists/bionic/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/linux -O images/bionic-netinst.kernel
wget $UBUNTU_MIRROR/dists/bionic/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/initrd.gz -O images/bionic-netinst.initrd
