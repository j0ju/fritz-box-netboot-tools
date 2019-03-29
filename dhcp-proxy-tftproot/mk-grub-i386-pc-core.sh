set -x

TMPDIR="$(mktemp -d)"
mkdir -p "$TMPDIR"/boot/grub
cp grub-i386-pc-core.cfg "$TMPDIR"/boot/grub/grub.cfg
rm -f grub-i386-pc-core.tar

tar cvf grub-i386-pc-core.tar -C "$TMPDIR" .

/usr/bin/grub-mkimage \
   -O i386-pc-pxe --output=grub-i386-pc-core.0 -m grub-i386-pc-core.tar \
     pxe tftp http tar gzio memdisk loopback \
     extcmd gettext gzio normal terminal echo eval file configfile cat ls sleep serial terminfo test read true \
     reboot minicmd \
     linux linux16 chain boot pxechain \
     biosdisk part_msdos part_gpt \
     regexp search search_fs_file \
     loadenv \
     ext2 fat ntfs \
# eo

exit $?


        crypto \
          \
        cpio ext2 fat \
        blocklist boot font halt hdparm help \
        hwmatch keylayouts keystatus loopback lsacpi \
        lsmmap lspci memrw minicmd mmap net parttool pcidump probe pxechain\
        search_fs_uuid search_label sendkey \
        setpci time tr \


