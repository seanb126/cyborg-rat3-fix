import os
import platform
import shutil

class colors:
    ORIGINAL = '\033[0m'
    WARNING = '\033[93m'

def check_system(): # Checks if system is Linux
    OS = platform.system()
    if OS != "Linux":
        print("You are not running a Linux operating system")
        print("Operation Cancelled")
        exit




if __name__ == '__main__':
    
    # check system OS
    check_system()
    
    
    cols, rows = shutil.get_terminal_size()
    print("")
    print(("Cyborg R.A.T. 3 Fix for Linux with X Server").center(cols))
    print(("Created by seanb126").center(cols))
    print(("This software is licensed under the MIT License.\n").center(cols))
    print((f"{colors.WARNING}WARNING: It is advised that you backup your system before installing!{colors.ORIGINAL}").center(cols))

