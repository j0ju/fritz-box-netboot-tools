#!/bin/sh
set -e

HOST="$1"

if ! ssh "$HOST" /bin/true; then
  echo "E: host '$HOST' not reachable"
  exit 1
fi

sh mk-grub-i386-pc-core.sh

ssh "$HOST" ' set -x;
  mkdir -p /srv/tftp/grub/i386-pc;
  chmod 755 /srv /srv/tftp /srv/tftp/grub /srv/tftp/grub/i386-pc;
'

scp grub-i386-pc-core.0 "$HOST:/srv/tftp/grub/i386-pc/core.0"

ssh "$HOST" ' set -x;
  chmod 644 /srv/tftp/grub/i386-pc/core.0;
'
