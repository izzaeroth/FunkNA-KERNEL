#!/system/bin/sh

VDD=/sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
F=/sdcard/jamiethemorris-pvs
if grep jamiethemorris /proc/version > /dev/null
then
#Get PVS number
#PVS="`cat /sys/module/acpuclock_krait/parameters/pvs_number`"
	if [ -r $F ]
	then
	     pvs=`head -1 $F`
	     echo "CPU's pvs is set to $pvs"
	     echo "overriding uv for 1836/1890/1917 MHz"
	     if [ "$pvs" = "1" ]
	     then
	     echo 1836000 1300000 > $VDD
	     echo 1890000 1325000 > $VDD
	     echo 1917000 1400000 > $VDD
	     echo 
	     elif [ "$pvs" = "2" ]
	     then
	     echo 1836000 1262500 > $VDD
	     echo 1890000 1275000 > $VDD
	     echo 1917000 1375000 > $VDD
	     elif [ "$pvs" = "3" ]
	     then
	     echo 1836000 1225000 > $VDD
	     echo 1890000 1250000 > $VDD
	     echo 1917000 1350000 > $VDD
	     elif [ "$pvs" = "4" ]
	     then
	     echo 1836000 1200000 > $VDD
	     echo 1890000 1225000 > $VDD
	     echo 1917000 1275000 > $VDD
	     elif [ "$pvs" = "?" ]
	     then
	     echo 1836000 1262500 > $VDD
	     echo 1890000 1275000 > $VDD
	     echo 1917000 1375000 > $VDD
	     fi
	else
	     echo "No undervolt override, missing $F"
	fi	
fi
