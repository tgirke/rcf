---
layout: page
title: Manuals
permalink: manuals_linux-basics.html
---
## Linux Basics

### Introduction
The scope of this manual is a brief introduction on how to get started using powerful Linux command-line utilities.

## How to Get Access?

* Install your preferred GNU/Linux distribution on your local machine (not required!!!)
* Users at UC Riverside can apply for an account on our Linux clusters by sending an account request to Rakesh Kaundal (rkaundal@ucr.edu).

## Logging-In

### Mac or Linux

* To log-in into the remote Linux shell, open terminal and type:

  `ssh -X <your_username>@<host_name>`

  `host_name` is the remote server's domain name (e.g. `biocluster.ucr.edu`)  
  You will be asked to enter your password. Simply type it and press enter.

* To copy files To the server run the following on your workstation or laptop:

  `scp -r <path_to_directory> <your_username>@<host_name>:`

* To copy files From the server run the following on your workstation or laptop:

  `scp -r <your_username>@<host_name>:<path_to_directory> .`

### Windows

1. Open PuTTY and select ssh. [Download PuTTY](http://www.chiark.greenend.org.uk/%7Esgtatham/putty/download.html) if you do not have it.
2. Provide the host name (the remote server's domain name) and session name 

   hostname:  biocluster.ucr.edu

3. Enter your identity information

   username: your username  
   password: your password 

   **Nothing will show-up,**  
   **simply type the password and press enter.**

4. Setup for graphics emulation. [Download and install Xming](http://www.straightrunning.com/XmingNotes/#head-13) if you do not have it.

5. Use WinSCP or FileZilla for file exchange. [Download and install WinSCP](https://winscp.net/eng/download.php) or [FileZilla](https://filezilla-project.org/) if you do not have it.

## Change Password

1. Log-in to the cluster via SSH
2. Once you have logged in, type the following command:
   `passwd`
3. Enter your current password (the random characters that you were given as your initial password)
4. Enter your new password (you will be asked to type it twice for verification)

### Minimum password requirements

* Total length at least 8 characters long
* Must have at least 3 of the following:
  * Lowercase character
  * Uppercase character
  * Number
  * Punctuation charcter

## Why GNU/Linux?

* Software costs $0
* Advanced Multitasking 
* Remote tasking ("real networking")
* Multiuser 
* Easy access to programming languages, databases, open-source projects 
* Software freedoms
  1. Free to use for any purpose
  2. Free to study and modify the source code
  3. Free to share
  4. Free to share modified versions
* No dependence on vendors
* Better performance 
* More up-to-date
* Many more reasons...

### GNU/Linux Distributions

* [Ubuntu](https://www.ubuntu.com/) - A beginner-friendly Linux OS based on Debian. A good choice for most people.
* [OpenSuSE](https://www.opensuse.org/) - An alternative to Ubuntu for new users.
* [Debian](https://www.debian.org/) - A general-purpose Linux OS with a large software package repository and support community.
* [Red Hat Enterprise Linux (RHEL)](https://www.redhat.com/) - A general-purpose Linux OS supported by Red Hat, Inc. Requires purchase.
* [CentOS](https://www.centos.org/) - A community-supported version of RHEL that's free to download and use. The UCR HPCC cluster runs on CentOS 7.
* [Fedora](https://getfedora.org/) - A developer-oriented Linux OS sponsored by Red Hat.
* [Arch Linux](https://www.archlinux.org/) - A highly-customizable Linux OS for power users.
* [Slackware](http://www.slackware.com/) - ...

[Family tree of the GNU/Linux distributions](https://en.wikipedia.org/wiki/File:Linux_Distribution_Timeline.svg)

## Basics

### Command-Line Syntax for this Manual

* Remember the UNIX/Linux command line is case sensitive!
* All commands in this manual are printed in gray code boxes.
* ~~Commands given in red are considered more important for beginners than commands given in black.~~
* The hash (pound) sign "#" indicates end of a command and the start of a comment.
* The notation <...> refers to variables and file names that need to be specified by the user. The symbols < and > need to be excluded.

### Orientation

Viewing and changing the present working directory:

```
pwd               # Get full path of the present working directory (same as "echo $HOME")

ls                # Content of pwd
ls -l             # Similar as ls, but provides additional info on files and directories
ls -a             # Includes hidden files (.name) as well
ls -R             # Lists subdirectories recursively
ls -t             # Lists files in chronological order

cd <dir_name>     # Switches into specified directory.
cd                # Brings you to the highest level of your home directory.
cd ..             # Moves one directory up
cd ../../         # Moves two directories up (and so on)
cd -              # Go back to you were previously (before the last directory change)
```

The tilde symbol (~) gets interpreted as the path to your home directory:

```
echo ~            # View the full (complete) path of your home
find ~            # List all your files (including everything in sub-directories)
ls ~              # List the top level files of your home directory
du -sch ~/*       # Calculate the file sizes in your home
```

Viewing file info, user, and host:

```
stat <file-name>  # Last modification time stamps, permissions, and size of a file

whoami            # Shows your user name (same as "echo $USER")
hostname          # Shows on which machine you are (same as "echo $HOSTNAME")
```

### Files and directories

```
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

> ```
Ctrl+a    # cursor to beginning of command line
Ctrl+e    # cursor to end of command line
Ctrl-w    # Cut last word 
Ctrl+k    # cut to the end of the line
Ctrl+y    # paste content that was cut earlier (by Ctrl-w or Ctrl-k)
```

* When specifying file names:
  * "." (dot)            - refers to the present working directory
  * "~" (Tilda) or "~/"  - refers to user's home directory

## Unix Help

```
man <something> # general help (press the 'q' key to exit) 
man wc          # manual on program 'word count' wc
wc --help       # short help on wc

soap -h         # for less standard programs 
```

Online help: [Google](https://www.google.com/)

Universally available Linux commands, with detailed examples and explanations: https://www.linuxconfig.org/linux-commands

## Finding Things

### Finding files, directories and applications

```
find -name "*pattern*"            # searches for *pattern* in and below current directory
find /usr/local -name "*blast*"   # finds file names *blast* in specfied directory
find /usr/local -iname "*blast*"  # same as above, but case insensitive
```

* additional useful arguments: -user <user name>, -group <group name>, -ctime <number of days ago changed> 

```
find ~ -type f -mtime -2                # finds all files you have modified in the last two days
locate <pattern>                        # finds files and dirs that are written into update file
which <application_name>                # location of application
whereis <application_name>              # searches for executables in set of directories
yum list installed | grep <mypattern>   # find Debian packages and refine search with grep pattern
```

### Finding things in files

```
grep pattern file           # provides lines in 'file' where pattern 'appears',
                            # if pattern is shell function use single-quotes: '>'


grep -H pattern             # -H prints out file name in front of pattern
grep 'pattern' file | wc    # pipes lines with pattern into word count wc (see chapter 8)
                            # wc arguments: -c: show only bytes, -w: show only words,
                            # -l: show only lines; help on regular expressions:
                            # $ man 7 regex or man perlre


find /home/my_dir -name '*.txt' | xargs grep -c ^.*  # counts line numbers on many
                            # files and records each count along with individual file
                            # name; find and xargs are used to circumvent the Linux
                            # wildcard limit to apply this function on thousands of files.
```

## Permissions and Ownership

List directories and files

```
ls -la # shows something like this for each file/dir: drwxrwxrwx
       # d: directory
       # rwx: read write execute
       # first triplet: user permissions (u)
       # second triplet: group permissions (g)
       # third triplet: other permissions (o)
```

Assign write and execute permissions to user and group

`chmod ug+rx my_file`

To remove all permissions from all three user groups

```
chmod ugo-rwx my_file
            # '+' causes the permissions selected to be added
            # '-' causes them to be removed
            # '=' causes them to be the only permissions that the file has.

chmod +rx public_html/ or $ chmod 755 public_html/ # Example for number system:
```

Change ownership

```
chown <user> <file or dir>         # changes user ownership
chgrp <group> <file or dir>        # changes group ownership
chown <user>:<group> <file or dir> # changes user & group ownership
```

## Useful Unix Commands

```
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

## Process Management

General

```
top               # view top consumers of memory and CPU (press 1 to see per-CPU statistics)
who               # Shows who is logged into system
w                 # Shows which users are logged into system and what they are doing
ps                # Shows processes running by user
ps -e             # Shows all processes on system; try also '-a' and '-x' arguments
ps aux | grep <user_name> # Shows all processes of one user
ps ax --tree      # Shows the child-parent hierarchy of all processes
ps -o %t -p <pid> # Shows how long a particular process was running.
                  # (E.g. 6-04:30:50 means 6 days 4 hours ...)
Ctrl z <enter>    # Suspend (put to sleep) a process
fg                # Resume (wake up) a suspended process and brings it into foreground
bg                # Resume (wake up) a suspended process but keeps it running
                  # in the background.
Ctrl c            # Kills the process that is currently running in the foreground
kill <process-ID> # Kills a specific process
kill -9 <process-ID> # NOTICE: "kill -9" is a very violent approach.
                     # It does not give the process any time to perform cleanup procedures.
kill -l           # List all of the signals that can be sent to a proccess
kill -s SIGSTOP <process-ID> # Suspend (put to sleep) a specific process
kill -s SIGCONT <process-ID> # Resume (wake up) a specific process
renice -n <priority_value> # Changes the priority value, which range from 1-19,
                           # the higher the value the lower the priority, default is 10.
```

More on Terminating Processes

~~Terminating a Running Process~~ (Broken link. Also, we have a wiki!?)

## Text Viewing

```
more <my_file>  # views text, use space bar to browse, hit 'q' to exit
less <my_file>  # a more versatile text viewer than 'more', 'q' exits, 'G' moves to end of text,
                # 'g' to beginning, '/' find forward, '?' find backwards
cat  <my_file>  # concatenates files and prints content to standard output
```

## Text Editors

* **Vi** and **Vim**
  * Non-graphical (terminal-based) editor. Vi is guaranteed to be available on any system. Vim is the improved version of vi.
* **Emacs**
  * Non-graphical or window-based editor. You still need to know keystroke commands to use it. Installed on all Linux distributions and on most other Unix systems.
* **XEmacs**
  * More sophisticated version of emacs, but usually not installed by default. All common commands are available from menus. Very powerful editor, with built-in syntax checking, Web-browsing, news-reading, manual-page browsing, etc.
* **Pico**
  * Simple terminal-based editor available on most versions of Unix. Uses keystroke commands, but they are listed in logical fashion at bottom of screen.
* **Nano**
  * A simple terminal-based editor which is default on modern Debian systems.

### Vim Manual

#### Basics

`vim <my_file_name> # open/create file with vim`

Once you are in Vim the most important commands are `i` ,  `:`  and `ESC`. The `i` key brings you into the insert mode for typing. `ESC` brings you out of there. And the `:` key starts the command mode at the bottom of the screen. In the following text, all commands starting with `:` need to be typed in the command mode. All other commands are typed in the normal mode after hitting the `ESC` key.

**Modifier Keys to Control Vim**

```
i   # INSERT MODE
ESC # NORMAL (NON-EDITING) MODE
:   # commands start with ':'
:w  # save command; if you are in editing mode you have to hit ESC first!!
:q  # quit file, don't save
:q! # exits WITHOUT saving any changes you have made
:wq # save and quit
R   # replace MODE
r   # replace only one character under cursor
q:  # history of commands (from NORMAL MODE!), to reexecute one of them, select and hit enter!
:w new_filename     # saves into new file
:#,#w new_filename  # saves specific lines (#,#) to new file
:#                  # go to specified line number
```

#### Help

* **Online Help**
  * Find help on the web. Google will find answers to most questions on **vi** and **vim** (try searching for both terms).
  * [Purdue University Vi Tutorial](https://engineering.purdue.edu/ECN/Support/KB/Docs/ViTextEditorTutorial)
  * Animated Vim Tutorial: https://linuxconfig.org/vim-tutorial
  * Useful list of vim commands:
    * [Vim Commands Cheat Sheet](http://www.fprintf.net/vimCheatSheet.html)
    * [VimCard](http://tnerual.eriogerg.free.fr/vimqrc.pdf)

* **Help from Command Line**
> `vimtutor # open vim tutorial from shell`

* **Help in Vim**
```
:help                # opens help within vim, hit :q to get back to your file
:help <topic>        # opens help on specified topic
:help_topic| CTRL-]  # when you are in help this command opens help topic specified between |...|,
                     # CTRL-t brings you back to last topic
:help <topic> CTRL-D # gives list of help topics that contain key word
: <up-down keys>     # like in shell you get recent commands!!!!
```

* **Moving Around in Files**

```
$        # moves cursor to end of line
A        # same as $, but switches to insert mode
0 (zero) # moves cursor to beginning of line
CTRL-g   # shows at status line filename and the line you are on
SHIFT-G  # brings you to bottom of file, type line number (isn't displayed) then SHIFT-G # brings you to specified line#
```

* **Line Wrapping and Line Numbers**

```
:set nowrap # no word wrapping, :set wrap # back to wrapping
:set number # shows line numbers, :set nonumber # back to no-number mode
```

* **Working with Many Files & Splitting Windows**

```
vim -o *.txt # opens many files at once and displays them with horizontal
             # split, '-O' does vertical split
vim *.txt    # opens many files at once; ':n' switches between files
```

```
:wall or :qall # write or quit all open files
:args *.txt    # places all the relevant files in the argument list
:all           # splits all files in the argument list (buffer) horizontally
CTRL-w         # switch between windows
:split         # shows same file in two windows
:split <file-to-open> # opens second file in new window
:vsplit        # splits windows vertically, very useful for tables, ":set scrollbind" let's you scroll all open windows simultaneously
:close         # closes current window
:only          # closes all windows except current one
```

* **Spell Checking & Dictionary**

```
:set spell # turns on spell checking
:set nospell # turns spell checking off
:! dict <word> # meaning of word
:! wn 'word' -over # synonyms of word
```

* **Enabling Syntax Highlighting**

```
:set filetype=perl # Turns on syntax coloring for a chosen programming language.
:set syntax on # Turns syntax highlighting on
:set syntax off # Turns syntax highlighting off
```

* **Undo and Redo**

```
u      # undo last command
U      # undo all changes on current line
CTRL-R # redo one change which was undone
```

* **Deleting Things**

```
x   # deletes what is under cursor
dw  # deletes from curser to end of word including the space
de  # deletes from curser to end of word NOT including the space
cw  # deletes rest of word and lets you then insert, hit ESC to continue with NORMAL mode
c$  # deletes rest of line and lets you then insert, hit ESC to continue with with NORMAL mode
d$  # deletes from cursor to the end of the line
dd  # deletes entire line
2dd # deletes next two lines, continues: 3dd, 4dd and so on.
```

* **Copy & Paste**

```
yy # copies line, for copying several lines do 2yy, 3yy and so on
p # pastes clipboard behind cursor
```

* **Search in Files**

```
/my_pattern # searches for my_pattern downwards, type n for next match
?my_pattern # seraches for my_pattern upwards, type n for next match
:set ic # switches to ignore case search (case insensitive)
:set hls # switches to highlight search (highlights search hits)
```

* **Replacements with Regular Expression Support**

Great intro: [A Tao of Regular Expressions](http://www.scootersoftware.com/RegEx.html)

```
:s/old_pat/new_pat/  # replaces first occurrence in a line
:s/old_pat/new_pat/g  # replaces all occurrence in a line
:s/old_pat/new_pat/gc  # add 'c' to ask for confirmation
:#,#s/old_pat/new_pat/g  # replaces all occurrence between line numbers: #,#
:%s/old_pat/new_pat/g  # replaces all occurrence in file
:%s/\(pattern1\)\(pattern2\)/\1test\2/g  # regular expression to insert, you need here '\' in front of parentheses (<# Perl)
:%s/\(pattern.*\)/\1 my_tag/g  # appends something to line containing pattern (<# .+ from Perl is .* in VIM)
:%s/\(pattern\)\(.*\)/\1/g  # removes everything in lines after pattern
:%s/\(At\dg\d\d\d\d\d\.\d\)\(.*\)/\1\t\2/g  # inserts tabs between At1g12345.1 and Description
:%s/\n/new_pattern/g  # replaces return signs
:%s/pattern/\r/g  # replace pattern with return signs!!
:%s/\(\n\)/\1\1/g  # insert additional return signs
:%s/\(^At\dg\d\d\d\d\d.\d\t.\{-}\t.\{-}\t.\{-}\t.\{-}\t\).\{-}\t/\1/g  # replaces content between 5th and 6th tab (5th column), '{-}' turns off 'greedy' behavior
:#,#s/\( \{-} \|\.\|\n\)/\1/g  # performs simple word count in specified range of text
:%s/\(E\{6,\}\)/<font color="green">\1<\/font>/g  # highlight pattern in html colors, here highlighting of >= 6 occurences of Es
:%s/\([A-Z]\)/\l\1/g  # change uppercase to lowercase, '%s/\([A-Z]\)/\u\1/g' does the opposite
:g/my_pattern/ s/\([A-Z]\)/\l\1/g | copy $  # uses 'global' command to apply replace function only on those lines that match a certain pattern. The 'copy $' command after the pipe '|' prints all matching lines at the end of the file.
:args *.txt | all | argdo %s/\old_pat/new_pat/ge | update  # command 'args' places all relevant files in the argument list (buffer); 'all' displays each file in separate split window; command 'argdo' applies replacement to all files in argument list (buffer); flag 'e' is necessary to avoid stop at error messages for files with no matches; command 'update' saves all changes to files that were updated.
```

* **Useful Utilities in Vim**

  * Matching Parentheses
    * Place cursor on (, [ or { and type % # cursor moves to matching parentheses

  * Printing and Inserting Files
    * `:ha  # prints entire file`
    * `:#,#ha  # prints specified lines: #,#`
    * `:r <filename>  # inserts content of specified file after cursor`

  * Convert Text File to HTML Format
    * `:runtime! syntax/2html.vim  # run this command with open file in Vim`

  * Shell Commands in Vim
    * `:!<SHELL_COMMAND> <ENTER>  # executes any shell command, hit <enter> to return`
    * `:sh  # switches window to shell, 'exit' switches back to vim`

  * Using Vim as Table Editor
    * `v` starts visual mode for selecting characters
    * `V` starts visual mode for selecting lines`
    * `CTRL-V` starts visual mode for selecting blocks (use CTRL-q in gVim under Windows). This allows column-wise selections and operations like inserting and deleting columns. To restrict substitute commands to a column, one can select it and switch to the command-line by typing `:`. After this the substitution syntax for a selected block looks like this: `'<,'>s///.`
    * `:set scrollbind` starts simultaneous scrolling of 'vsplitted' files. To set to horizontal binding of files, use command `:set scrollopt=hor` (after first one). Run all these commands before the `:split` command.
    * `:AlignCtrl I= \t then :%Align` This allows to align tables by column separators (here '\t') when the [Align utility from Charles Campbell's](http://vim.sourceforge.net/scripts/script.php?script_id=294) is installed. To sort table rows by selected lines or block, perform the visual select and then hit F3 key. The rest is interactive. To enable this function, one has to include in the `.vimrc` file the [Vim sort script](http://biocluster.ucr.edu/%7Etgirke/Documents/UNIX/vim/vim_sort_fct.txt) from Gerald Lai.

* **Modify Vim Settings**

The default settings in Vim are controlled by the `.vimrc` file in your home directory.

  * see last chapter of vimtutor (start from shell)
  * useful [.vimrc sample](http://phuzz.org/vimrc.html)
  * when vim starts to respond very slowly then one may need to delete the `.viminf*` files in home directory

## The Unix Shell
