---
layout: page
title: Linux Basics - Vim Manual
permalink: manuals_linux-basics_vim.html
---

## Vim Manual

### Basics

`vim <my_file_name> # open/create file with vim`

Once you are in Vim the most important commands are `i` ,  `:`  and `ESC`. The `i` key brings you into the insert mode for typing. `ESC` brings you out of there. And the `:` key starts the command mode at the bottom of the screen. In the following text, all commands starting with `:` need to be typed in the command mode. All other commands are typed in the normal mode after hitting the `ESC` key.

**Modifier Keys to Control Vim**

```bash
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

### Help

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
```bash
:help                # opens help within vim, hit :q to get back to your file
:help <topic>        # opens help on specified topic
:help_topic| CTRL-]  # when you are in help this command opens help topic specified between |...|,
                     # CTRL-t brings you back to last topic
:help <topic> CTRL-D # gives list of help topics that contain key word
: <up-down keys>     # like in shell you get recent commands!!!!
```

* **Moving Around in Files**

```bash
$        # moves cursor to end of line
A        # same as $, but switches to insert mode
0 (zero) # moves cursor to beginning of line
CTRL-g   # shows at status line filename and the line you are on
SHIFT-G  # brings you to bottom of file, type line number (isn't displayed) then SHIFT-G # brings you to specified line#
```

* **Line Wrapping and Line Numbers**

```bash
:set nowrap # no word wrapping, :set wrap # back to wrapping
:set number # shows line numbers, :set nonumber # back to no-number mode
```

* **Working with Many Files & Splitting Windows**

```bash
vim -o *.txt # opens many files at once and displays them with horizontal
             # split, '-O' does vertical split
vim *.txt    # opens many files at once; ':n' switches between files
```

```bash
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

```bash
:set spell # turns on spell checking
:set nospell # turns spell checking off
:! dict <word> # meaning of word
:! wn 'word' -over # synonyms of word
```

* **Enabling Syntax Highlighting**

```bash
:set filetype=perl # Turns on syntax coloring for a chosen programming language.
:set syntax on # Turns syntax highlighting on
:set syntax off # Turns syntax highlighting off
```

* **Undo and Redo**

```bash
u      # undo last command
U      # undo all changes on current line
CTRL-R # redo one change which was undone
```

* **Deleting Things**

```bash
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

```bash
yy # copies line, for copying several lines do 2yy, 3yy and so on
p # pastes clipboard behind cursor
```

* **Search in Files**

```bash
/my_pattern # searches for my_pattern downwards, type n for next match
?my_pattern # seraches for my_pattern upwards, type n for next match
:set ic # switches to ignore case search (case insensitive)
:set hls # switches to highlight search (highlights search hits)
```

* **Replacements with Regular Expression Support**

Great intro: [A Tao of Regular Expressions](http://www.scootersoftware.com/RegEx.html)

```bash
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
    * `:AlignCtrl I= \t then :%Align` This allows to align tables by column separators (here '\t') when the [Align utility from Charles Campbell's](http://vim.sourceforge.net/scripts/script.php?script_id=294) is installed. To sort table rows by selected lines or block, perform the visual select and then hit F3 key. The rest is interactive. To enable this function, one has to include in the `.vimrc` file the [Vim sort script](https://cluster.hpcc.ucr.edu/%7Etgirke/Documents/UNIX/vim/vim_sort_fct.txt) from Gerald Lai.

* **Modify Vim Settings**

The default settings in Vim are controlled by the `.vimrc` file in your home directory.

  * see last chapter of vimtutor (start from shell)
  * useful [.vimrc sample](http://phuzz.org/vimrc.html)
  * when vim starts to respond very slowly then one may need to delete the `.viminf*` files in home directory
