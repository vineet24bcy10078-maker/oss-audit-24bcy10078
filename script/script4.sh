#!/bin/bash

# Script 4: Smart Log File Analyzer
# Author: Vineet Salve

KEYWORD=${2:-"error"}

echo "========================================"
echo "         Smart Log Analyzer"
echo "========================================"

# --- Auto detect log file if not given ---
if [ -z "$1" ]; then
    if [ -f "/var/log/syslog" ]; then
        LOGFILE="/var/log/syslog"
    elif [ -f "/var/log/messages" ]; then
        LOGFILE="/var/log/messages"
    else
        echo "No standard log file found. Using sample data..."
        LOGFILE="sample_log.txt"

        # Create sample log file
        echo "Error: Something failed" > $LOGFILE
        echo "Warning: Disk almost full" >> $LOGFILE
        echo "Info: Process started" >> $LOGFILE
        echo "Error: Connection lost" >> $LOGFILE
    fi
else
    LOGFILE=$1
fi

echo "Log file used     : $LOGFILE"
echo "Keyword searched  : $KEYWORD"
echo "----------------------------------------"

COUNT=0
TOTAL_LINES=0

# --- Analyze file ---
while IFS= read -r LINE; do
    TOTAL_LINES=$((TOTAL_LINES + 1))

    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# --- Results ---
echo "Total lines       : $TOTAL_LINES"
echo "Matches found     : $COUNT"

if [ $TOTAL_LINES -gt 0 ]; then
    PERCENT=$((COUNT * 100 / TOTAL_LINES))
    echo "Match Percentage  : $PERCENT%"
fi

echo "----------------------------------------"

echo "Last 5 matching lines:"
grep -i "$KEYWORD" "$LOGFILE" | tail -5

echo "----------------------------------------"

WARNING_COUNT=$(grep -i "warning" "$LOGFILE" | wc -l)
echo "Total WARNING entries: $WARNING_COUNT"

echo "========================================"
