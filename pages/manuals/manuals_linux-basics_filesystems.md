---
layout: page
title: Linux Basics - File Systems and Transfers
permalink: manuals_linux-basics_filesystems.html
---

## File Systems

The file system in Linux is where you can save data, files, scripts, etc.
There are different storage pools based on the path.
In Linux you can provide any storage pool from any directory, not like MS Windows systems, where a drive letter is assigned to each storage pool (ie. "C:","D:").
This means that by navigating through nested directories, you may find different capacity limits, depending on where you are.


## Locations

Most unix system, including Linux, have a common directory hierarchy. The following is called the `root` level, since it is at the "top" like roots of a inverted tree:

```
/
|-- bigdata
|-- bin
|-- boot
|-- dev
|-- etc
|-- home
|-- lib
|-- lib64
|-- media
|-- mnt
|-- opt
|-- proc
|-- rhome
|-- root
|-- run
|-- sbin
|-- srv
|-- sys
|-- tmp
|-- usr
`-- var
```

The two most important directories are `/rhome` and `/bigdata`, since this is where your code and data will be stored.
These two directories are IBM Spectrum Scale (GPFS) pools, so storage quotas apply.
Your home directory lives directly under `/rhome` and your groups shared storage lives under `/bigdata` (if extra storage was purchased).
These two "bigdata" directories `/bigdata/groupname/username` and `/bigdata/groupname/shared` are symlinked (alias/shortcut) to your home directory for convenience, as seen here:

```
/
|-- bigdata
    |-- groupname (Quota based on purchase)
        |-- username <-------------|
        |-- shared <----------|    |
|-- bin                       |    |
|-- boot                      |    |
|-- dev                       |    |
|-- etc                       |    |
|-- home                      |    |
|-- lib                       |    |
|-- lib64                     |    |
|-- media                     |    |
|-- mnt                       |    |
|-- opt                       |    |
|-- proc                      |    |
|-- rhome                     |    |
    |-- username (20GB Quota) |    |
        |-- shared ---------->|    |
        |-- bigdata -------------->|
|-- root
|-- run
|-- sbin
|-- srv
|-- sys
|-- tmp
|-- usr
`-- var
```

For more information regarding these locations, and others, visit [HPCC Cluster: Data Storage](manuals_linux-cluster_storage).

### Case sensitive
All paths and commands are case sensitive, an uppercase letter is not the same as a lowercase letter.

### Path Types
An absolute path is a full path from top to bottom, from the `root` to the `leaf`:

```bash
/rhome/username/example_dir/example_file
```

A relative path is a partial path with the current working directory is the starting point:

```bash
example_dir/example_file
```

## Commands

Here are many common commands related to files and file systems (run `man <command>` for more information):

```
pwd           # Print working directory
ls            # List files in directory
touch         # Make an empty file
mkdir         # Make a directory
cd            # Change to directory
cp            # Copy file[s] from a directory to a directory
mv            # Move file[s] from a directory to a directory
rm            # Remove a file
rmdir         # Remove an empty directory
df            # Check size of storage pool
du            # Check size of file or directory
check_quota   # Check quota for home and bigdata
```

> Note: `CTRL+c` will cancel a running command

## File Transfers
  If you would rather use a graphical interface, instead of the command line, try FileZilla [FileZilla](https://filezilla-project.org/) for file exchanges.

* To copy files To the server run the following on your workstation or laptop:

  `scp -r <path_to_directory> <your_username>@<host_name>:`

* To copy files From the server run the following on your workstation or laptop:

  `scp -r <your_username>@<host_name>:<path_to_directory> .`

For more advanced methods of file transfers to the cluster refer to [Cluster - Sharing Data](manuals_linux-cluster_sharing).
