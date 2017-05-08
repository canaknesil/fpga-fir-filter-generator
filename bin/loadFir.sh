#!/bin/sh


progdir="../"
bitfile="causalFirFilter.bit"
vhdltop="causalFirFilter.vhd"

cd $progdir

if [ -f "build/"$vhdltop ]
then
	
	cp resources/causal-fir-filter-vhdl/* build
	cd build
	make
	
	if [ -f $bitfile ]
	then
		#load to fpga
		#sudo udevadm control --reload-rules
		#sudo udevadm trigger

		#djtgcfg init -d Basys2
		#djtgcfg prog -d Basys2 -i 0 -f $bitfile
		echo "bitfile created successfully."
	else
		echo "bit file could not be synthesized."
		cd $progdir
	fi
	

else
	echo "VHDL code could not be generated."
fi

#rm -R build/*





