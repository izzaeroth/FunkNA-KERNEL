#!/system/bin/sh

F=/sdcard/jamiethemorris-s2w

enabled=1

if grep jamiethemorris /proc/version > /dev/null
then
	if [ -r $F ]
	then
    	value="`head -1 $F`"
	    if [ "$value" = "1" ]
	    then
		enabled=1
		echo "sweep2wake is enabled"
		else
		enabled=0
		echo "sweep2wake is disabled"
		fi
	else
	enabled=1
	echo "sweep2wake is enabled"
	fi

	echo $enabled > /sys/android_touch/sweep2wake
fi

