import os
import platform
import shutil
from time import sleep
from sympy import N
from tqdm import tqdm
# from argparse import ArgumentParser

from sqlalchemy import null

class colors:
    ORIGINAL = '\033[0m'
    WARNING = '\033[93m'
    ERROR = '\033[91m'
    GREEN = '\033[92m'


FIX = """Section "InputClass"
 Identifier "Saitek Cyborg R.A.T.3 Mouse Remap"
 MatchProduct "Saitek Cyborg R.A.T.3 Mouse"
 MatchDevicePath "/dev/input/event*"
 MatchIsPointer "True"
 Option "ButtonMapping" "1 2 3 4 5 0 0 8 9 0 0 0 13 14"
EndSection"""

def check_system(): # Checks if system is Linux
    OS = platform.system()
    if OS != "Linux":
        print("You are not running a Linux operating system")
        print("Operation Cancelled")
        exit

def remove_fix():
    print("\nUninstalling Cyborg R.A.T.3 Fix")

    tasks = 3
    pbar = tqdm(total=tasks, desc = "Uninstalling fix")

    # check if previous install definitely exists
    basic_check()
    pbar.update(1)
    sleep(0.5)

    os.remove("text.txt")
    pbar.update(1)
    sleep(1)

    #alternate check
    if os.path.exists('text.txt'):
        pbar.close()
        error_msg
        exit
    pbar.update(1)
    pbar.close()

    print(f"{colors.GREEN}\nUninstall Complete")
    raise SystemExit






# the yes/no function is used to determine if the program
# - should continue to execute, with a no response closing the script
def yes_no(question):
    usr_input = input(f"{question}? (Y/n) ")
    # user responds yes
    if usr_input in ['y','Y','yes', 'Yes', 'YES']:
        pass
    elif usr_input == "": # if user pressed enter
        pass
    elif usr_input in ['n', 'N', 'no', 'No', 'NO']:
        exit
    elif question == 'Do you wish to reinstall':
        if usr_input in ['rem', 'remove', 'Remove', 'REMOVE']:
            # initiate remove process
            remove_fix()
    else:
        print("Input not recognised. Try again")
        yes_no(question)

def check_file_exists():
    if not os.path.exists('text.txt'):
        # initiate install process
        # Warning to user
        print((f"{colors.WARNING}WARNING: It is advised that you backup your system before installing!{colors.ORIGINAL}\n").center(cols))
        yes_no("Do you wish to proceed")
        create_fix(False)
    elif os.path.exists('text.txt'):
        print(f"{colors.WARNING}WARNING:It appears that the fix has previously been installed{colors.ORIGINAL}\n")
        
        print(f"{colors.WARNING}If you wish to remove this fix type 'remove' instead{colors.ORIGINAL}\n")
        
        yes_no("Do you wish to reinstall")
        print("\n")

        # program will of closed if user inputted 'no'

        print(("Reinstalling fix").center(cols))
        # os.remove("text.txt")

        create_fix(True)

def basic_check():
    if os.path.exists('text.txt'):
        pass
    else:
        error_msg


def create_fix(reinstall):
    # progress bar
    # three processes to be completed

    tasks = 3

    if reinstall == True:
        tasks = 4

    
    pbar = tqdm(total=tasks, desc = "Installing fix")
    try:
        # raise Exception # tests try-catch

        if reinstall == True:
            os.remove("text.txt")
            pbar.update(1)
            sleep(0.5)
        
        
        file = open('text.txt', 'w+')
        pbar.update(1)
        sleep(0.5)

        file.write(FIX)
        pbar.update(1)
        sleep(0.5)

        file.close()
        pbar.update(1)
        sleep(0.5)

        pbar.close()

    except:
        error_msg()
        

def error_msg():
    print(f"{colors.ERROR}ERROR! An issue has been detected!{colors.ORIGINAL}\n")
    print("If this was unexpected: Please report the issue to 'github.com/seanb126/cyborg-rat3-fix/issues'")
    exit


if __name__ == '__main__':

    # parser = ArgumentParser()
    # parser.add_argument("-u", "--uninstall")
    
    # check system OS
    check_system()


    remove_option = False
    
    cols, rows = shutil.get_terminal_size()

    #Introduction to program
    print("")
    print(("Cyborg R.A.T. 3 Fix for Linux with X Server").center(cols))
    print(("Created by seanb126").center(cols))
    print(("This software is licensed under the MIT License.\n").center(cols))
    
    

    

    # yes_no("Do you wish to proceed")
    check_file_exists()
    basic_check()
    print(f"\n {colors.GREEN}Cyborg R.A.T.3 Fix Successfully Installed!{colors.ORIGINAL}\n")
