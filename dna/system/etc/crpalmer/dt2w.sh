#!/system/bin/sh

F=/sdcard/jamiethemorris-dt2w

enabled=1

if grep jamiethemorris /proc/version > /dev/null
then
	if [ -r $F ]
	then
    	value="`head -1 $F`"
	    if [ "$value" = "1" ]
    	then
		enabled=1
		echo "doubletap2wake is enabled"
		else
		enabled=0
		echo "doubletap2wake is disabled"
		fi
	fi

	echo $enabled > /sys/android_touch/doubletap2wake
fi

