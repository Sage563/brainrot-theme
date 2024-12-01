import psutil

def check_battery():
    battery = psutil.sensors_battery()
    if battery is None:
        print("No battery information available. Are you running this on a device with a battery?")
        return
    
    percent = battery.percent
    plugged_in = battery.power_plugged

    status = "charging" if plugged_in else "not charging"
    return percent

