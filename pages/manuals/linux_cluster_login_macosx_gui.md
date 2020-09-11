#  GUI Cluster Connection

## How to create the SSH Key
### No terminal, no problem...
* If you have a Github / Atlassian / Azure Dev Ops / Bitbucket account:
* Log in
* Under the `**Sourcetree**` click on the `Preferences...` button to bring up the menu.
* Click on `Accounts` and double click on your icon or press `Edit...`.
* Make sure `SSH` is selected in the `Protocol:` dropdown menu. 
*  If you have any existing keys, they will appear on the menu.
Figure 1.1: ![noh](/9.png)
By default, your key is created in the path: `Users\YourUsername\.ssh\` which will generate the `id_rsa` and `id_rsa.pub` key files.
## How to transfer the Key / BG
### Now that you have the key, next steps:
* Create a file using the text editor of your choice in an easily accessible directory, the figure below shows the home user folder.
Figure 1.1: ![yek](/1.png)
* Make sure the file is ending in the ".pub" extension, if not, rename the file using the `Enter` key from Finder.
## Using Filezilla to transfer files

### Downloading & Installing Filezilla
* Download the `Filezilla Client` for Mac OS X [here](https://filezilla-project.org).
* Requires OS X 10.13.2 or newer.
* Follow the package walkthrough to install Filezilla.
### Adding the previously created Key
* Open Filezilla's "`Settings...`" option under the `**Filezilla**` heading.
Figure 1.1: ![do](/2.png)
* Navigate to SFTP settings.
Figure 1.1: ![seh](/3.png)
* Click on the `Add key` button.
* Navigate to the folder you saved your key in and open it.
Figure 1.1: ![chahar](/4.png)
* Exit out of the `Settings...` menu.

### Connecting to the HPCC 
* Enter your username in the username field.
* Enter the HPCC servername `cluster.hpcc.ucr.edu`.
* Enter the password.
Figure 1.1: ![panj](/5.png)
* Click on `Quick Connect`
* During the `Save password` prompt, click OK.
Figure 1.1: ![sheesh](/6.png)
* Now you are connected to Filezilla!

### Transferring files
* Your local computer files are on your left.
* Your remote repository of files from the HPCC is on your right.
* Make sure your directory path is correct. 
Figure 1.1: ![haft](/7.png)
* Double click on a file
Figure 1.1: ![hasht](/8.png)

GIF FROM WEBSITE:
Figure x.x: ![creating SSH Key](https://confluence.atlassian.com/bitbucket/files/304578655/935365609/1/1502738321650/create_ssh_mac.gif)
