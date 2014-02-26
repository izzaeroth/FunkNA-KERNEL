#!/system/bin/sh

F=/sdcard/jamiethemorris-dt2s

enabled=1

if grep jamiethemorris /proc/version > /dev/null
then
	if [ -r $F ]
	then
    	value="`head -1 $F`"
	    if [ "$value" = "1" ]
	    then
		enabled=1
		echo "doubletap2sleep is enabled"
		else
		enabled=0
		echo "doubletap2sleep is disabled"
		fi
	fi

	echo $enabled > /sys/android_touch/doubletap2sleep
fi

