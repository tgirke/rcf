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

#### MobaXterm

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

Now that you have created your `SSH keys`, and renamed them, you will need to placed the public key (`id_rsa.pub`) on the cluster using the `cluster.hpcc.ucr.edu`

1. Start the `Filezilla` application.

2. Fill in the `Quickconnect` fields at the top of the application window:

   * Enter your HPCC username in the `Username` field.
   * Enter the HPCC servername `cluster.hpcc.ucr.edu` for the `Host` field.
   * Enter your password in the `Password` field.
   * Enter `22` in the `Port` field.

   ![filezilla1](images/filezilla1.png)

3. Click on `Quickconnect`

   ![filezilla2](images/filezilla2.png)

4. If a pop up prompts you to save your password, select the `Save passwords` option, then click the `OK` button.

5. If the next pop up prompts you, then check the box that states `Always trust this host, add this key to the cache`, then click the `OK` button.

   ![filezilla3](images/filezilla3.png)

6. Now that you are connected to Filezilla transfer your public SSH key from your system by dragging the file `id_rsa.pub` and drop

   ![filezilla4](images/filezilla4.png)


#### Private SSH Key

Once your public key is in place, now you can configure `Filezilla` to use your private `SSH key` and connect to the cluster through the `secure.hpcc.ucr.edu` server.

1. Open Filezilla `Site Manager` button in the top bar of icons.

   ![filezilla5](images/filezilla5.png)

2. Click on `New Site`, rename it (optional) and press enter.

   ![filezilla6](images/filezilla6.png)

3. Make sure the following fields are correctly filled before adding your `SSH key` file:

   * `Protocol`: should be set to `SFTP - SSH File Transfer Protocol`
   * `Host`: type in `secure.hpcc.ucr.edu`
   * `Port`: type `22`
   * `Logon Type`: set to `Key file`
   * `User`: type in your HPCC username

   After these fields are finalized, click the `Browse..` button.

   ![filezilla7](images/filezilla7.png)

4. Navigate to the folder you saved your key file in and open the private key file `id_rsa`.

   ![filezilla8](images/filezilla8.png)

5. You should see the added keyfile in the `Key file:` box, then click `Connect`.

   ![filezilla9](images/filezilla9.png)

   Subsequnt connections can be done from the `Quickconnect` history by clicking on the down arrow to the right side of the `Quickconnect` button.


9. Remember to select the `secure.hpcc.ucr.edu` address.

   ![filezilla11](images/filezilla11.png)

10. Transfer files by double clicking or drag-n-drop. For more details regarding file transfers vist [Filezilla Usage](some_other_page).
