---
layout: page
title: Linux Basics - Command Line Basics
permalink: manuals_linux-basics_cmdline-basics.html
---

## Basics

### Command-Line Syntax for this Manual

* Remember the UNIX/Linux command line is case sensitive!
* All commands in this manual are printed in gray code boxes.
* The hash (pound) sign "#" indicates end of a command and the start of a comment.
* The notation <...> refers to variables and file names that need to be specified by the user. The symbols < and > need to be excluded.

### Orientation

Viewing and changing the present working directory:

```bash
pwd               # "Print working directory"; show your current path

ls                # "List" contents of current directory
ls -l             # Similar to ls, but provides additional info on files and directories
ls -a             # List all files, including hidden files (.name) as well
ls -R             # Lists subdirectories recursively
ls -t             # Lists files in chronological order

cd <dir_name>     # "Change directory" to specified path
cd                # Brings you back to your home directory
cd ..             # Moves one directory up
cd ../../         # Moves two directories up (and so on)
cd -              # Go back to you were previously (before the last directory change)
```

The tilde symbol (~) gets interpreted as the path to your home directory when
by itself or at the beginning of a word:

```bash
echo ~            # View the full (complete) path of your home
find ~            # List all your files (including everything in sub-directories)
ls ~              # List the top level files of your home directory
du -sch ~/*       # Calculate the "disk usage" of files in your home
```

Viewing file info, user, and host:

```bash
stat <file-name>  # Show last modification time stamps, permissions, and size of a file

whoami            # Shows your user name (same as "echo $USER")
hostname          # Shows on which machine you are (same as "echo $HOSTNAME")
```

### Files and directories

```bash
mkdir <dir_name>   # Creates specified directory
rmdir <dir_name>   # Removes empty directory
rm <file_name>     # Removes file_name
rm -r <dir_name>   # Removes directory including its contents, but asks for confirmation
rm -rf <dir_name>  # Same as above, but turns confirmation off. Use with caution
cp <name> <path>   # Copy file/directory as specified in path (-r to include content in directories)
mv <name1> <name2> # Renames directories or files
mv <name> <path>   # Moves file/directory as specified in path
```

### Copy and paste

The methods differ depending where you are.

* In a **command line** environment:

  Cut last word with keyboard only  
  `Ctrl+w`  
  Press multiple times to cut more than one word

  Paste with keyboard only  
  `Ctrl+y`

* In a non-command line **desktop** environment (e.g. Firefox):

  Copy  
  `Ctrl+c`

  Paste  
  `Ctrl+v`

* **Command line** <-> **desktop** exchange:

  Copy text out of the command line and into the desktop:  
  `Shift+Ctrl+c        or        Apple+c`

  Paste text from the desktop into the command line:  
  `Shift+Ctrl+v        or        Apple+v`

* On any Linux desktop!
  * Copy with mouse only
    * Simply select the text with the mouse 
  * Paste with mouse only
    * Click the middle mouse button or both left/right buttons simultaneously

### Handy shortcuts

* At the command prompt:
  * up(down)_key                 - scrolls through command history
  * `history   # shows all commands you have used recently`
* Auto Completion:
  * <something-incomplete> TAB   - completes program_path/file_name
* Taking control over the cursor (the pointer on the command line):

> ```bash
Ctrl+a    # Cursor to beginning of command line
Ctrl+e    # Cursor to end of command line
Ctrl+w    # Cut last word
Ctrl+k    # Cut to the end of the line
Ctrl+y    # Paste ("yank") content that was cut earlier (by Ctrl-w or Ctrl-k)
```

* When specifying file names:
  * "." (dot)            - refers to the present working directory
  * "~" (tilde) or "~/"  - refers to user's home directory

### Other Useful Unix Commands

```bash
df          # disk space
free -g     # memory info in Megabytes
uname -a    # shows tech info about machine
bc          # command-line calculator (to exit type 'quit')
wget ftp://ftp.ncbi.nih.... # file download from web
/sbin/ifconfig # give IP and other network info
ln -s <original_filename> <new_filename> # creates symbolic link to file or directory
du -sh      # displays disk space usage of current directory
du -sh *    # displays disk space usage of individual files/directories
du -s * | sort -nr # shows disk space used by different directories/files sorted by size
```

## Unix Help

```bash
help <command>  # Show help for a Bash command
man <something> # Show the manual page for a program (press the 'q' key to exit) 
man wc          # Manual on program 'word count' wc
wc --help       # Short help on wc
soap -h         # For less standard programs 
```

Online help: [Google](https://www.google.com/) is your friend.

Universally available Linux commands, with detailed examples and explanations: <https://www.linuxconfig.org/linux-commands>
