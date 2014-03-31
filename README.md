jamiethemorris's DNA Kernel

To build this kernel you should also checkout my build tools, based on crpalmer's:

git clone https://github.com/jamiethemorris/crpalmer-kernel-build-tools_jamiethemorris.git

You'll need to install the toolchain of your choice (I use the Cortex a15 toolchain here: http://forum.xda-developers.com/showthread.php?t=2098133) and update the configuration file

jamiethemorris-build-config

to point to your toolchain. Note that the checked in version is using ccache. If you don't want to bother installing that, just remove ccache from the config file.

You'll also need other installed components to build the kernel. At the minimum you'll need:

abootimg
java
lz4 (r91)
If you find more things that you need to install, update this file and send me a pull request or just send me a PM.

IMPORTANT: The latest version of lz4 doesn't work with this kernel and building with it will cause the kernel to fail to boot. Either build revision 91 from the source by using 'svn checkout http://lz4.googlecode.com/svn/trunk/@r91 lz4-read-only
' or simply copy the binary from this directory into /usr/bin or ~/bin.

Once everything is all configured

./build/build.sh

will compile the kernel and generate an update.zip file in the target dir specific in your config.
