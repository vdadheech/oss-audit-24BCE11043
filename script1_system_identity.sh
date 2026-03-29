#!/bin/bash
# Script 1: System Identity Report
# Author: Vaidehi Dadheech | Course: Open Source Software
# Purpose: Displays a welcome screen with full system identity
#          info for the Linux Kernel OSS Audit project.

# --- Variables ---
STUDENT_NAME="Vaidehi Dadheech"
SOFTWARE_CHOICE="Linux Kernel"

# --- Gather system info using command substitution ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date '+%A, %d %B %Y %H:%M')
DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')

# --- Display the welcome screen ---
echo "========================================================"
echo "         Open Source Audit — $STUDENT_NAME"
echo "         Software Under Audit: $SOFTWARE_CHOICE"
echo "========================================================"
echo ""
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  User         : $USER_NAME"
echo "  Home         : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date/Time    : $CURRENT_DATE"
echo ""
echo "========================================================"
echo "  License: The Linux Kernel is licensed under the"
echo "  GNU General Public License version 2 (GPL v2)."
echo "  Anyone can run, study, modify, and redistribute"
echo "  the kernel — but modifications must stay open."
echo "========================================================"
