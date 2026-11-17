---
Title: Android devices, ADB, and phone buying
Topic: hardware
Updated: 2026-11-09
Sources: tech_notes (in-place notes, undated)
Raw: [tech_notes/300_tech_notes.qmd](../../tech_notes/300_tech_notes.qmd)
---

# Android devices, ADB, and phone buying

Decision/reference notes for Android phones and file transfer; researched across 2022–2026 ("waste so much time on this", per the notes).

## ADB (Android Debug Bridge)

A "mode" that allows installing apps, reading logs on Android, file transfer. Works by running a TCP server on the host (PC) and a daemon on the device (phone).

- Use `adb -d` (device, not emulator) not plain `adb` when two devices; `adb --help`; `adb shell <command>`; `adb shell df -h`; `adb shell ls /system/bin` (available commands).
- Push music: `adb -d push --sync * /sdcard/Music` — `--sync` only pushes newer files.
- **mp3 transfer**: ADB is fussy — remove things like `?` or foreign characters from file names; "ADB sucks at error messages" (it chokes and stalls); "Just fix the file names and adb will work". Speed is very good: 25 MB/s ~ 1.8 GB/min; "Be patient with 40 GB".
- Bluetooth: "wasted plenty of time: use wired ADB"; TIME SINK.
- *MTP* is a protocol to move files, "seems imperfect"; PTP for photos; `mtp://[usb:001,085]` (085 = device number, run `lsusb`). "AVOID this stuff; **stay with ADB and fix those file names**".
- `adb backup` — "dissappointing, time-sink"; documentation unclear. STOP.
- Debloat: `adb -d` (device, not emulator) — "then use pm command to list/remove packages" (to remove Google bloatware).

## Android OS

Android is the U/I to the actual OS, which is **Dalvik**, uses java VM. **Recovery Mode** is a separate partition containing just enough code to boot in this mode; replacing that code is **custom** recovery vs **stock** recovery. **FASTBOOT** flashes a ROM on the device — a level beyond ADB.

## Bootloader and locks

- OEM Unlock greyed out → not possible to unlock the bootloader: no root, **no ROM install**, **no TWRP**.
- The notes' Pixel is a VERIZON (sprint?) phone, not a Google phone: IMEI begins with 35... — "NO way to change bootloader".
- Two+ kinds of locks: bootloader lock (locked means bootloader hard-coded insists OS match a code), carrier lock (that carrier only; software may persist even when unlocked), factory lock.

## Retail demo units

Run in an endless LOOP, no cell ability, no MEI, wifi-only. "Can be BARGAIN, but ...": must unlock the bootloader to remove the loop software; if you CAN, bargain — "Beware endless hours otherwise".

## Phone history / buying (2025–2026)

- **Google Pixel 3a XL** ("my phone, 6.3" good size") — "- screen broken Aug '25"; "Android 12 = final google update."; DO expect "unofficial" Android 13 for this phone (sooner or "lalter" [sic]).
- Pixel 4a: "(5.8", too small) cheaper glass than pixel 3a"; "practical gone (Aug '25)".
- (1/26) older "flagships" models should be good. Samsung: some say good, others don't agree. OnePlus 12/13 all good — not cheap.
- **OnePlus 8** (bought 9/25, $137) very good, but no 3mm jack.
- buy "Redmi Note 14" — "because mid-range; has 3mm jack;" `6GB/128GB ($140)`.

## Carrier and media

- 5G or "slower" 4G/LTE; 1–5 GB per month seems OK for some video/streaming; podcasts ~ 1MB/minute of talk (use wifi); want unlimited text/talk. MintMobile (owned by T-Mobile) claims $15 per month. SIM: physical or eSim if the device supports it. Device must support 5G/GSM/VoLTE and wifi (for mp3 downloads).
- mp3 players: DAC/dongle/digital devices "seem to be superb music" — "not android or podcast devices." — "Sony as usual is best; also Fifo and many others".

## See Also

- [E-reader selection and setup](ereader-selection.md)
- [Used ThinkPad laptop selection](laptop-selection.md)
