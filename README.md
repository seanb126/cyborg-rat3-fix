# Cyborg R.A.T.3 Fix for X11 Systems
This software includes a script that will install a fix, to allow the Saitek/Cyborg R.A.T.3 to work
fluently on Linux systems that use X Server/X11 for their display manager.

## Warning
This fix will create config files inside the X11 directory(/etc/X11/xorg.conf.d/).

Therefore it is advised you make a backup of your root system using a tool like Timeshift
before installation.

## Installation

### Method 1: wget
This is the recommended approach to using this software.

To install and execute, copy and paste the following code inside of your terminal:

```bash
wget -O - https://github.com/seanb126/cyborg-rat3-fix/blob/master/install.sh
```

### Method 2: Manual Installation
If the 'wget' approach is not working, you can clone the repository through git:

```bash
git clone https://github.com/seanb126/cyborg-rat3-fix.git
```

Next you will want to open the repositories directory on your device:

```bash
cd cyborg-rat3-fix
```

Then type the following to begin installation:

```bash
sh install.sh
```
The script will request sudo pivileges if they were not granted from the command-line.

## Flags
You can access a help screen by adding a help flag:
```bash
sh install.sh -h
```
The help screen is currently redundant. However, may become useful should additional
functionality be added in a future release.

## Testing
Tested on:
- Manjaro (Pahvo)
- Fedora 35

## Roadmap
- Create AUR repository
- Expand flag options

## Issue Reporting
If you find any issues when installing the software, do not hesitate to report it in the Issues
section of the GitHub repository.

## Additional Information
This fix is inspired by the advice provided on the Arch Wiki for Mad Catz devices.

See: https://wiki.archlinux.org/title/Mad_Catz_Mouse

## License
MIT License(see LICENSE)
