import os

def getfile(efile):
    rf =""
    with open(efile ,"r") as f:
        rf =f.read()
    return rf

theme_path = "/usr/share/themes/Skibidi"

if not os.path.exists(theme_path):
    print(f"Warning: Theme not found at {theme_path}. Did you forget to install it?")
else:
    #print("Custom GNOME theme is installed and ready!")
    with open(".bashrc" ,"w") as f:
        fe = getfile("bashrcne")
        f.write(fe)
    
