# Cyborg R.A.T.3 Fix for Linux Systems using X Server/X11
This fix will resolve the clash issue between X Server and the Saitek/Cyborg R.A.T.3. Without this fix, the mouse becomes practically unusable in X11, especially when switching between windows.

The shell(.sh) version of this fix is now deprecated. I would recommend you use the new Python3 version, to avoid compatibility issues.

## Warning
This fix will create config files inside the X11 directory(/etc/X11/xorg.conf.d/).

Therefore it is advised you make a backup of your root system using a tool like Timeshift before installation.

## Installation

### Git Installation
The quickest and best method to installing this fix, is to use git inside of a terminal.

You can follow by simply copying the following lines:

```bash
git clone https://github.com/seanb126/cyborg-rat3-fix.git
```

Next you will want to open the repositories directory on your device:

```bash
cd cyborg-rat3-fix
```

Then type the following to begin installation:

```python3
python3 install.py
```
The script will require root/sudo privileges.

## Flags
Currently these flags only work in the shell(.sh) version.

- You can access a help screen by adding a help flag:
```bash
sh install.sh -h
```
- You can also uninstall the fix by using the remove flag:
```bash
sh install.sh -r
```

## Testing On
Operating Systems:
- Manjaro
- Fedora 35
- Ubuntu 20.04 LTS

Python Versions:
- Python 3.9.7 (Anaconda)
- Python 3.10.1

## Roadmap
- Create AUR repository
- Expand flag options

## Issue Reporting
If you find any issues when installing the software, do not hesitate to report it in the Issues
section of the GitHub repository.

## Useful Information
If this fix doesn't work, here are a few pointers on how to possibly resolve your mouse issues:
- https://wiki.archlinux.org/title/Mad_Catz_Mouse
- https://www.x.org/releases/current/doc/man/man5/xorg.conf.5.xhtml


## License
MIT License(see LICENSE)
