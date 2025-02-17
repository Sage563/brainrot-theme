import fannum_battery
import battery_checker

while True:
    power = battery_checker.check_battery()

    if power =="19":
        fannum_battery.playwav()
    else:
        pass