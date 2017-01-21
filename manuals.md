---
layout: page
title: Manuals
---
## Linux Cluster
Something is in here now
### Introduction
It is also important to note that these settings only affect your current session. If you log out and log back in, these settings will be reset. To make your changes permanent you need to add them to your '.bashrc' file, which is a hidden file in your home directory (if you do not have a '.bashrc' file, you will need to create an empty file called '.bashrc' in your home directory). Adding umask to your .bashrc file is as simple as adding your umask command (such as 'umask u=rwx,g=rx,o=r') to the end of the file. Then simply log out and back in for the changes to take affect. You can double check that the settings have taken affect by running 'umask -S'.
