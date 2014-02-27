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
		echo "intelliplug is enabled"
		echo "eco mode is disabled"
		elif [ "$value" = "eco" ]
		then
		enabled=1
		eco=1
		echo "intelliplug is enabled"
		echo "eco mode is enabled"
		else
		enabled=0
		eco=0
		echo "intelliplug is disabled"
		echo "eco mode is disabled"
		fi
	fi

	echo $enabled > /sys/module/intelli_plug/parameters/intelli_plug_active
	echo $eco > /sys/module/intelli_plug/parameters/eco_mode_active
fi

