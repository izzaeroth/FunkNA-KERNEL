#!/system/bin/sh

F=/sdcard/jamiethemorris-iosched
IO=/sys/block/mmcblk0/queue/scheduler

if grep jamiethemorris /proc/version > /dev/null
then
	if [ -r $F ]
	then
    	value="`head -1 $F`"
	    echo "$value" > $IO
	    ioset="`head -1 $F`"
	    echo "setting io scheduler to $ioset"
	else "not setting io scheduler"
	fi
fi
