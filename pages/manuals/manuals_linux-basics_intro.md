---
layout: page
title: Linux Basics - Introduction
permalink: manuals_linux-basics_intro.html
---

## Introduction
The scope of this manual is a brief introduction on how to get started using powerful Linux command-line utilities.

## How to Get Access?

* Install your preferred ssh client on your local machine (we can help you with this).
* Users at UC Riverside can apply for an account on our Linux clusters by sending an account request to Support (support@biocluster.ucr.edu).

### Windows

1. Open MobaXTerm [Download MobaXTerm](https://mobaxterm.mobatek.net/download-home-edition.html)
2. Click on "Start local terminal" in the center of the window.

### Mac
1. Download and install [XQuartz](https://www.xquartz.org/), this is optional and only needed if you want X11 Forwarding.
2. Open Terminal or [iterm2](https://www.iterm2.com/downloads.html)

### Logging in
* Now that you have a terminal open, execute the following on the command line:
  `ssh -X <your_username>@<host_name>`

  `host_name` is the remote server's domain name (e.g. `biocluster.ucr.edu`)  
  You will be asked to enter your password. Simply type it and press enter.

* To copy files To the server run the following on your workstation or laptop:

  `scp -r <path_to_directory> <your_username>@<host_name>:`

* To copy files From the server run the following on your workstation or laptop:

  `scp -r <your_username>@<host_name>:<path_to_directory> .`

## File Transfers
If you would rather use a graphical interface, instead of the command line, try FileZilla [FileZilla](https://filezilla-project.org/) for file exchanges.

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

[Family tree of the GNU/Linux distributions](https://en.wikipedia.org/wiki/File:Linux_Distribution_Timeline.svg)
