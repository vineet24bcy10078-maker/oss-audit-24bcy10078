#!/bin/bash

# Script 1: System Identity Report
# Author: Vineet Salve | Course: Open Source Software

# --- Variables ---
STUDENT_NAME="Vineet Salve"
SOFTWARE_CHOICE="Git"

# --- System Info ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)
DATE_TIME=$(date)
HOME_DIR=$HOME
DISTRO=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')

CPU=$(lscpu | grep "Model name" | cut -d: -f2)
RAM=$(free -h | awk '/Mem:/ {print $2}')
DISK=$(df -h / | awk 'NR==2 {print $2, $3, $4}')

# --- Display ---
echo "========================================"
echo "   Open Source Audit — $STUDENT_NAME"
echo "========================================"
echo "Software        : $SOFTWARE_CHOICE"
echo "----------------------------------------"
echo "OS              : $DISTRO"
echo "Kernel          : $KERNEL"
echo "User            : $USER_NAME"
echo "Home Directory  : $HOME_DIR"
echo "Uptime          : $UPTIME"
echo "Date & Time     : $DATE_TIME"
echo "----------------------------------------"
echo "CPU             : $CPU"
echo "RAM             : $RAM"
echo "Disk Usage      : $DISK"
echo "----------------------------------------"
echo "License         : GNU General Public License (GPL)"
echo "========================================"
