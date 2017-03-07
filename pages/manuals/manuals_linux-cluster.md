---
layout: page
title: Linux Cluster
permalink: manuals_linux-cluster.html
---

## Monitoring Resources and Limits
The easiest way to find out what your group (or associated Slurm account) is with the following:

```bash
id -gn
```

The Above command will list your primary group.

It is possible to iterate over all the jobs in squeue and add up all the CPU cores to see how many are available for your group.
This will give you the total number of cores used by your group in the batch partition:

```bash
echo $(squeue -A $GROUP -p batch -o '%C' -t Running | grep -P '^[0-9]' | tr '\n' '+' | sed 's/+$//g') | bc
```

However this does not tell you when your job will start, since it depends on the duration of each job.
The best way to do this is with the "--start" flag on the squeue command:

```bash
squeue --start -u $USER
```

Also, if you want to see your limits you can do that with the following:

```bash
sacctmgr show account $GROUP format=Account,User,Partition,GrpCPUs,GrpMem,GrpNodes --ass | grep $USER
```

And for your overall CPU limit for the group:

```bash
sacctmgr show account $GROUP format=Account,User,Partition,GrpCPUs,GrpMem,GrpNodes --ass | head -3
```

## Communicating with others

The cluster is a shared resource, and communicating with other users can help to schedule large computations.

__Looking-Up Specific Users__

A convenient overview of all users and their lab affiliations can be retrieved with the following command:

```bash
user_details.sh
```

You can search for specific users by running:

```bash
MATCH1='tgirke' # Searches by real name, and username, and email address and PI name
MATCH2='jhayes'
user_details.sh | grep -P "$MATCH1|$MATCH2"
```

__Listing Users with Active Jobs on the Cluster__
To get a list of usernames:

```bash
qstat | awk '{print $3}' | sort | uniq | grep "^[^-N]"
```

To get the list of real names:

```bash
grep <(user_details.sh | awk '{print $2,$3,$4}') -f <(qstat | awk '{print $3}' | sort | uniq | grep "^[^-N]") | awk '{print $1,$2}'
```

To get the list of emails:

```bash
grep <(user_details.sh | awk '{print $4,$5}') -f <(qstat | awk '{print $3}' | sort | uniq | grep "^[^-N]") | awk '{print $2}'
```

## Sharing Files on the Web

Simply create a symbolic link or move the files into your html directory when you want to share them.
For exmaple, log into Biocluster and run the following:

```bash
# Make new web project directory
mkdir www-project

# Create a default test file
echo '<h1>Hello!</h1>' > ./www-project/index.html

# Create shortcut/link for new web project in html directory 
ln -s `pwd`/www-project ~/.html/
```

Now, test it out by pointing your web-browser to http://biocluster.ucr.edu/~username/www-project/
Be sure to replace `username` with your actual user name.

## Password Protect Web Pages

Files in web directories can be password protected.
First create a password file and then create a new user:

```bash
touch ~/.html/.htpasswd
htpasswd ~/.html/.htpasswd newwebuser
```

This will prompt you to enter a password for the new user 'newwebuser'.
Create a new directory, or go to an existing directory, that you want to password protect:

```bash
mkdir ~/.html/locked_dir
cd ~/.html/locked_dir
```

For the above commands you can choose any directory name you want.

Then place the following content within a file called `.htaccess`:

```apache
AuthName 'Please login'
AuthType Basic
AuthUserFile /rhome/username/.html/.htpasswd
require user newwebuser
```

Now, test it out by pointing your web-browser to http://biocluster.ucr.edu/~username/locked_dir
Be sure to replace `username` with your actual user name for the above code and URL.

