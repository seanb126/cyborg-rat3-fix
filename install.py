import os
import platform
import shutil

from sqlalchemy import null

class colors:
    ORIGINAL = '\033[0m'
    WARNING = '\033[93m'

def check_system(): # Checks if system is Linux
    OS = platform.system()
    if OS != "Linux":
        print("You are not running a Linux operating system")
        print("Operation Cancelled")
        exit

def yes_no():
    usr_input = input("Do you wish to proceed? (Y/n) ")
    # user responds yes
    if usr_input in ['y','Y','yes', 'Yes', 'YES']:
        print('Answer was Yes')
    elif usr_input == "": # if user pressed enter
        print("Enter was pressed")
    elif usr_input in ['n', 'N', 'no', 'No', 'NO']:
        print("no was pressed")
    else:
        print("Input not recognised. Try again")
        yes_no()



if __name__ == '__main__':
    
    # check system OS
    check_system()
    
    
    cols, rows = shutil.get_terminal_size()

    #Introduction to program
    print("")
    print(("Cyborg R.A.T. 3 Fix for Linux with X Server").center(cols))
    print(("Created by seanb126").center(cols))
    print(("This software is licensed under the MIT License.\n").center(cols))
    
    # Warning to user
    print((f"{colors.WARNING}WARNING: It is advised that you backup your system before installing!{colors.ORIGINAL}\n").center(cols))

    yes_no()
