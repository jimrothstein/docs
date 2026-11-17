---
Title: Debian/Linux administration notes
Topic: linux
Updated: 2026-11-09
Sources: tech_notes (in-place notes, undated)
Raw: [tech_notes/300_tech_notes.qmd](../../tech_notes/300_tech_notes.qmd)
---

# Debian/Linux administration notes

Grab-bag of Debian/Linux system administration recipes accumulated 2022–2026.

## apt

```sh
sudo apt
sudo apt autoremove     # a dependency no longer needed
sudo apt-mark           # pkg settings, such as being held
sudo apt install --fix-broken <pkg>
sudo apt install --fix-missing
```

## Login, sessions, boot

- *gnome-control-center* is a CLI to manage linux, X11 (even with cinnamon/lightdm).
- Autologin with lightdm: as root edit `/etc/lightdm/lightdm.confg` — in `[seat:*]`, uncomment user and timeout lines; set user to "jim" (no spaces around =).
- Login uses a *getty* (default); reads `/etc/profile`, `~/.profile`. Xsession: look at `/etc/X11/Xsession` and `.../Xsession.d` ("too much - don't understand; confused", per the notes).
- Rescue mode: use the Debian installer's rescue mode; eventually you get a prompt ("a lot of screens to go through"). Debian ISO: "should not need dd command; just cd to USB".
- Shutdown when system hangs: CTRL-ALT-DEL or ALT-printScreen.
- Versions: Debian stable; Debian testing/sid — next version.
- Boot chain: firmware | bootloader (finds all kernels, os) | grub2 (user select). `/kernel` is MINIMUM to start — why drivers often need separate install. Swap: latest Linuxmint built-in, no need. LinuxMint installer sets mountpoints. Partitions: `\home` separate; `\` for all else (~30–40GB enough). Boot drive needs flags `boot` and `esp` (?).

## GRUB2

"1st: do not panic". Pre-linux boot; usually all it wants is to know which partition is root. May see `(hd0)`, `(hd0,gpt2)`, `(hd0,gpt3)` — hard drive and partition; in the notes' case: `set root=(hd0,gpt2)`. May involve updates to `/etc/default/grub` (use their tool). GRUB is the bootloade(r), boots kernel into RAM (vmlinuz, .initrd.gz); "MBR long gone, IGNORE"; `(hd0,2)` means drive hd0, partition 2. Read: `info grub`.

## Mount, disks, partitions

```sh
mount --bind
mount | grep "/dev/"               # list devices /dev/*
sudo chroot /mnt/X/                # /mnt/X must already exist
sudo mount /dev/sdb /media/usb_drive   # RHS must EXIST
lsblk --output NAME,UUID,PARTUUID  # succinct, useful info
df -Th /dev/sda                    # check fs
```

Example drive layout from the notes (238.5G disk, "Drive is NOT 512G"): sda1 512M /boot/efi; sda2 27.9G /; sda3 977M [SWAP]; sda4 209.1G /home.

## Format fat32 USB (for copiers)

1. (optional, slow — ~5MB/s or 200 seconds for 1 GB on USB 2.0) put all zeros
2. `sudo parted /dev/sda mklabel msdos` (empty partition table, MBR form)
3. `sudo parted /dev/sda mkpart primary fat32 0% 100%`
4. `sudo mkfs.fat -F32 /dev/sda` (if it says use -I, do so)
5. `sudo parted /dev/sdb print` (confirms fat32)

Burn ISO: `sudo dd bs=4M if=/path/to/file.iso of=/dev/sda status=progress oflag=sync` ("I never got gui's to work"). Format exfat — "NO! use fat32 (above) to work with other devices".

## cron

```sh
grep jim /var/log/syslog    # see cron jobs that ran
```

May 2022: changed `/etc/rsyslog/50-default.conf` — uncomment `#cron` so cron logs to cron.log; after change run `sudo service rsyslog restart`.

## Kernel and services

One LTS Ubuntu can have many (upstream) kernels. `systemctl` — control daemon and services; `loginctl` — control login daemon (such as when lightdm crashes).

## Keyboard remap (capslock → escape)

- `setxkbmap -option "caps:escape"` (immediate) — put in `~/.profile` (login) or `~/.xinitrc` (2/26 — setxkbmap is here). Other methods like /etc/default/keyboard "do not seem to work".
- Xmodmap (older, easier?) — see Xahlee.info/Xmodmap; `modmap -pke` useful.
- Chromebox: use `xev` to find that capslock is key 133, then `xmodmap -e "keycode 133 = Escape"`. Lenovo: capslock keycode = 66, escape is 9, "capslock still insisting on going in caps lock"; setxkbmap suggests `caps:swapescape` but xmodmap won't accept it.
- 17JULY2023: ebook-viewer (calibre) has conflict with caps:swapescape — FIX: `setxkbmap -option caps:escape` (in .xinitrc); "DEPRECATES anything before 17JULY 2023".
- `xev` — find what keycode/keysym a button maps to (example: q = keycode 24, keysym 0x71). `xxd` — find how zsh maps a button: run `xxd`, press <ALT>+a, terminal displays the coding (`^[a`).

## Audio stack

WirePlumber / PipeWire / ALSA (bottom). PipeWire is low-level and replaces pulseaudio (ALSA remains the lowest level library); *WirePlumber* (`wpctl`) manages this library; references to older PulseAudio probably mean PipeWire emulating it — the PulseAudio package is no longer on the machine.

## PGP / keys

- Install a public key: `gpg --recv-keys XXX` (XXX = 16 alphanumeric).
- Key signing: sign a doc with the private key → anyone with the public key can read it and knows only the owner could have encrypted it; encrypt with the PUBLIC key and only someone with the PRIVATE key can read it; all keys belong on the Debian key ring.
- `gpg --list-keys`.

## Installing R on Debian

Follow <https://cran.r-project.org/bin/linux/debian/> ("This is a nightmare. There are several discrete steps; Do one at time!"): (1) `sudo vim.tiny /etc/apt/sources.list`; (2) insert the deb XXX link; (3) save, run as jim, `sudo apt install r-base` etc. Use gpg; DO NOT USE apt-key. apt-secure — "ONLY 2 line to run. Just do what Cran R says to do for Debian, key-ring". Ubuntu/mint: use jammy and follow the CRAN ubuntu instructions (works).

## X11

"**Warning:** Stay with X11 (proven, well-supported, works)". Wayland is an open source *protocol* replacement for X windows; WESTON is the reference implementation; accepts the same toolkits (Qt, GTK) so impact for developers and users should be minimal; "Wayland shrinks X" — much of it now in the Linux kernel. Xserver is the 'display' server — runs locally, makes display and keyboard available to apps (local or network). `~/.xsession-errors` — GUIs have no console; errors are redirected to this file. `~/.Xauthority` — random code controlling which programs output to the X11 session.

## See Also

- [Simple CLI cheat sheet](../tools/simple-cli-cheatsheet.md) — i3 window-class discovery
- [Used ThinkPad laptop selection](../hardware/laptop-selection.md)
