---
layout: page
title: Linux Basics - Text Editors
permalink: manuals_linux-basics_text.html
---

## Text Viewing

Here are a few commands that are used to just display the text within a file:

```bash
more <FILENAME>     # Views text, use space bar to browse, 'q' to quit
less <FILENAME>     # Also views text, uses arrow keys to browse, 'q' to quit
cat  <FILENAME>     # Concatenates files and prints content to screen
```

## Text Editors

* **Nano**
  * A simple terminal-based editor.
* **Neovim**
  * Non-graphical (terminal-based) editor. Neovim is an improved version of vim.
* **Vim** **Gvim**
  * Non-graphical (`vim`) or window-based editor (`gvim`). Vim is the improved version of vi.
* **Emacs**
  * Non-graphical or window-based editor.
* **Atom**
    * Window-based editor that runs on your local machine.

## Nano

The `nano` editor is the simplest to use and can be good for beginners:

```
nano <FILENAME>     # Open file if it exists, or create it
```

Navigation in `nano` uses the arrow keys, and all other commands are noted at the bottom of the screen.
The `CTRL` key is used in combination with other keys to execute commands in `nano`.

For example, at the bottom of the `nano` screen it is noted that `^X` is used to exit.
This means you will need to hold the `CTRL` key and then press `x` in order to quit.
After that, just follow the on screen prompts at the bottom.

For more `nano` commands, please visit [Overview of nano shortcuts](https://www.nano-editor.org/dist/latest/cheatsheet.html).

## Neovim / Vim / GVim / VI

All of these editors follow the same principals.

```
nvim <FILENAME>     # Open file if it exists, or create it
vim <FILENAME>      # Open file if it exists, or create it
gvim <FILENAME>     # Open file if it exists, or create it (must have XForwarding or VNC)
vi <FILENAME>       # Open file if it exists, or create it
```

For more information please visit [Vim Manual](manuals_linux-basics_vim).

## Emacs

Navigation in `emacs` also uses the arrow keys. It is similar to `nano`, in that, `CTRL` is combined with other keys to execute commands.

For example, to open a file, simply run the command with a file name:

```
emacs <FILENAME>     # Open file if it exists, or create it
```

Then, after you have made some changes, exit by holding the `CTRL` key and then pressing `c`, releasing and then holding the `CTRL` key once more and pressing `c` again.
After that, just follow the on screen prompts at the bottom.

For more commands in `emacs` please visit [GNU Emacs Reference Card](https://www.gnu.org/software/emacs/refcards/pdf/refcard.pdf)

## Atom

### Install
This editor should be installed on your local machine (ie. workstation, laptop).
Please visit [Atom](https://atom.io/) for software download.

### Remote Atom

#### Install Plugin

After you have `atom` installed, you need to install the `Remote Atom` plugin.
Click on `Edit`, then `Preferences`, then look for the `install` item on the left side menu.
You should then be able to type `remote-atom` in the search field, find it and install it.
After installation, `atom` should restart.

#### Start Server

Once you have `remote-atom` installed, click `Packages` in the top menu, then `Remote Atom`, and then click `Start Server`.
`Atom` may need to be restarted in order for you to see these new menu items.

#### Cluster Setup

SSH into cluster using a socket (replace `<USERNAME>` with your real username on the cluster):

```
ssh -R /rhome/<USERNAME>/.rmate.socket:localhost:52698 cluster.hpcc.ucr.edu
```

> Note: Do not use a remote PORT, you must use a SOCKET FILE as shown above. There are security issues otherwise.

After you have logged into the cluster load `rmate` (alias is optional):

```
module load rmate
alias ratom=rmate
```

You can add this into your `~/.bashrc` for convenience.

Then you should be able to open a file on the cluster and have it appear on your local machine:

```
rmate <FILENAME>
```

Once you have finished all your editing and close `atom`, be sure to delete the socket file from the cluster:
```
rm -f /rhome/<USERNAME>/.rmate.socket'
```

For more information regarding `remote-atom`, please visit [Remote-Atom](https://atom.io/packages/remote-atom).


### Hydrogen

The `Hydrogen` plugin is optional, however it can be very powerful as it can excute code remotely on a compute node and display the results like Jupyter a notebook.

#### Install plugin

The process to install is similar to other plugins; click on `Edit`, then `Preferences`, then look for the `Install` item on the left side menu.
You should then be able to type `hydrogen` in the search field, then find the plugin and click the `Install` button.

#### Cluster Setup

Submit a jupyter job to the cluster, simliar to this [Jupyter Example](https://github.com/ucr-hpcc/hpcc_slurm_examples/tree/master/jupyter).
Also you will need to setup an [SSH tunnel](https://hpcc.ucr.edu/manuals_linux-cluster_jobs.html#tunneling), as we will be using that to reach our compute node running `Jupyter`.

#### Atom Gateway

First create your gateway, under the `Hydrogen` settings. Click on `Edit`, then `Preferences`, then look for the `Packages` item on the left side menu.
Then click the `Settings` button for `Hydrogen`.

Then add the bellow connection information to the gateways option toward the bottom:

```json
[{
  "name": "HPCC Compute Node",
  "options": {
    "baseUrl": "http://localhost:PORT",
    "token": "JUPYTER_SECRET"
  }
}]
```

> NOTE: Remember to replace PORT with the local port pointing to the Jupyter port and JUPYTER_SECRET with your secret from your Jupyter URL.

After that you can click on `Packages` in the top main menu and then `Hydrogen`, then `Connect to Remote Kernel`.
Your Gateway should be displayed as `HPCC Compute Node`, click that and then `New Session`.
After you have connected you should be able to open a file and use the other `Hydrogen` menu `run` options to execute code snippets or entire scripts.

