import os

def getfile(efile):
    rf =""
    with open(efile ,"r") as f:
        rf =f.read()
    return rf

def write_bashrc(lines):
    bashrc_path = os.path.expanduser("~/.bashrc")
    with open(bashrc_path, "w") as file:
        file.writelines(lines)
theme_path = "/usr/share/themes/Skibidi"

if not os.path.exists(theme_path):
    print(f"Warning: Theme not found at {theme_path}. Did you forget to install it?")
else:
    print("Custom GNOME theme is installed and ready!")
    write_bashrc(getfile("bashrcne"))
    
