#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}
# This script will be executed in post-fs-data mode
exec >"$MODDIR"/postfsdata.log 2>&1; date
cmp -s /system/bin/sdcard "$MODDIR"/system/bin/sdcard-orig && { echo "equal files"; exit 0; }
echo "copy original binary"; cp -Tpfc /system/bin/sdcard "$MODDIR"/system/bin/sdcard-orig
cmp -s /system/bin/sdcard "$MODDIR"/system/bin/sdcard-orig && { echo "copy success (equal files)"; exit 0; }
exit 1
