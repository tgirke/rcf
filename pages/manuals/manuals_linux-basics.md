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
  You will be asked to enter the password, simply type it and press enter.

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
