#!/usr/bin/env bash
# Fire TV Screen Resizer - macOS & Linux Auto-Installer

echo "======================================================"
echo "    Fire TV Screen Resizer - Auto-Installer"
echo "======================================================"
echo ""

# Check for ADB
if ! command -v adb &> /dev/null; then
    echo "[ERROR] ADB was not found on your system."
    echo "Install via Homebrew: brew install android-platform-tools"
    exit 1
fi

APK_FILE="FireTV-Screen-Resizer-v1.1.apk"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -f "$APK_FILE" ]; then
    if [ -f "$SCRIPT_DIR/$APK_FILE" ]; then
        APK_FILE="$SCRIPT_DIR/$APK_FILE"
    else
        echo "[ERROR] Could not find $APK_FILE in the current directory."
        exit 1
    fi
fi

echo "[1/3] Scanning local network for Fire TV (port 5555)..."

# Check if already connected
CONNECTED_IP=$(adb devices | grep ":5555" | awk '{print $1}' | cut -d: -f1 | head -n 1)

if [ -n "$CONNECTED_IP" ]; then
    FOUND_IP="$CONNECTED_IP"
    echo "      Already connected to: $FOUND_IP"
else
    # Detect local subnet prefix (e.g. 192.168.1)
    SUBNET=$(arp -a | grep -Eo '([0-9]{1,3}\.){3}' | head -n 1)
    
    if [ -n "$SUBNET" ]; then
        echo "      Detected local subnet: ${SUBNET}*"
        for ip in $(arp -a | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}'); do
            if nc -z -w 1 "$ip" 5555 2>/dev/null; then
                FOUND_IP="$ip"
                break
            fi
        done
    fi
fi

if [ -z "$FOUND_IP" ]; then
    echo ""
    echo "[!] Could not auto-detect Fire TV IP address."
    echo "Make sure:"
    echo "  1. Your Fire TV is ON and on the same Wi-Fi / network."
    echo "  2. 'ADB Debugging' is ON (Settings -> My Fire TV -> Developer Options)."
    echo ""
    read -rp "Please enter your Fire TV IP address manually: " FOUND_IP
fi

if [ -z "$FOUND_IP" ]; then
    echo "No IP entered. Exiting."
    exit 1
fi

echo ""
echo "[2/3] Connecting to Fire TV at ${FOUND_IP}:5555..."
adb connect "${FOUND_IP}:5555"

echo ""
echo "[3/3] Installing Screen Resizer APK and granting permissions..."
adb install -r "$APK_FILE"
adb shell pm grant com.antigravity.screenresizer android.permission.WRITE_SECURE_SETTINGS

echo ""
echo "======================================================"
echo "   SUCCESS! Screen Resizer is installed on your Fire TV!"
echo "   You can now open it from your Fire TV Apps menu."
echo "======================================================"
echo ""
