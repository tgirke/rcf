---
layout: page
title: Linux Cluster - Login Microsoft Windows 10 
permalink: manuals_linux-cluster_login_winos.html
---

#  GUI Cluster Connection

## How to create the SSH Key
### No terminal, no problem...
1. Begin by clicking on the tools drop down on the upper menu bar
![mobasshkey1](images/mobasshkey1.png)

2. Find and click on the MobaKeyGen (SSH key generator) option
![mobasshkey2](images/mobasshkey2.png)

3. A window should appear to create a new SSH key. Click on generate to create a new SSH key pair. Follow the on menu instructions.
![mobasshkey3](images/mobasshkey3.png)

4. Once your key has been created, enter a password in the key passphrase field to password protect your key.
![mobasshkey4](images/mobasshkey4.png)

5. Click on save public key and name the file "id_rsa.pub". Click on save private key and name the file "id_rsa". Follow the on screen instructions as follows when saving.
![mobasshkey5](images/mobasshkey5.png)

6. Once you have saved both public and private keys, go ahead and close the window. Proceed to find the settings icon in the upper toolbar menu on mobaxterm and click on it.
![mobasshkey6](images/mobasshkey6.png)

7. A new window should appear for MobaXterm configuration. Click on the SSH configuration at the top in settings window. Check the box "Use internal SSH agent "MobAgent" to enable it. Click on the "+" symbol on the right hand side to add your previously generated keys. 
![mobasshkey7](images/mobasshkey7.png)

8. Locate the previously generated keys (in our case id_rsa.pub and id_rsa) and add them to the agent. Follow the on screen instructions that may appear during this process. 
![mobasshkey8](images/mobasshkey8.png)

9. Once you restart MobaXterm, you will be greeted with a window to unlock your ssh key. Enter your password and you will be able to login using your keys.
![mobasshkey9](images/mobasshkey9.png)

