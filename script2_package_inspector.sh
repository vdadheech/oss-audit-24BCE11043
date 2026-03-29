#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Vaidehi Dadheech | Course: Open Source Software
# Purpose: Checks if the Linux kernel package is installed,
#          shows version info, and prints philosophy notes
#          using a case statement for known FOSS packages.

# --- Detect package manager ---
if command -v dpkg &>/dev/null; then
    PKG_MANAGER="dpkg"
elif command -v rpm &>/dev/null; then
    PKG_MANAGER="rpm"
else
    echo "No supported package manager found."
    exit 1
fi

echo "========================================"
echo "  FOSS Package Inspector"
echo "  Author: Vaidehi Dadheech"
echo "  Package Manager: $PKG_MANAGER"
echo "========================================"
echo ""

# --- if-then-else: check if kernel is installed ---
if [ "$PKG_MANAGER" = "dpkg" ]; then
    if dpkg -l | grep -q "linux-image"; then
        echo "[INSTALLED] Linux Kernel package detected."
        echo ""
        echo "--- Installed Kernel Versions ---"
        dpkg -l | grep "linux-image" | awk '{print $2, $3}'
    else
        echo "[NOT FOUND] No linux-image package found."
    fi
else
    if rpm -q kernel &>/dev/null; then
        echo "[INSTALLED] kernel package found."
        rpm -qi kernel | grep -E 'Version|License|Summary'
    else
        echo "[NOT FOUND] kernel package not installed."
    fi
fi

echo ""
echo "--- Currently Running Kernel ---"
echo "Version      : $(uname -r)"
echo "Architecture : $(uname -m)"

echo ""
echo "========================================"
echo "  FOSS Philosophy Notes — Vaidehi Dadheech"
echo "========================================"

# --- for loop + case statement: philosophy note per package ---
for SOFTWARE in "linux-kernel" "httpd" "mysql" "firefox" "git"; do
    case $SOFTWARE in
        linux-kernel)
            echo "Linux Kernel : Born from a student's frustration in 1991,"
            echo "               now the foundation every modern system runs on."
            ;;
        httpd)
            echo "Apache HTTPD : Proved that community development can power"
            echo "               30% of all websites globally."
            ;;
        mysql)
            echo "MySQL        : Open source at its core, yet powers"
            echo "               billion-dollar commercial applications."
            ;;
        firefox)
            echo "Firefox      : A nonprofit's fight to keep the web"
            echo "               open, free, and free from surveillance."
            ;;
        git)
            echo "Git          : Linus built it in two weeks when his"
            echo "               proprietary VCS failed him — then gave it away."
            ;;
    esac
done
