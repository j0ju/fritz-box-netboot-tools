# PXE boot for AVM Fritz!Box environments

 * does not need modification of Fritz!Box firmware
 * needs another piece of hardware like a OpenWRT box, a Raspberry Pi or something else -> called "2nd box"
 * Uses DHCP proxy mode and TFTP service of DNSMasq for an initial boot of grub2 via PXE and TFTP from the "2nd box"
    * it than shifts to use the Fritz!Box NAS feature

## Contents
 * dhcp-proxy - minimalistic DNCP augmentation proxy, PXE service and TFTP daemon,
   placed on the 2nd box
 * dhcp-proxy-tftproot - builds a minimalistic grub2 image which then hands over boot process to the Fritz!Box NAS accessible via HTTP
   placed on the 2nd box
 * tftproot-grub - prepares directory structure for putting on the Fritz!Box
   placed on Fritz!NAS

