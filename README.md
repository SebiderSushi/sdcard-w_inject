# SDCard R/W injector
```
DISCLAIMER:
During my tests, the worst case caused by this module was that neither the "internal shared storage" nor my Micro SD Card could be mounted.
I developed this module in best faith. I tried to make it as minimal as possible and believe that it is non-destructive.
However, this module still changes how core funtions of your device work and i am unable to test it on every version of android from every possible OEM out there. I am not an expert on these things and will not provide any kind of guarantee.
The only way to be 100% safe from data loss is backing up both your internal storage and SD Card before trying out this module.
I am not responsible for your actions.
```

## About
This module is aimed at enabling "legacy SD Card write access".
It does so by injecting the `-w` parameter whenever the binary `/system/bin/sdcard` is executed.
This binary is used in AOSP to mount the SD Card or your "internal shared storage" in a way that emulates an sdcard-style filesystem. That is, a filesystem without file ownership and other troubles, so that applications can all happily read and write.
In its original AOSP implementation this binary has a `-w` switch that enables write access on the emulated directory. This option is usually ommitted if android mounts SD Cards. Googles reasoning behind this is unknown to me.

## When can i use this
**TL;DR: The easiest way to find out is to try.**  
Whether the approach used in this module works for you will depend on your specific android implementation.
In general, the following conditions must be met:
- Your ROM must use the binary `/system/bin/sdcard` for storage emulation
- Your version of `/system/bin/sdcard` must support the `-w` flag
- Your ROM must use the same SELinux context for `/system/bin/sdcard` as AOSP

## How to use this / troubleshooting
**Make sure that you have a custom recovery like TWRP, a root shell or rooted file manager at hand to disable the module if things go wrong.  
Chances are, that you can no longer launch Magisk Manager if this happens, so make sure that root is granted to your rescue tool of choice before installing the module.**

To use this you simply need to install the module and reboot. If your internal storage and SD Card appear after rebooting, then all went well and you can go ahead and check if your SD Card is writeable.

If your internal storage or SD Card are inaccessible after reboot, this module will unfortunately not work for you.  
Either use Magisk Manager to remove the module or create a file named `disable` in the module directory under `/data/adb/modules/` and reboot. After that, everything should return to normal and you should be able to use Magisk Manager to remove the module completely.

## Report issues / incompatibilities
If this module did not work for you and you decide to report this as an issue, make sure you include the following:  
(Boot with the module installed before gathering any of the mentioned data)
- The (contents of the) file `postfsdata.log` in the module directory under `/data/adb/modules/`
- Output of `logcat` (if you have privacy concerns, `logcat | grep sdcard` and `logact | grep vold` might be enough
- Output of `dmesg` (if you have privacy concerns, `dmesg | grep denied` might be enough
