import os

theme_path = "/usr/share/themes/Skibidi"
def replace_bashrc_with_file(source_file, target_file=None):
    # Default .bashrc path is assumed to be in the home directory
    if target_file is None:
        target_file = os.path.expanduser("~/.bashrc")

    try:
        # Check if the source file exists
        if not os.path.isfile(source_file):
            print(f"Error: Source file '{source_file}' not found.")
            return

        # Read the content of the source file
        with open(source_file, 'r') as file:
            source_content = file.read()

        # Replace the content of .bashrc with the source file content
        with open(target_file, 'w') as file:
            file.write(source_content)

        print(f"Successfully replaced {target_file} with the content from {source_file}.")

    except PermissionError:
        print(f"Error: Permission denied to modify {target_file}.")
    except Exception as e:
        print(f"An error occurred: {e}")



if not os.path.exists(theme_path):
    print(f"Warning: Theme not found at {theme_path}. Did you forget to install it?")
else:
    print("Custom GNOME theme is installed and ready!")
    source_file = "bashrcne.sh"
    replace_bashrc_with_file(source_file)
    
