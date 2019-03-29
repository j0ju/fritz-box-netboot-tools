# Small TFTP root

This creates a minimal Grub2 image for booting via TFTP with a later handover to
the NAS internal webserver of the Fritz!Box.

## Files

 * grub-i386-pc-core.cfg - grub config to be embedded into the grub
 * mk-grub-i386-pc-core.sh - generates /grub-i386-pc-core.0
 * install.sh - installs the structure below to an host given as $1 to /srv/tftp
 * README.md - this file

## Directory Tree in TFTP root

 * /grub-i386-pc-core.0
 * /grub
 * /grub/i386-pc
 * /grub/i386-pc/core.0 - symbolic link to -> ../../grub-i386-pc-core.0


