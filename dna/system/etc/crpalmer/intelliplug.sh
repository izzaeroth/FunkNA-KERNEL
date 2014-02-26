#!/system/bin/sh

F=/sdcard/jamiethemorris-intelliplug

enabled=1
eco=0

if grep jamiethemorris /proc/version > /dev/null
then
	if [ -r $F ]
	then
    	value="`head -1 $F`"
	    if [ "$value" = "1" ]
    	then
		enabled=1
		eco=0
		elif [ "$value" = "eco" ]
		then
		enabled=1
		eco=1
		else
		enabled=0
		eco=0
		fi
	fi

	echo $enabled > /sys/module/intelli_plug/parameters/intelli_plug_active
	echo $eco > /sys/module/intelli_plug/parameters/eco_mode_active
fi

