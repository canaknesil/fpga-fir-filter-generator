#!/bin/sh

filename="causalFirFilter.bit"

udevadm control --reload-rules
udevadm trigger

djtgcfg init -d Basys2
djtgcfg prog -d Basys2 -i 0 -f $filename

