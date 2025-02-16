import platform

def get_distro_name():
    try:
        distro_info = platform.freedesktop_os_release()
        return distro_info.get('ID', 'Unknown').capitalize()
    except AttributeError:
        try:
            with open("/etc/os-release") as file:
                for line in file:
                    if line.startswith("ID="):
                        return line.strip().split("=")[1].replace('"', '').capitalize()
        except FileNotFoundError:
            return "Unknown"
if __name__ == "__main__":
    print(get_distro_name())
