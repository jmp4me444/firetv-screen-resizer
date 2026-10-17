# Fire TV Screen Resizer

[![Topic: amazon-fire-tv](https://img.shields.io/badge/topic-amazon--fire--tv-orange.svg)](https://github.com/topics/amazon-fire-tv)
[![Platform: Android TV / Fire OS](https://img.shields.io/badge/platform-Fire%20OS%20%7C%20Android%20TV-blue.svg)](https://developer.amazon.com/fire-tv)
[![Root: Not Required](https://img.shields.io/badge/root-NO%20ROOT%20REQUIRED-brightgreen.svg)](#)
[![Downloads](https://img.shields.io/github/downloads/jmp4me444/firetv-screen-resizer/total?color=blue&label=Downloads)](https://github.com/jmp4me444/firetv-screen-resizer/releases)

> **NO ROOT REQUIRED!** Works on standard stock Amazon Fire TV devices via simple ADB permission.

A lightweight utility app designed specifically for **Amazon Fire TV** devices to adjust the display canvas on the fly. 

Allows users to eliminate vertical black pillarbox bars on classic **4:3 television shows and retro content** (such as 1980s TV series on Plex, PlayOn, Kodi, or YouTube) and stretch them cleanly across a 16:9 widescreen TV.

---

## Features

- **4:3 Stretch to 16:9 Fullscreen**: Switches the Fire TV display canvas to `1440x1080`, triggering the physical TV panel to stretch 4:3 content edge-to-edge with no side borders.
- **Cinema Zoom Mode**: Overscan adjustment for cropping top/bottom letterboxes on wide content.
- **16:9 Standard Reset**: One-click restore back to factory `1920x1080` standard widescreen display.
- **Leanback Launcher Support**: Appears directly in the Fire TV Apps row with full remote control navigation.

---

## Download

Grab the latest compiled and signed APK from the [Releases](https://github.com/jmp4me444/firetv-screen-resizer/releases) section:
- **`FireTV-Screen-Resizer-v1.1.apk`**

---

## Installation & Setup

Because this app adjusts the system-level window manager display size, Android requires granting the `WRITE_SECURE_SETTINGS` permission once via ADB.

### 1. Install the APK
Download `FireTV-Screen-Resizer-v1.1.apk` to your PC (usually in your **Downloads** folder).

Open Command Prompt or Terminal in that folder (or specify the full file path), then run:
```bash
adb connect <FIRE_TV_IP>:5555
adb install FireTV-Screen-Resizer-v1.1.apk
```
*(Tip for Windows & Mac: you can also type `adb install ` and drag & drop the downloaded `.apk` file directly into your terminal window).*

### 2. Grant Required Permission
```bash
adb shell pm grant com.antigravity.screenresizer android.permission.WRITE_SECURE_SETTINGS
```

---

## How to Use

1. Launch your media app (e.g., Plex) and start playing your 4:3 show.
2. Open **Screen Resizer** from your Fire TV Apps menu.
3. Select **4:3 Retro Mode (Pillarbox Sides)** — the display will instantly fill the screen.
4. When finished, open the app again and select **Reset Display to Normal & Exit**.

---

## License
MIT License
