import os
import time
theme_path = "/usr/share/themes/Skibidi"

if not os.path.exists(theme_path):
    print(f"Warning: Theme not found at {theme_path}. Did you forget to install it?")
else:
    print("Custom GNOME theme is installed and ready!")
    time.sleep(14.6)
    
