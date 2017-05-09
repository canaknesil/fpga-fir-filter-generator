#!/bin/sh


progdir="../"
bitfile="causalFirFilter.bit"
vhdltop="causalFirFilter.vhd"

cd $progdir

if [ -f "vhdl-build/"$vhdltop ]
then
	
	cp resources/causal-fir-filter-vhdl/* vhdl-build
	cd vhdl-build
	make
	
	if [ -f $bitfile ]
	then
		#load to fpga
		sudo udevadm control --reload-rules
		sudo udevadm trigger

		djtgcfg init -d Basys2
		djtgcfg prog -d Basys2 -i 0 -f $bitfile
	else
		echo "bit file could not be synthesized."
	fi
	
	cd $progdir

else
	echo "VHDL code could not be generated."
fi

rm -R vhdl-build-backup/*
mv vhdl-build/* vhdl-build-backup/





