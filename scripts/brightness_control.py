#!/usr/bin/env python3

import subprocess
import argparse
import re

def get_brightness():
    try:
        cmd = [
            'gdbus', 'call', '--session',
            '--dest', 'org.gnome.SettingsDaemon.Power',
            '--object-path', '/org/gnome/SettingsDaemon/Power',
            '--method', 'org.freedesktop.DBus.Properties.Get',
            'org.gnome.SettingsDaemon.Power.Screen',
            'Brightness'
        ]
        result = subprocess.run(cmd, check=True, capture_output=True, text=True)
        match = re.search(r'\d+', result.stdout)
        if match:
            return int(match.group())
        else:
            raise RuntimeError("Failed to parse brightness value")
    except subprocess.CalledProcessError as e:
        raise RuntimeError(f"Failed to get brightness: {e.stderr}")

def set_brightness(value):
    # Clamp value between 0 and 100
    value = max(0, min(100, value))
    try:
        cmd = [
            'gdbus', 'call', '--session',
            '--dest', 'org.gnome.SettingsDaemon.Power',
            '--object-path', '/org/gnome/SettingsDaemon/Power',
            '--method', 'org.gnome.SettingsDaemon.Power.Screen.SetBrightness',
            str(value)
        ]
        subprocess.run(cmd, check=True)
        print(f"Brightness set to {value}%")
    except subprocess.CalledProcessError as e:
        raise RuntimeError(f"Failed to set brightness: {e.stderr}")

def main():
    parser = argparse.ArgumentParser(description='Control screen brightness on GNOME')
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument('-s', '--set', type=int, 
                      help='Set brightness to specific value (0-100)')
    group.add_argument('-i', '--inc', action='store_true',
                      help='Increase brightness by 10%')
    group.add_argument('-d', '--dec', action='store_true',
                      help='Decrease brightness by 10%')
    
    args = parser.parse_args()
    
    try:
        if args.set is not None:
            set_brightness(args.set)
        else:
            current = get_brightness()
            if args.inc:
                set_brightness(current + 10)
            elif args.dec:
                set_brightness(current - 10)
    except Exception as e:
        print(f"Error: {e}")
        exit(1)

if __name__ == '__main__':
    main()