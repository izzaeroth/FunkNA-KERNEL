#!/system/bin/sh

F=/sdcard/jamiethemorris-dyn-fsync

enabled=1

if grep jamiethemorris /proc/version > /dev/null
then
	if [ -r $F ]
	then
    	value="`head -1 $F`"
	    if [ "$value" = "1" ]
	    then
		enabled=1
		echo "Dynamic Fsync is enabled"
		else
		enabled=0
		echo "Dynamic Fsync is disabled"
		fi
	fi

	echo $enabled > /sys/kernel/dyn_fsync/Dyn_fsync_active
fi

