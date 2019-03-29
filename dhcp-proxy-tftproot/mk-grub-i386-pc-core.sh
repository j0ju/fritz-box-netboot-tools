set -e
set -x

TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT QUIT TERM INT

mkdir -p "$TMPDIR"/stage1pxe
cp grub-i386-pc-core.cfg "$TMPDIR"/stage1pxe/grub.cfg

tar cvf "$TMPDIR/grub-i386-pc-core.tar" -C "$TMPDIR" stage1pxe

/usr/bin/grub-mkimage \
   -O i386-pc-pxe --output=grub-i386-pc-core.0 -m "$TMPDIR/grub-i386-pc-core.tar" -p "(memdisk)/stage1pxe" \
     pxe tftp http tar gzio memdisk loopback \
     extcmd gettext gzio normal terminal echo eval file configfile cat ls sleep serial terminfo test read true \
     reboot minicmd \
     linux linux16 chain boot pxechain \
     biosdisk part_msdos part_gpt \
     regexp search search_fs_file \
     loadenv \
     ext2 fat ntfs lvm mdraid1x crypto \
     \
# eo

exit $?

# this are loaded by the 2nd stage grub.cfg
     blocklist font halt hdparm \
     hwmatch keylayouts keystatus loopback lsacpi \
     lsmmap lspci memrw minicmd mmap net parttool pcidump probe \
     search_fs_uuid search_label sendkey \
     setpci time tr \

