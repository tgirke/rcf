---
layout: page
title: Linux Cluster - Login macOS 
permalink: manuals_linux-cluster_login_macos.html
---

#  GUI Cluster Connection

## How to create the SSH Key
### No terminal, no problem...
#### A visual walkthrough
![fig12](https://confluence.atlassian.com/bitbucket/files/304578655/935365609/1/1502738321650/create_ssh_mac.gif)
#### Step by step:
* If you have a Github / Atlassian / Azure Dev Ops / Bitbucket account:
  * Log in
* Otherwise, enter your username or a few characters.
* Under the `**Sourcetree**` click on the `Preferences...` button to bring up the menu.
* Click on `Accounts` and double click on your icon or press `Edit...`.
* Make sure `SSH` is selected in the `Protocol:` dropdown menu. 
  *  If you have any existing keys, they will appear on the menu.
![fig0](/images/13e.png)
* If you don't, hold down the Mac's option key to switch the `Copy to Clipboard` button to `Generate Key`:
![fig0](/images/14e.png)
By default, your key is created in the path: `Users\YourUsername\.ssh\`` which will generate the ``id_rsa`` and ``id_rsa.pub`` key files.
<!-- ## How to transfer the Key / BG
### Now that you have the key, next steps:
* Create a file using the text editor of your choice in an easily accessible directory, the figure below shows the home user folder as an example of what yours should look like.
![fig1](/images/18e.png)
* Your mac will have the `textedit` application installed by default, which you can open to create a new file and save it in your `home` directory.
![fig2](/images/19e.png)
* Make sure the file is ending in the ".pub" extension, if not, rename the file using the `Enter` key from Finder.
![fig3](/images/20e.png)
* Press `use .pub`
![fig4](/images/21e.png)
 -->
## Using Filezilla to transfer files
### Downloading & Installing Filezilla
* Download the `Filezilla Client` for Mac OS X [here](https://filezilla-project.org).
  * Requires OS X 10.13.2 or newer.
* Follow the package walkthrough to install Filezilla.
### Adding the previously created Key
* Open Filezilla's "`Settings...`" option under the `**Filezilla**` heading.
![fig5](/images/7e.png)
* Navigate to SFTP settings.
![fig6](/images/3e.png)
* Click on the `Add key` button.
* Navigate to the folder you saved your key in and open it.
* You should see the added keyfile under the `Private keys:` heading.
![fig](/images/16e.png)
* Exit out of the `Settings...` menu.
### Connecting to the HPCC with your SSH Keys
* When you start the application, you should be greeted to an empty field like so:
![fig](/images/1e.png)
* Enter your username in the `username` field.
* Enter the HPCC servername `cluster.hpcc.ucr.edu` or `secure.hpcc.ucr.edu` with the `sftp://` prefix for SFTP/SSH connection.
* Enter your password.
* Enter `22` in the `Port` field.
![fig8](/8e.png)
* Click on `Quick Connect`
* If a pop up that prompts you to save your password comes up, press the `Save password` button, click `OK`.
* If the following prompt shows up, click `OK`.
![fig9](/images/6e.png)
* Now you are connected to Filezilla!
![fig9](/images/4e.png)
#### Connecting to the HPCC with your Password+DUO
* Enter your username in the `username` field.
* Enter the HPCC servername `secure.hpcc.ucr.edu` with the `sftp://` prefix for SFTP/SSH connection.
* Enter your password.
* Enter `22` in the `Port` field.
* Select `Connect` in the window.
* When prompted, type a “1” to send a Duo Push to your mobile device, then authenticate with your Duo device.
* Upon successful authentication, you will be logged in to the cluster through FileZilla.
### Transferring files
* Your local computer files are on your left.
* Your remote repository of files from the HPCC is on your right.
* Make sure your directory path is correct. 
![fig10](/images/4e.png)
* Your computer (Local folder) is on the left and the server (Remote folder) is on the right.
* Navigate to different locations on either system.
* Drag and drop files or folders to copy files.