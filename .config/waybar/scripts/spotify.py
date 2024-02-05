#!/usr/bin/env python3

import subprocess
import json

def get_playerctl_info():
    try:
        status_output = subprocess.check_output(['playerctl', 'status'], text=True).strip()
        title_output = subprocess.check_output(['playerctl', 'metadata', 'title'], text=True).strip().lower()
        artist_output = subprocess.check_output(['playerctl', 'metadata', 'artist'], text=True).strip().lower()
        album_output = subprocess.check_output(['playerctl', 'metadata', 'album'], text=True).strip().lower()

        # Get the current playback position in seconds.
        position_output = subprocess.check_output(['playerctl', 'position'], text=True).strip()
        position_seconds = int(float(position_output))

        # Get the total duration of the media in seconds.
        duration_output = subprocess.check_output(['playerctl', 'metadata', 'mpris:length'], text=True).strip()
        duration_seconds = int(float(duration_output)) // 1000000  # Convert from microseconds to seconds.

        # Convert seconds to minutes and seconds format.
        position_minutes, position_seconds = divmod(position_seconds, 60)
        duration_minutes, duration_seconds = divmod(duration_seconds, 60)

        # Get the album cover path.
        cover_output = subprocess.check_output(['playerctl', 'metadata', 'mpris:artUrl'], text=True).strip()
        album_cover_path = cover_output.split('file://')[-1] if cover_output.startswith('file://') else None

        title_and_artist = f"{title_output} by {artist_output}"  
        # add leading zero for minutes and seconds
        position_minutes = str(position_minutes).zfill(2)
        position_seconds = str(position_seconds).zfill(2)
        duration_minutes = str(duration_minutes).zfill(2)
        duration_seconds = str(duration_seconds).zfill(2)

        time_signature = f"{position_minutes}:{position_seconds} / {duration_minutes}:{duration_seconds}" 
        tooltip = f"> {title_output}\n>> {artist_output}\n>>> {album_output}"

        if status_output.lower() == 'playing':
            return {
                'text': f"{title_output} [{time_signature}]",
                'class': 'playing',
                'tooltip': tooltip
            }

        if status_output.lower() == 'paused':
            return {
                'text': f"{title_output} [{time_signature}] >> paused",               
                'class': 'paused',
                'tooltip': tooltip
            }
            
        else:
            return {
                'text': f"{title_output} [{time_signature}] >> stopped",               
                'class': 'stopped',
                'tooltip': tooltip
            }

    except subprocess.CalledProcessError:
        return {
            'text': 'Spotify not running',
            'class': 'error'
        }

if __name__ == '__main__':
    player_info = get_playerctl_info()
    print(json.dumps(player_info))

