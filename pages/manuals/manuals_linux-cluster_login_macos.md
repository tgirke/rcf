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

7. Enter `id_rsa` in the `Username` field.

   ![fig0](images/44.png)  
 
 
8. Click the `Generate Key` button.
   
   ![fig1](images/50.png)  
 
 9. Press `Cancel` to exit out of the window.
#### Key Location

By default, your key files are created in the path: `/Users/macOSUsername/.ssh/`.

To verify that the keys were created, do the following:

1. Open a new finder window. Click on your home directory on the left side pane.
   
   ![fig1](images/23.png)

2. Press (`Command`) and (`Shift`) and (`.`) buttons together (visualized below):
   
   ![fig1](images/47b.png)
 
3. You will now be able to see your hidden files and folders, click on the `.ssh` folder.
   
   ![fig1](images/48.png)

4. You should see your generated pair of key files in the folder. 

   ![fig1](images/51.png)

5. Sourcetree adds the `-Bitbucket` to the end of the key files. We don't want that, so click on the file you want and press the `Enter` key which allows us to rename the file before the extension.

   ![fig1](images/52.png)

6. Delete the `-Bitbucket` part of the filename to get a uniform filename for both files below:

   ![fig1](images/53.png)

## Configure SSH Keys


### Filezilla

You will need to install `Filezilla` in order to transfer the public SSH key to the HPCC cluster.

1. Download the `Filezilla Client` for Mac OS X [here](https://filezilla-project.org).
	* Make sure your Mac OS X system is updated to the latest version.
2. Follow the install wizard to complete the install of `Filezilla`.

#### Public SSH Key

1. When you start the application, you should be greeted by an empty field like so:

![fig4](images/1e.png)

2. Enter your username in the `username` field.

3. Enter the HPCC servername `cluster.hpcc.ucr.edu` with the `sftp://` prefix for SFTP/SSH connection. The first time you try to connect to the HPCC, you MUST use the `cluster.hpcc.ucr.edu` hostname. After this, you must use the `secure.hpcc.ucr.edu` hostname subsequently.

4. Enter your password.

5. Enter `22` in the `Port` field.

![fig7](images/8e.png)

6. Click on `Quick Connect`

7. If a pop up that prompts you to save your password comes up, press the `Save password` button, click `OK`.

8. If the following prompt shows up, before clicking `OK`, check the box that `Always trust this host, add this key to the cache`. Then click `OK`.

![fig8](images/6be.png)

9. Now that you are connected to Filezilla transfer your public SSH key from your macOS system at `/Users/macOSUsername/.ssh/id_rsa.pub` to the HPCC cluster at `/rhome/username/.ssh/id_rsa.pub`.

![fig10](images/4e.png)


#### Private SSH Key

Once your public key is in place, configure `Filezilla` to use your private SSH key.

1. Open Filezilla `Site Manager` button in the top bar of icons.

![fig3](images/60.png)

2. Click on `New Site`, the name doesn't matter, either press enter or name it.

![fig3](images/54.png)

3. Make sure the following fields are correctly modified before clicking on `Browse...`:
    * `Protocol`: should be set to `SFTP - SSH File Transfer Protocol`
    * `Host`: type in `cluster.hpcc.ucr.edu` **for the first time connecting only**! 
    * `Port`: type `22`
    * `Logon Type`: set to `Key file`
    * `User`: type in your HPCC username

![fig4](images/56.png)

4. Navigate to the folder you saved your key file in (Or the default in `/Users/macOSUsername/.ssh`) and open the private key file which should be simply `id_rsa`.

   ![fig4](images/57.png)
   
5. You should see the added keyfile in the `Key file:` box now. Press `Connect`.

![fig5](images/58.png)

7. Click on the `Site Manager` button as shown in step 1. Change the `Host:` field to `secure.hpcc.ucr.edu`, which you MUST use now to connect to the cluster. Press `OK`.

![fig5](images/59.png)

8. Now you can reconnect to the cluster by the quick connect bar by clicking on the arrow at the end.

![fig5](images/61.png)

9. Remember to ONLY use the `secure.hpcc.ucr.edu` address.

![fig5](images/62.png)

10. Transfer files by double clicking or drag-n-drop. For more details regarding file transfers vist [Filezilla Usage](some_other_page).