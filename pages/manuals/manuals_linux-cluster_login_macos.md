---
layout: page
title: Linux Cluster - Login macOS 
permalink: manuals_linux-cluster_login_macos.html
---

#  GUI Cluster Connection
## SSH Keys
#### What are they?
 SSH (Secure Shell) keys are an access credential that is used in the SSH protocol.

The private key remains on the system being used to access the HPCC and is used to decrypt information that is exchanged in the transfer between the HPCC and your PC.

A public key is used to encrypt information, can be shared, and is used by the user and the HPCC. On HPCC's end, the public key is saved in a file that contains a list of authorized public keys.

#### Why do you need them?
HPCC supports two authentication methods, Password+DUO and SSH Keys. So you will have to create a public key and save your public key in the server end for file exchange purposes. 
## How to create the SSH Key with a GUI (Graphical User Interface)
#### Step by step:
1. Enter your UCR NetID in the `Username` field.
2. Under the **`Sourcetree`** click on the `Preferences...` button to bring up the menu.
3. Click on `Accounts` and double click on your icon or press `Edit...`.
4. Make sure `SSH` is selected in the `Protocol:` dropdown menu. 
  *  If you have any existing keys, they will appear on the menu.
![fig0](/images/13e.png)
5. If you don't, hold down the Mac's option key to switch the `Copy to Clipboard` button to `Generate Key`:
![fig1](/images/14e.png)

#### Key Location
By default, your key is created in the path: `Users\YourUsername\.ssh\` which will generate the ``id_rsa`` and ``id_rsa.pub`` key files.
7. To verify it is there, open a new finder window and make sure you go to your home folder.
![fig1](/images/23.png)
8. Click on `Go` then `Go to Folder...`
![fig1](/images/21.png)
9. Type in .ssh
![fig1](/images/24.png)
10. You should see your generated key file in the folder.
![fig1](/images/25.png)
#### A visual walkthrough
![fig2](https://confluence.atlassian.com/bitbucket/files/304578655/935365609/1/1502738321650/create_ssh_mac.gif)

## Filezilla
### Downloading & Installing Filezilla
1. Download the `Filezilla Client` for Mac OS X [here](https://filezilla-project.org).
	* Make sure your Mac OS X system is updated to the latest version.
2. Follow the package walkthrough to install Filezilla.
### Adding the previously created Key file
3. Open Filezilla's "`Settings...`" option under the **`Filezilla`** heading.
![fig3](/images/7e.png)
4. Navigate to SFTP settings.
![fig4](/images/3e.png)
5. Click on the `Add key file` button.
![fig4](/images/26.png)
6. Navigate to the folder you saved your key file in (Or the default in `/Users/YourUserName/.ssh`) and open it.
  * This is the window that will pop up.
![fig4](/images/27.png)
  * Either use the search bar to find your file by name.
![fig4](/images/28.png)
  * Or press ![fig4](/images/31.png) to open the "Go to..." pane and then enter the folder you want to go into.
![fig4](/images/29.png)
7. You should see the added keyfile under the `Private keys:` heading.
![fig5](/images/30.png)
8. Click on the red x in the top left corner of the window to exit out of the window.
![fig4](/images/32.png)
### Connecting to the HPCC with your SSH Keys
1. When you start the application, you should be greeted to an empty field like so:
![fig4](/images/1e.png)
2. Enter your username in the `username` field.
3. Enter the HPCC servername `cluster.hpcc.ucr.edu` or `secure.hpcc.ucr.edu` with the `sftp://` prefix for SFTP/SSH connection.
4. Enter your password.
5. Enter `22` in the `Port` field.
![fig7](/images/8e.png)
6. Click on `Quick Connect`
7. If a pop up that prompts you to save your password comes up, press the `Save password` button, click `OK`.
8. If the following prompt shows up, click `OK`.
![fig8](/images/6e.png)
9. Now you are connected to Filezilla!
![fig9](/images/4e.png)
#### Connecting to the HPCC with your Password+DUO
These will be the same instructions as above, the difference will be when you press `Quick Connect` then you will see the DUO pop up prompt.
1. Enter your username in the `username` field.
2. Enter the HPCC servername `secure.hpcc.ucr.edu` with the `sftp://` prefix for SFTP/SSH connection.
3. Enter your password.
4. Enter `22` in the `Port` field.
5. Select `Connect` in the window.
6. When prompted, type a `1` to send a Duo Push to your mobile device, then authenticate with your Duo device.
7. Upon successful authentication, you will be logged in to the cluster through FileZilla.

## Final Verification
### Moving private key to HPCC
1.  Move your key file by dragging it from your finder window to the `.ssh` folder on the right side of the pane as shown below:
![fig10](/images/4e.png)
2. You have your key file set up!

### Transferring files
1. Your local computer files are on your left.
2. Your remote repository of files from the HPCC is on your right.
3. Make sure your directory path is correct. 
4. For more help, refer to Filezilla's help file or press `Help` on the topbar.