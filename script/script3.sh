#!/bin/bash

# Script 3: Disk and Permission Auditor
# Author: Vineet Salve

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "========================================"
echo "        Directory Audit Report"
echo "========================================"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld $DIR | awk '{print $1, $3, $4}')
        SIZE=$(du -sh $DIR 2>/dev/null | cut -f1)

        echo "$DIR"
        echo "Permissions : $PERMS"
        echo "Size        : $SIZE"
        echo "----------------------------------------"
    else
        echo "$DIR does not exist on this system"
        echo "----------------------------------------"
    fi
done

# --- Git config directory check ---
echo "Checking Git configuration directory..."
GIT_CONFIG="$HOME/.gitconfig"

if [ -f "$GIT_CONFIG" ]; then
    PERMS=$(ls -l $GIT_CONFIG | awk '{print $1, $3, $4}')
    echo "Git config file found: $GIT_CONFIG"
    echo "Permissions : $PERMS"
else
    echo "Git config file not found in home directory"
fi

echo "========================================"
