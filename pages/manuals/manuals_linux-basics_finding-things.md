---
layout: page
title: Linux Basics - Finding Things
permalink: manuals_linux-basics_finding-things.html
---

## Finding files, directories and applications

```bash
find -name "*pattern*"            # Searches for *pattern* in and below current directory
find /usr/local -name "*blast*"   # Finds file names *blast* in specfied directory
find /usr/local -iname "*blast*"  # Same as above, but case insensitive
```

* Additional useful arguments: -user <user name>, -group <group name>, -ctime <number of days ago changed> 

```bash
find ~ -type f -mtime -2                # Finds all files you have modified in the last two days
locate <pattern>                        # Finds files and dirs that are written into update file
which <application_name>                # Location of application
whereis <application_name>              # Searches for executables in set of directories
yum list installed | grep <mypattern>   # Find CentOS packages and refine search with grep pattern
```

## Finding things in files

```bash
grep <pattern> <file>       # Provides lines in 'file' where pattern 'appears'
                            # If pattern is shell function use single-quotes: '>'


grep -H <pattern>           # -H prints out file name in front of pattern
grep 'pattern' <file> | wc  # pipes lines with pattern into word count wc (see chapter 8)
                            # wc arguments: -c: show only bytes, -w: show only words,
                            # -l: show only lines; help on regular expressions:
                            # $ man 7 regex or man perlre


find /home/my_dir -name '*.txt' | xargs grep -c ^.*  # Counts line numbers on many
                            # files and records each count along with individual file
                            # name; find and xargs are used to circumvent the Linux
                            # wildcard limit to apply this function on thousands of files.
```
