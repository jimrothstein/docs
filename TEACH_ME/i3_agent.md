You are an expert with Debian 13, lightdm display manager, i3, emacs.

I am begining to intermediate level user.   I am an R programmer.  I use Debian, lightdm, i3, emacs and others so I can work with R.  Therefore, be terse about Debian, lightdm, i3.  If I do not understand, I will ask you a follow up question. 

Below is my i3 configuration.   Some of it works and some of it does not.  Some of it may not be needed.
The first goal is to simplify the i3 configuration and have fewer lines of code.   In the future, I will ask you to simplify further.  But today,
the goal is only to improve the configuration.   We do not need to adjust everything.

The files have comments.   I do want comments which are clear and useful.   Many comments are old and we should remove.

When you reply to me, please try to identify categories:   for example, lines of code that do nothing and can be removed;  lines of code with major errors; lines of code that are duplicates.  Again, today we do not need to fix every problem, even if small.  

If you are not sure, please ask me to clarify.  Thanks!

The i3 files are located:   ~/.config/i3/    There are 2 files:
config
i3status.config


## Config file


 \footnotesize

# ```
#	TO PRINT; put entire text inside verbatim (```) tags
#       pandoc -f markdown -V geometry:margin=2cm    -o out.pdf
## ---------------------
#       i3 config file (v4)
# ---------------------
#	REF: https://wiki.archlinux.org/title/I3
#       REF: https://i3wm.org/docs/userguide.html for a complete reference!
#	REF CARD ! (in i3 docs)
#	VIDEO:  Chris Titus Tech
#       i3bar vs polybar (better control?) 
#
# SUSPEND = put info into RAM, then low-power (sleep)
# CLOSE LID = should trigger SUSPEND
# HIBERNATE = put info on DISK, then power-off (shutdown?)
#
# i3lock, service, handles details
#
# Do NOT put comments (#) on same line as a command **
# -  Mod4 is 'windows' key 
# -  exec				runs 1st load only
# -  exec --no-startup-id  	# some knd of window appears?
# -  exec_always  		runs on reload as well.
#
#       TODO
## Every instance of wezterm on $ws5;  First, must find class    
##       for_window [class="org.wezfurlong.wezterm"] move to workspace $ws5      
# ---------------------------------------
set $mod Mod4
set $myTerm wezterm
workspace_layout stacking   

# Ex:  mod+2 (move to firefox);  2nd mod+2 returns you workspace came from
workspace_auto_back_and_forth yes

#------------------------ include 
include ~/dotfiles/i3/config_extra

# ------------------------  font
# font pango:monospace 8   
font pango:DejaVu Sans Mono 12

 # ------------------------ XDG autostart
# Start XDG autostart .desktop files using dex. dex uses .desktop files(?)
# SEE https://wiki.archlinux.org/index.php/XDG_Autostart
exec --no-startup-id dex --autostart --environment i3

# ----------------
#       Applets?
# ----------------
# GOAL:  lock laptop BEFORE SUSPEND
# xss-lock grabs a logind suspend ????; then  use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.
# LOCK laptop before SUSPEND
exec --no-startup-id \
     xss-lock --transfer-sleep-lock -- i3lock --nofork

# -----------------
# NetworkManager 
# -----------------
# manage wifi with nm-applet,  a desktop environment-independent system tray GUI.
exec --no-startup-id nm-applet

# -------------------------------------------
# Use pactl to adjust volume in PulseAudio.
# -------------------------------------------
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

# ---------------
#       Bindsym
# ---------------
bindsysm $mod+Shift+q
bindsysm $mod+q

bindsym $mod+Return exec $myTerm   # start term

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# ----------------------------------
# start dmenu (a program launcher) (compare dmenu | rofi )
# ----------------------------------
bindsym $mod+d exec --no-startup-id dmenu_run
# bindcode $mod+40 exec "rofi -modi drun,run -show drun"
# There also is i3-dmenu-desktop which only displays applications shipping a
# .desktop file. It is a wrapper around dmenu, so you need that installed.
# bindcode $mod+40 exec --no-startup-id i3-dmenu-desktop

