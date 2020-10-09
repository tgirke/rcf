---
layout: page
title: Linux Cluster - SSH Keys Microsoft Windows
permalink: manuals_linux-cluster_sshkeys_winos.html
---

## SSH Keys on MS Windows

### What are SSH keys?

SSH (Secure Shell) keys are an access credential that is used in the SSH protocol.

The private key remains on the system being used to access the HPCC cluster and is used to decrypt information that is exchanged in the transfer between the HPCC cluster and your system.

A public key file is used to encrypt information, and is stored on your own system.
The public key file is stored on the HPCC cluster and contains a list of authorized public keys.

### Why do you need SSH keys?

HPCC supports two authentication methods; `Password+DUO` and `SSH Keys`.
The `Password+DUO` method requires a UCR NetID, if you do not have this then you will need to use `SSH keys` in order to access the HPCC cluster.

### What you need

You will need to install `MobaXterm` in order to generate your `SSH keys` and also to transfer the keys to the cluster.

1. Download `MobaXterm` from [`here`](https://mobaxterm.mobatek.net/download-home-edition.html).
2. Unzip
3. Double click portable version of exe and run the `MobaXterm` application.

### Create SSH Keys (`MobaXterm`)

1. Begin by clicking on the tools drop down on the upper menu bar
   
   ![mobasshkey1](images/ssh1moba.png)

2. Find and click on the MobaKeyGen (SSH key generator) option
   
   ![mobasshkey2](images/ssh2moba.png)

3. A window should appear to create a new SSH key. Click on generate to create a new SSH key pair. Follow the on menu instructions.
   
   ![mobasshkey3](images/ssh3moba.png)

4. Once your key has been created, enter a password in the key passphrase field to password protect your key.
   
   ![mobasshkey4](images/ssh4moba.png)

5. Click on save public key and name the file "id_rsa.pub". Click on save private key and name the file "id_rsa". Follow the on screen instructions as follows when saving.
   
   ![mobasshkey5](images/ssh5moba.png)

6. Once you have saved both public and private keys, go ahead and close the window.

### Keys Location

### Configure SSH Keys

#### Public SSH Key

#### Private SSH Key

1. Click the `Settings` icon in the upper toolbar menu in `MobaXterm`.
   
   ![mobasshkey6](images/ssh6moba.png)

2. Within the new configuration window, click the `SSH` configuration tab. Next check the box "Use internal SSH agent MobAgent" to enable it. Click on the "+" symbol on the right hand side to add your previously generated keys.
   
   ![mobasshkey7](images/ssh7moba.png)

2. Locate the previously generated keys (in our case id_rsa.pub and id_rsa) and add them to the agent. Follow the on screen instructions that may appear during this process.
   
   ![mobasshkey8](images/ssh8moba.png)

3. Once you restart MobaXterm, you will be greeted with a window to unlock your ssh key. Enter your password and you will be able to login using your keys.
   
   ![mobasshkey9](images/ssh9moba.png)

