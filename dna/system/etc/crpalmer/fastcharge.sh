#!/system/bin/sh

F=/sdcard/jamiethemorris-fastcharge

enabled=1

if grep jamiethemorris /proc/version > /dev/null
then
	if [ -r $F ]
	then
    	value="`head -1 $F`"
	    if [ "$value" = "1" ]
    		then
		enabled=1
		echo "fast charge is enabled"
		else
		enabled=0
		echo "fast charge is disabled"
		fi
	fi

	echo $enabled > /sys/kernel/fast_charge/force_fast_charge

fi

