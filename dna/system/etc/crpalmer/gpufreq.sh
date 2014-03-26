#!/system/bin/sh

F=/sdcard/jamiethemorris-gpu-oc

gpufreq=400000000

if grep jamiethemorris /proc/version > /dev/null
then

	if [ -r $F ]
	then
	    value="`head -1 $F`"
	    if [ "$value" = "450" ]
	    then
		gpufreq=450000000
	    else
	        if [ "$value" = "500" ]
	        then
		    gpufreq=500000000
		    else
	        	if [ "$value" = "533" ]
	        	then
			    gpufreq=533000000
			else
		    	    gpufreq=400000000
		    fi
	    	fi
	    fi
	    echo "setting max GPU frequency to $value MHz"
	else
	    gpufreq=400000000
	    echo "setting max GPU frequency to 400 MHz"
	fi

	echo $gpufreq > /sys/devices/platform/kgsl-3d0.0/kgsl/kgsl-3d0/max_gpuclk
	
fi
