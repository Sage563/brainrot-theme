
import get_distro
import os
import subprocess

# Define the OS variable
os_name =get_distro.get_distro_name().strip().lower()

# Commands for installing GNOME based on OS
commands = {
    "ubuntu": "sudo apt install -y gnome-shell",
    "debian": "sudo apt install -y gnome-shell",
    "opensuse": "sudo zypper install -y gnome-shell",
    "fedora": "sudo dnf groupinstall -y 'GNOME Desktop'"
}

# Check if the OS is supported and run the corresponding command
if os_name in commands:
    try:
        print(f"Installing GNOME on {os_name.capitalize()}...")
        subprocess.run(commands[os_name], shell=True, check=True)
        print("GNOME installation complete!")
    except subprocess.CalledProcessError as e:
        print(f"An error occurred during installation: {e}")
else:
    print("Unsupported or invalid OS. Please choose from Ubuntu, Debian, openSUSE, or Fedora.")
