#!/bin/sh

firstboot -y
killall -USR1 pcat-manager
reboot
