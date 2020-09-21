---
layout: page
title: Linux Cluster - Login macOS 
permalink: manuals_linux-cluster_login_macos.html
---

#  GUI Cluster Connection
## SSH Keys
#### What are they?
 SSH (Secure Shell) keys are an access credential that is used in the SSH protocol.
In a user key set, the private key remains on the system being used to access the remote system and is used to decrypt information that is exchanged in the SSH protocol. Private keys should never be shared with anyone. A public key is used to encrypt information, can be shared, and is used by the user and the remote server. On the server end, the public key is saved in a file that contains a list of authorized public keys.



#### Why do you need them?
HPCC supports two authentication methods, Password+DUO and SSH Keys.
## How to create the SSH Key with the Terminal
## How to create the SSH Key with a GUI (Graphical User Interface)
#### Step by step:
1. If you have a Github / Atlassian / Azure Dev Ops / Bitbucket account:
  * Log in
2. Otherwise, enter your username or a few characters.
3. Under the **`Sourcetree`** click on the `Preferences...` button to bring up the menu.
4. Click on `Accounts` and double click on your icon or press `Edit...`.
5. Make sure `SSH` is selected in the `Protocol:` dropdown menu. 
  *  If you have any existing keys, they will appear on the menu.
![fig0](/images/13e.png)
6. If you don't, hold down the Mac's option key to switch the `Copy to Clipboard` button to `Generate Key`:
![fig1](/images/14e.png)
By default, your key is created in the path: `Users\YourUsername\.ssh\` which will generate the ``id_rsa`` and ``id_rsa.pub`` key files.
#### A visual walkthrough
![fig2](https://confluence.atlassian.com/bitbucket/files/304578655/935365609/1/1502738321650/create_ssh_mac.gif)

## Using Filezilla to transfer files
### Downloading & Installing Filezilla
1. Download the `Filezilla Client` for Mac OS X [here](https://filezilla-project.org).
  * Requires OS X 10.13.2 or newer.
2. Follow the package walkthrough to install Filezilla.
### Adding the previously created Key file
3. Open Filezilla's "`Settings...`" option under the **`Filezilla`** heading.
![fig3](/images/7e.png)
4. Navigate to SFTP settings.
![fig4](/images/3e.png)
5. Click on the `Add key file` button.
6. Navigate to the folder you saved your key file in and open it.
7. You should see the added keyfile under the `Private keys:` heading.
![fig5](/images/16e.png)
8. Click on the red x in the top left corner of the window to exit out of the window.
### Connecting to the HPCC with your SSH Keys
1. When you start the application, you should be greeted to an empty field like so:
2. Enter your username in the `username` field.
3. Enter the HPCC servername `cluster.hpcc.ucr.edu` or `secure.hpcc.ucr.edu` with the `sftp://` prefix for SFTP/SSH connection.
4. Enter your password.
5. Enter `22` in the `Port` field.
![fig6](/images/1e.png)
![fig7](/images/8e.png)
6. Click on `Quick Connect`
7. If a pop up that prompts you to save your password comes up, press the `Save password` button, click `OK`.
8. If the following prompt shows up, click `OK`.
![fig8](/images/6e.png)
9. Now you are connected to Filezilla!
![fig9](/images/4e.png)
#### Connecting to the HPCC with your Password+DUO
1. Enter your username in the `username` field.
2. Enter the HPCC servername `secure.hpcc.ucr.edu` with the `sftp://` prefix for SFTP/SSH connection.
3. Enter your password.
4. Enter `22` in the `Port` field.
5. Select `Connect` in the window.
6. When prompted, type a `1` to send a Duo Push to your mobile device, then authenticate with your Duo device.
7. Upon successful authentication, you will be logged in to the cluster through FileZilla.
### Transferring files
1. Your local computer files are on your left.
2. Your remote repository of files from the HPCC is on your right.
3. Make sure your directory path is correct. 
![fig10](/images/4e.png)
4. For more help, refer to Filezilla's help file or press `Help` on the topbar.