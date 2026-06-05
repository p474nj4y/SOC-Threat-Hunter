#!/bin/bash

# ============================================
# SOC Threat Hunting Toolkit
# Author: p1p0
# ============================================

REPORT_DIR="reports"

mkdir -p "$REPORT_DIR"

# --------------------------------------------
# Check Log File
# --------------------------------------------
check_log() {

    if [ ! -f "$LOG_FILE" ]; then
        echo "[!] Log file not found."
        exit 1
    fi
}

# --------------------------------------------
# Failed SSH Attempts
# --------------------------------------------
failed_ssh() {

    echo ""
    echo "===== FAILED SSH ATTEMPTS ====="

    grep "Failed password" "$LOG_FILE" \
    | awk '{print $NF}' \
    | sort \
    | uniq -c \
    | sort -nr
}

# --------------------------------------------
# Successful Logins
# --------------------------------------------
successful_ssh() {

    echo ""
    echo "===== SUCCESSFUL SSH LOGINS ====="

    grep "Accepted password" "$LOG_FILE" \
    | awk '{print $9 " -> " $11}' 
}

# --------------------------------------------
# Brute Force Detection
# --------------------------------------------
bruteforce_detection() {

    echo ""
    echo "===== BRUTE FORCE DETECTION ====="

    grep "Failed password" "$LOG_FILE" \
    | awk '{print $NF}' \
    | sort \
    | uniq -c \
    | awk '$1 > 10 {
        print "[ALERT] " $2 " => " $1 " failed attempts"
    }'
}

# --------------------------------------------
# Sudo Activity
# --------------------------------------------
sudo_activity() {

    echo ""
    echo "===== SUDO ACTIVITY ====="

    grep "sudo" "$LOG_FILE"
}

# --------------------------------------------
# Generate Report
# --------------------------------------------
generate_report() {

    REPORT_FILE="$REPORT_DIR/report_$(date +%F_%H-%M-%S).txt"

    {
        echo "=================================="
        echo "SOC THREAT HUNTING REPORT"
        echo "Generated: $(date)"
        echo "=================================="
        echo ""

        echo "FAILED SSH ATTEMPTS"
        grep "Failed password" "$LOG_FILE" \
        | awk '{print $NF}' \
        | sort \
        | uniq -c \
        | sort -nr

        echo ""
        echo "SUCCESSFUL SSH LOGINS"
        grep "Accepted password" "$LOG_FILE" \
        | awk '{print $9 " -> " $11}'

        echo ""
        echo "BRUTE FORCE ALERTS"
        grep "Failed password" "$LOG_FILE" \
        | awk '{print $NF}' \
        | sort \
        | uniq -c \
        | awk '$1 > 10'

        echo ""
        echo "SUDO ACTIVITY"
        grep "sudo" "$LOG_FILE"

    } > "$REPORT_FILE"

    echo ""
    echo "[+] Report generated successfully."
    echo "[+] Saved at: $REPORT_FILE"
}

# --------------------------------------------
# Menu
# --------------------------------------------
menu() {

    while true
    do
        echo ""
        echo "===================================="
        echo "      SOC THREAT HUNTING TOOLKIT"
        echo "===================================="
        echo "1. Failed SSH Analysis"
        echo "2. Successful SSH Logins"
        echo "3. Brute Force Detection"
        echo "4. Sudo Activity"
        echo "5. Generate Report"
        echo "6. Exit"
        echo ""

        read -p "Choose option: " choice

        case $choice in

            1)
                failed_ssh
                ;;

            2)
                successful_ssh
                ;;

            3)
                bruteforce_detection
                ;;

            4)
                sudo_activity
                ;;

            5)
                generate_report
                ;;

            6)
                echo "Goodbye!"
                exit 0
                ;;

            *)
                echo "Invalid option."
                ;;

        esac

    done
}

# --------------------------------------------
# Main
# --------------------------------------------

echo ""
read -p "Enter authentication log path: " LOG_FILE

check_log
menu
