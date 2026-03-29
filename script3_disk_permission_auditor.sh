#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Vaidehi Dadheech | Course: Open Source Software
# Purpose: Loops through key system directories and reports
#          permissions, ownership, and disk usage for each.
#          Includes a special check for Linux Kernel directories.

# --- List of standard system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/boot" "/proc" "/sys")

echo "=============================================="
echo "  Linux Kernel — Directory Audit Report"
echo "  Author: Vaidehi Dadheech"
echo "  Date: $(date '+%d %B %Y %H:%M')"
echo "=============================================="
echo ""
printf "%-28s %-26s %-8s\n" "Directory" "Permissions/Owner/Group" "Size"
echo "--------------------------------------------------------------"

# --- for loop: iterate over each directory ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # awk extracts: $1=permissions, $3=owner, $4=group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # du -sh gives human-readable size; suppress permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "%-28s %-26s %-8s\n" "$DIR" "$PERMS" "$SIZE"
    else
        printf "%-28s %s\n" "$DIR" "[ Does not exist on this system ]"
    fi
done

echo ""
echo "=============================================="
echo "  Linux Kernel — Special Directory Check"
echo "=============================================="

# --- Check kernel-specific directories ---
KERNEL_DIRS=("/boot" "/lib/modules/$(uname -r)" "/proc/sys" "/sys/kernel")

for KDIR in "${KERNEL_DIRS[@]}"; do
    if [ -d "$KDIR" ]; then
        KPERMS=$(ls -ld "$KDIR" | awk '{print $1, $3, $4}')
        echo "[EXISTS]  $KDIR"
        echo "          Permissions: $KPERMS"
    else
        echo "[MISSING] $KDIR — not found on this system"
    fi
    echo ""
done

# --- Check for kernel config file ---
KCONFIG="/boot/config-$(uname -r)"
echo "--- Kernel Config File ---"
if [ -f "$KCONFIG" ]; then
    echo "[FOUND] $KCONFIG"
    ls -lh "$KCONFIG" | awk '{print "  Size:", $5, "| Permissions:", $1}'
else
    echo "[NOT FOUND] $KCONFIG"
fi
