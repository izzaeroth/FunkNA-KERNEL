#!/system/bin/sh

F=/sdcard/jamiethemorris-gpu-gov
GOV=/sys/class/kgsl/kgsl-3d0/pwrscale/trustzone/governor

if grep jamiethemorris /proc/version > /dev/null
then
	if [ -r $F ]
	then
    	value="`head -1 $F`"
	    echo "$value" > $GOV
	    wait 1
	    govset="`head -1 $GOV`"
	    wait 1
	    echo "setting GPU governor to $govset"
	fi
fi