#!/bin/sh
# Note that you can only do one USB drive at a time. The script attempts to find the path of the

# USB drive by checking the system logs for the last disk attached.



# Find USB device path by checking system logs for last "dev" device attached.

devpath="/dev/$(dmesg | grep -P -o sd[a-z][0-9] | tail -1)"

if [ -z "$devpath" ]; then
    echo "Failed to find USB device in dmesg."
    exit 1
else
    echo "Found USB device at $devpath"
    echo ""
fi

# Mount USB drive at $devpath, capture output

usb="$(udisksctl mount -b $devpath)"

# See if mount was successful; if so, regex below will return path like "/media/dbsoundman/USBDISK".

usbmount="$(echo "$usb" | grep -P -o "\/media\/[A-Za-z0-9]+\/[A-Za-z0-9]+")"

# If mount was unsuccessful, the first word will be "Error".

usberror="$(echo "$usb" | grep -o Error)"
