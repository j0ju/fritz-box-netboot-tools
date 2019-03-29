#!/bin/sh /etc/rc.common
# Copyright (C) 2017 Joerg Jungermann

# http://blog.ociru.net/2013/03/11/pxe-with-a-fritzbox-without-modifications

# open ports 67/udp 68/udp 4011/udp


START=99
STOP=10

USE_PROCD=1

BIN="/usr/sbin/dnsmasq"
CONF="/etc/dhcp-proxy.conf"

OPTS=
OPTS="$OPTS --port=0"
OPTS="$OPTS --bind-dynamic"
OPTS="$OPTS --no-daemon"
OPTS="$OPTS --log-dhcp"

start_service() {
  INTERFACE="$(ip r s | grep default | grep -oE "dev [^ ]+")"
  INTERFACE="${INTERFACE#* }"

  GW="$(ip r s | grep default | grep -oE "via [^ ]+")"
  GW="${GW#* }"

  CIDR="$(ip a s dev $INTERFACE | awk '$1 == "inet" {print $2; exit 0}')"
  IP="${CIDR%/*}"
  TFTP_SERVER="$IP"

  # FIXME net address
  NET="${IP%.*}.0"

  OPTS="$OPTS --dhcp-range=$NET,proxy"

  # example, see /etc/dhcp-proxy.conf
  #OPTS="$OPTS --dhcp-boot=pxe.0,$IP,$TFTP_SERVER"
  #OPTS="$OPTS --pxe-service=x86PC,'NetBoot',pxe,$TFTP_SERVER"
  # example, see /etc/dhcp-proxy.conf
  #OPTS="$OPTS --dhcp-boot=/grub/i386-pc/core.0,$IP,0.0.0.0"
  #OPTS="$OPTS --pxe-service=x86PC,'NetBoot',/grub/i386-pc/core,0.0.0.0"

  procd_open_instance
  procd_set_param command "$BIN"
  procd_append_param command --conf-file="$CONF" $OPTS 
  procd_set_param respawn
  procd_close_instance
}

