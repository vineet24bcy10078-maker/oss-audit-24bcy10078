#!/bin/bash

# Script 2: FOSS Package Inspector
# Author: Vineet Salve

PACKAGE="git"

echo "========================================"
echo "      FOSS Package Inspector"
echo "========================================"
echo "Checking package: $PACKAGE"
echo "----------------------------------------"

# --- Check if package exists ---
if command -v $PACKAGE &> /dev/null; then
    echo "Status          : INSTALLED ✅"

    # Version info
    VERSION=$($PACKAGE --version)
    echo "Version         : $VERSION"

    # Binary location
    PATH_LOC=$(which $PACKAGE)
    echo "Binary Path     : $PATH_LOC"

    # Package manager detection
    if command -v dpkg &> /dev/null; then
        echo "Package Manager : Debian-based (APT)"
        dpkg -l | grep "^ii" | grep $PACKAGE
    elif command -v rpm &> /dev/null; then
        echo "Package Manager : RPM-based"
        rpm -qi $PACKAGE | grep -E "Version|License|Summary"
    else
        echo "Package Manager : Unknown"
    fi

else
    echo "Status          : NOT INSTALLED ❌"

    # Suggest installation command
    if command -v apt &> /dev/null; then
        echo "Install using   : sudo apt install $PACKAGE"
    elif command -v dnf &> /dev/null; then
        echo "Install using   : sudo dnf install $PACKAGE"
    elif command -v yum &> /dev/null; then
        echo "Install using   : sudo yum install $PACKAGE"
    else
        echo "Install method  : Unknown package manager"
    fi
fi

echo "----------------------------------------"

# --- Case statement: philosophy + description ---
case $PACKAGE in
    git)
        echo "About Git:"
        echo "Git is a distributed version control system designed for speed and collaboration."
        echo "It allows developers to track changes, manage code versions, and work independently."
        echo "License: GPL v2 — ensures all modifications remain open."
        ;;
    vlc)
        echo "VLC: Plays almost any media format, built by open-source contributors."
        ;;
    firefox)
        echo "Firefox: A privacy-focused browser promoting an open web."
        ;;
    apache2|httpd)
        echo "Apache: One of the most widely used web servers powering the internet."
        ;;
    *)
        echo "Open-source software: built by communities, shared with everyone."
        ;;
esac

echo "========================================"
