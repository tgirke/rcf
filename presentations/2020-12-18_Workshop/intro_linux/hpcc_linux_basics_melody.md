## Mac - OS X Users

Type the `command` + `space` bar key on the keyboard to pull up the "Spotlight Search" bar

![Screen Shot 2020-12-17 at 10.01.33.png](/Users/mela/Library/Application%20Support/marktext/images/4ba8304c01f10dfbaa4edd1267625c2d3d88d22d.png)

Or press the following highlighted magnifying glass icon in the top right of the screen:

![4uC7nxfTf4N4hUCNsfHoGK-970-80.png](/Users/mela/Library/Application%20Support/marktext/images/79bdc49f885fea81559ea1e48711e8882ed21204.png)

The search bar will pop up in the middle of the screen:

![Screen Shot 2020-12-15 at 14.58.32.png](/Users/mela/Library/Application%20Support/marktext/images/3f8bcedebe2e04b463d2febb659ad6aa40f9367e.png)

Type "terminal" to search for and highlight the terminal app, then press the `enter` key.

![Untitled2.png](/Users/mela/Library/Application%20Support/marktext/images/98550f70c64c0a51115aefdaef5a1284c0a3ebc3.png)

## Windows Users

1. After [downloading](https://mobaxterm.mobatek.net/download-home-edition.html) and installing MobaXterm, start the program by clicking on the "MobaXterm_Personal.exe" file.

2. Click on "Start local terminal"

![Screen Shot 2020-12-15 at 15.53.54.png](/Users/mela/Library/Application%20Support/marktext/images/7e7cd5811c9c885bd16ffc4945e5e4c102157dfe.png)

## Logging in (any operating System)

You can log in anywhere! Using the helpful protocol: ssh. Whether you're using Windows or OS X (Mac) you'll inevitably reach the same step once the terminal is open:

`ssh -X YourUsername@cluster.hpcc.ucr.edu`

## Basic Commands

**L**i**s**(ting the contents of the current directory)

- `ls -a` → **l**i**s**t **a**ll files

- `ls -l` → **l**ist with **l**onger details

- `ls -a` + `ls -l` = **`ls -la`** → **l**i**s**t **a**ll files with **l**onger details

Display **C**ontents (of **a** file **t**o the screen)

- `cat filename`

- `cat -n filename`

**P**rint **W**orking **D**irectory

- `pwd` → returns the location (path) of where you have ended up currently

**C**hange **D**irectory

- `cd` → **c**hanges your current location to your home **d**irectory

- `cd ..` → **c**hanges **d**irectory to the one above

- `cd ../../` → **c**hanges **d**irectory to two above

## Basic Commands Cont.

Create a new file (**touch** your fingers on the keyboard)

- `touch file` → creates an empty file named *file*

- `touch file.txt` → creates an empty file named *file* with the *txt* extension

- `touch PowerAt.Your.FingerTips` creates a file named *PowerAt.Your* with the *FingerTips* extensionss

**C**o**p**y (file OR directory to somewhere else ) 

- `cp file_source/ destination/`→

- `cp -r directory_source/ destination/` → copies the folder *directory_source/* recursively to the *destination/*

- `cp file_source file_backup` →

**M**o**v**e (file or directory to somewhere else)

- `mv old_file_name new_file_name` → renames the file *old_file_name* to *new_file_name*

- `mv file_name path/` → moves *file_name* to the folder *path/*

**M**a**k**e a new **Dir**ectory

- `mkdir your_new_directory_name` → makes a new folder called *your_new_directory_name/* located in your current location

**R**e**m**ove an empty **Dir**ectory (no files/sub-directories)

- `rmdir directory_name/` → removes *directory_name/* from where you currently are

**R**e**m**ove (a file)

- `rm filename` → removes *filename* from where you are currently in the directory

## Basic Commands Cont.

**Which** is the correct location of my program (that is executed when you type its name in the terminal)  ? 

- `which python` → returns the location (path) of the program

**Find** my file in this folder or file

- `find . -name '*.txt'` → find any files in my current directory with the ".txt" extension in the name of the file

- `find . -name 'my_file_name'` → find any files in my current directory with the "my_file_name" name

- `find some/folder/ -name "*.json"` → find any files with any name with the ".json" extension in the some/folder/ path

**W**ord **C**ount (or lines/characters)

- `wc file.txt` → word/line/character count of the supplied file.txt

- `wc -w file.txt` → word count of the supplied file.txt

- `wc -l file.txt` → line count of the supplied file.txt

- `wc -c file.txt` → character count of the supplied file.txt

**P**rocesse**s** 

- `ps` → your processes!

- `ps aux` → displays processes of all users with all the background processes started at boot time

## Basic Commands Cont.

**G**lobal **R**egular **E**xpression **P**rint - Search for a file for lines with your criteria

- `grep your_search_pattern file_name` 

- `grep "hello" /path/file` → searches the word *hello* in the file named *file* within the location

**less**, or more but backwards

- `less file.txt` → reads the file but with pagination 

- A helpful graphical table of frequently used commands ([on Wikipedia](https://en.wikipedia.org/wiki/Less_(Unix)#Usage))

**echo**

- `echo "hello"` → returns the word *hello* 

- `echo $?` → returns the exit code of the last command

- `echo $PATH` → returns the current executable variables within your path (programs you can run)

**Man**ual

- `man ls`  → displays the linux manual page for the `ls` command

- `man -k HELP` → searches the linux manual page titles and synopses for the word *HELP*
