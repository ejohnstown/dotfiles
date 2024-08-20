#!/bin/bash
# From http://www.tylerewing.co/tmux-now-playing

if test -f "$HOME/.disable_current_track"
then
    echo "🎧 (disabled)"
    exit
fi

NOW_PLAYING=$(osascript <<EOF
set itunes_state to false

if is_app_running("Music") then
    tell application "Music" to set itunes_state to (player state as text)
end if
(* Whatever other music applications you use *)

if itunes_state is equal to "playing" then
    tell application "Music"
        set track_name to name of current track
        set artist_name to artist of current track
        return "🎧 " & track_name & " - #[bold]" & artist_name & "#[nobold]"
    end tell
else
    return "🎧"
end if

on is_app_running(app_name)
    tell application "System Events" to (name of processes) contains app_name
end is_app_running
EOF)

echo $NOW_PLAYING