#------------------------  naviagation, SEE config_extra

# set variables for named workspaces   ---------------------
set $ws1 "1: Terminal"
set $ws2 "2: Firefox"
set $ws3 "3: emacs3"
set $ws4 "4: Rstudio4"
set $ws5 "5: Thunar"
set $ws6 "6: R (cli)"
set $ws7 "7  Extra Term 7"
set $ws8 "8  Zotero8"
set $ws9 "9: Slack9"
set $ws10 "10"

# switch to workspace
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9
bindsym $mod+Shift+0 move container to workspace number $ws10

# STARTUP apps ----
exec --no-startup-id i3-msg 'workspace $ws1; exec $myTerm; workspace $ws1'
exec --no-startup-id i3-msg 'workspace $ws2; exec firefox; workspace $ws1'
exec --no-startup-id i3-msg 'workspace $ws3; exec emacs; workspace $ws1'
#  rstudio is NOT capitalized
exec --no-startup-id i3-msg 'workspace $ws4; exec rstudio; workspace $ws1'
#exec_always i3-msg 'workspace $ws5; exec thunar; workspace $ws1'
#exec --no-startup-id i3-msg 'workspace $ws6; exec R; workspace $ws1'

# next line will create 2 zsh instances
#exec --no-startup-id i3-msg 'workspace $ws7; exec $myTerm'
exec --no-startup-id i3-msg 'workspace $ws8; exec zotero; workspace $ws1'
#exec --no-startup-id i3-msg 'workspace $ws9; exec slack; workspace $ws1'

# reload the configuration file, restart, exit
# -------------------------------
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)

bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)

# $mod+E  Completely exit X11
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"


# mode "resize" ------------------------  
# resize window (you can also use the mouse for that) -----------------------------------------------------
#       step #1  $mod+r to enter mode "resize"
#
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}

# ------------------------ activate mode "resize"
bindsym $mod+r mode "resize"

# ------------------------- mode "mode_launcher"
set $mode_launcher Launch: [f]irefox [t]hunar
mode "$mode_launcher" {
    bindsym f exec firefox
    bindsym t exec thunar 
#    bindsym s exec slack


    bindsym Escape mode "default"
    bindsym Return mode "default"
}
# -----		   active mode "mode_launcher"   
bindsym $mod+o mode "$mode_launcher"

## Any rstudio instance manually created will appear on wk4 
## class is one way to identify a program (see gemini LLM)
assign [class="rstudio"] $ws4

## Any slack instance .... will appear on wk9
## PROBLEM ... is it [Ss]lack ?  which?
# assign [class="slack"] $ws9
# assign [class="Slack"] $ws9

# ---- programs that don't play nice:
# ffloat
# super + mouse(drag) to move window
#for_window [title="Preferences$"] floating enable
#for_window [title="^Calculator"] floating enable
for_window [class="rstudio"] move container to workspace $ws4 
# for_window [title="Slack"] move to workspace $ws9 



## i3status.conf

# i3status configuration file.
#
# see "man i3status" for documentation.

# It is important that this file is edited as UTF-8.
# The following line should contain a sharp s:
# ß
# If the above line is not correctly displayed, fix your editor first!

general {
        colors = true
        interval = 5
}

order += "ipv6"
order += "wireless _first_"
#order += "ethernet _first_"
order += "battery all"
order += "disk /"
order += "load"
order += "memory"
order += "tztime local"

wireless _first_ {
        format_up = "W: (%quality at %essid) %ip"
        format_down = "W: down"
}

ethernet _first_ {
        format_up = "E: %ip (%speed)"
        format_down = "E: down"
}

battery all {
        format = "%status %percentage %remaining"
}

disk "/" {
        format = "%avail"
}

load {
        format = "%1min"
}

memory {
        format = "%used | %available"
        threshold_degraded = "1G"
        format_degraded = "MEMORY < %available"
}

tztime local {
#        format = "%Y-%m-%d %H:%M:%S"
         format = "%A  %Y-%m-%d %I:%M"
}
