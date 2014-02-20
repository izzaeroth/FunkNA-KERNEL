#!/system/bin/sh

F=/sdcard/crpalmer-gpu-oc

gpufreq=400000000

if [ -r $F ]
then
    value="`head -1 $F`"
    if [ "$value" = "500" ]
    then
	gpufreq=500000000
    else
        if [ "$value" = "450" ]
        then
	    gpufreq=450000000
	else
	    gpufreq=400000000
    	fi
    fi
else
    gpufreq=400000000
fi

echo $gpufreq > /sys/devices/platform/kgsl-3d0.0/kgsl/kgsl-3d0/max_gpuclk

echo "maximum GPU clock set to $gpufreq MHz"
