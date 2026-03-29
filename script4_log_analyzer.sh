#!/bin/bash
# Script 4: Log File Analyzer
# Author: Vaidehi Dadheech | Course: Open Source Software
# Purpose: Reads a log file line by line, counts lines
#          containing a keyword, and prints a summary.
# Usage:   ./script4_log_analyzer.sh /var/log/kern.log [KEYWORD]

# --- Command-line arguments ---
LOGFILE=$1
KEYWORD=${2:-"error"}   # Default keyword is 'error' if none given

# --- Counters ---
COUNT=0
LINE_NUM=0

# --- Validate that a file path was provided ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/kern.log error"
    exit 1
fi

# --- do-while style retry: try fallback log files if not found ---
ATTEMPTS=0
while [ ! -f "$LOGFILE" ]; do
    ATTEMPTS=$((ATTEMPTS + 1))
    echo "[Attempt $ATTEMPTS] Not found: $LOGFILE"

    if [ $ATTEMPTS -eq 1 ]; then
        LOGFILE="/var/log/kern.log"
        echo "  Trying fallback: $LOGFILE"
    elif [ $ATTEMPTS -eq 2 ]; then
        LOGFILE="/var/log/syslog"
        echo "  Trying fallback: $LOGFILE"
    else
        echo "Could not find a valid log file. Please provide one."
        exit 1
    fi
done

# --- Check if the file is empty ---
if [ ! -s "$LOGFILE" ]; then
    echo "Warning: $LOGFILE is empty. Nothing to analyze."
    exit 0
fi

echo "========================================"
echo "  Linux Kernel Log Analyzer"
echo "  Author: Vaidehi Dadheech"
echo "  Log File : $LOGFILE"
echo "  Keyword  : '$KEYWORD'"
echo "  Date     : $(date '+%d %B %Y %H:%M')"
echo "========================================"
echo ""

# --- Create a temp file to store matching lines ---
TMPFILE=$(mktemp)

# --- while-read loop: read log file line by line ---
while IFS= read -r LINE; do
    LINE_NUM=$((LINE_NUM + 1))

    # if-then: check if this line contains the keyword
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
        echo "$LINE" >> "$TMPFILE"
    fi
done < "$LOGFILE"

# --- Print summary ---
echo "  Total lines read          : $LINE_NUM"
echo "  Lines matching '$KEYWORD' : $COUNT"
echo ""

# --- Print last 5 matching lines ---
if [ $COUNT -gt 0 ]; then
    echo "--- Last 5 Matching Lines ---"
    tail -n 5 "$TMPFILE"
else
    echo "No lines containing '$KEYWORD' found in $LOGFILE."
fi

# --- Remove temp file ---
rm -f "$TMPFILE"

echo ""
echo "========================================"
echo "  Analysis complete. — Vaidehi Dadheech"
echo "========================================"
