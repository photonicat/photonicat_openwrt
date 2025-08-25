#!/bin/sh

FIRSTRUN_DONE="0"

BOOTFS_UCI_INDEX=$(uci show fstab | grep mmcblk0p1 | cut -f2 -d'.' 2>/dev/null)

if [ x"${BOOTFS_UCI_INDEX}" != x"" ]; then
    mkdir -p /boot
    uci set fstab.${BOOTFS_UCI_INDEX}.target='/boot'
    uci set fstab.${BOOTFS_UCI_INDEX}.options='ro'
    uci commit fstab
fi

if [ ! -f /etc/pcat-wlan-init-completed ]; then
    /usr/bin/pcat-wifi-config-reset
else
    touch "/tmp/pcat-wifi-ready.tmp"
fi

if [ -f "/tmp/pcat-wifi-ready.tmp" ]; then
    FIRSTRUN_DONE="1"
    echo "1" >/etc/pcat-wlan-init-completed
fi

if [ x"${FIRSTRUN_DONE}" = x"1" ]; then
    rm -f /usr/bin/pcat-firstrun.sh
fi
