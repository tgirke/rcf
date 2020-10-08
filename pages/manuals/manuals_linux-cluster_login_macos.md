---
layout: page
title: Linux Cluster - Login macOS 
permalink: manuals_linux-cluster_login_macos.html
---

## SSH Keys on macOS

### What are SSH keys?

SSH (Secure Shell) keys are an access credential that is used in the SSH protocol.

The private key remains on the system being used to access the HPCC cluster and is used to decrypt information that is exchanged in the transfer between the HPCC cluster and your system.

A public key file is used to encrypt information, and is stored on your own system.
The public key file is stored on the HPCC cluster and contains a list of authorized public keys.

### Why do you need SSH keys?

HPCC supports two authentication methods; `Password+DUO` and `SSH Keys`.
The `Password+DUO` method requires a UCR NetID, if you do not have this then you will need to use `SSH keys` in order to access the HPCC cluster.

## Create SSH Keys (GUI)

#### Step by step:
1. Download Sourcetree [here](https://www.sourcetreeapp.com)
2. Click on `Download for Mac OS X`.
3. Instlal Sourcetree.
4. Open Sourcetree application and under the `Sourcetree` click on the `Preferences...` button to bring up the menu as shown in the screenshot below.

   ![fig0](images/41.png)
   
5. Navigate to `Accounts` and click on `Add...`.

   ![fig0](images/42.png)

6. The following screenshot should be what greets you, click on `Auth Type:` and change the drop down menu from `OAuth` to `Basic`. Make sure `Protocol:` is set to `SSH` in the drop down menu. The other fields won't matter.

   ![fig0](images/43.png)

7. Enter your HPCC username in the `Username` field.

   ![fig0](images/44.png)  
 
 
8. Click the `Generate Key` button.
   
   ![fig1](images/45b.png)  
 
 
#### Key Location

By default, your key files are created in the path: `/Users/macOSUsername/.ssh/`.

To verify that the keys were created, do the following:

1. Open a new finder window. Click on your home directory on the left side pane.
   
   ![fig1](images/23.png)

2. Press (`Command`) and (`Shift`) and (`.`) buttons together (visualized below):
   
   ![fig1](images/47.png)
 
3. You will now be able to see your hidden files and folders, click on the `.ssh` folder.
   
   ![fig1](images/48.png)

4. You should see your generated pair of key files in the folder. 

   ![fig1](images/49.png)


## Configure SSH Keys (GUI)


### Filezilla

You will need to install `Filezilla` in order to transfer the public SSH key to the HPCC cluster.

1. Download the `Filezilla Client` for Mac OS X [here](https://filezilla-project.org).
	* Make sure your Mac OS X system is updated to the latest version.
2. Follow the install wizard to complete the install of `Filezilla`.

### Public SSH Key

1. When you start the application, you should be greeted to an empty field like so:

![fig4](images/1e.png)

2. Enter your username in the `username` field.

3. Enter the HPCC servername `cluster.hpcc.ucr.edu` or `secure.hpcc.ucr.edu` with the `sftp://` prefix for SFTP/SSH connection.

4. Enter your password.

5. Enter `22` in the `Port` field.

![fig7](images/8e.png)

6. Click on `Quick Connect`

7. If a pop up that prompts you to save your password comes up, press the `Save password` button, click `OK`.

8. If the following prompt shows up, click `OK`.

![fig8](images/6b.png)

9. Now that you are connected to Filezilla transfer your public SSH key from your macOS system at `/Users/macOSUSername/.ssh/id_rsa.pub` to the HPCC cluster at `/rhome/username/.ssh/id_rsa.pub`.

![fig10](images/4e.png)


#### Private SSH Key

Once your public key is in place, configure `Filezilla` to use your private SSH key.

1. Open Filezilla `Settings...` option under the `Filezilla` heading.

![fig3](images/7e.png)

2. Navigate to SFTP settings.

![fig4](images/3e.png)

3. Click on the `Add key file` button.

![fig4](images/26.png)

4. Navigate to the folder you saved your key file in (Or the default in `/Users/macOSUsername/.ssh`) and open it.

   * This is the window that will pop up.

   ![fig4](images/27.png)

   * Either use the search bar to find your file by name.

   ![fig4](images/28.png)

   * Or press ![fig4](images/31.png) to open the "Go to..." pane and then enter the folder you want to go into.

   ![fig4](images/29.png)

5. You should see the added keyfile under the `Private keys:` heading.

![fig5](images/30.png)

6. Click on the red `x` in the top left corner of the window to exit out of the window.

![fig4](images/32.png)

7. Then reconnect to the HPCC cluster with `Filezilla` and transfer files by double clicking or drag-n-drop. For more details regarding file transfers vist [Filezilla Usage](some_other_page).

