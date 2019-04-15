---
layout: page
title: Linux Cluster - Security
permalink: manuals_linux-cluster_security.html
---

## Protection Levels and Classification
UCR protection levels, and data classifications are outlined by UCOP as a UC wide policy: [UCOP Institutional Information and IT Resource Classification](https://security.ucop.edu/policies/institutional-information-and-it-resource-classification.html)
According to the above documentation, there are 4 levels of protection for 4 classifications of data:

| Protection Level | Policy | Examples                                                                                                                               |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| P1 - Minimal     | IS-1   | Internet facing websites, press releases, anything intended for public use                                                             |
| P2 - Low         | IS-2   | Unpublished research work, intellectual property NOT classified as P3 or P4                                                            |
| P3 - Moderate    | IS-3   | Research information classified by an Institutional Review Board as P3 (ie. dbGaP from NIH)                                            |
| P4 - High        | IS-4   | Protected Health Information (PHI/HIPAA), patient records, sensitive identifiable human subject research data, Social Security Numbers |

The HPC cluster could be compliant with with other security polices (ie. NIH), however the policy must be reviewed by our security team.

At this time the HPC cluster is not a IS-4 (P4) compliant cluster. If you have needs for very sensitive data, it may be best to work with UCSD and their [Sherlock service](https://sherlock.sdsc.edu/).
Our cluster is IS-3 compliant, however there are several responsibilities that users will need to adhere to.

## General Guidelines
First, please contact us (support@hpcc.ucr.edu) before transferring any data to the cluster.
After we have reviewed your needs, data classification and appropriate protection level, then it may be possible to proceed to use the HPCC.
Here are a few basic rules to keep in mind:

* Always be aware of access control methods (Unix permissions and ACLs), do not allow others to view the data (ie. chmod 400 filename)
* Do not make unnecessary copies of the data
* Do not transfer the data to insecure locations
* Encrypt data when/where possible
* Delete all data when it is no longer needed

## Access Controls
When sharing files with others, it is imperative that proper permission are used.
However, basic Unix permissions (user,group,other) may not be adequate.
It is better to use ACLs in order to allow fine grained access to sensitive files.

### GPFS ACLs
GPFS is used for most of our filesystems (/rhome and /bigdata) and it uses nfsv4 style ACLs.
Users are able to explicitly allow many individuals, or groups, access to specific files or directories.

```bash
# Get current permissions and store in acls file
mmgetacl /path/to/file > ~/acls.txt

# Edit acls file containing permissions
vim ~/acls.txt

# Apply new permissions to file
mmputacl -i ~/acls.txt /path/to/file

# Delete acls file
rm ~/acls.txt
```

For more information regarding GPFS ACLs refer to the following: [GPFS ACLs](https://www.ibm.com/support/knowledgecenter/STXKQY_4.1.1/com.ibm.spectrum.scale.v4r11.adm.doc/bl1adm_nfsv4syn.htm)

### XFS ACLs
The XFS filesystem is used for the CentOS operating system and typical unix locations (/,/var,/tmp,etc), as well as /secure.
For more information on how to use ACLs under XFS, please refer to the following: [CentOS 7 XFS](https://vishmule.com/2015/06/11/access-control-list-acl-permissions-in-rhel7centos7/)

> Note: ACLs are not applicable to gocryptfs, which is a FUSE filesystem, not GPFS nor XFS.

## Encryption
Under the IS-3 policy, P3 data encryption is mandatory.
It is best if you get into the habit of doing encryption in transit, as well as encryption at rest.
This means, when you move the data (transit) or when the data is not in use (rest), it should be encrypted.

### In Transit
When transferring files make sure that files are encrypted in flight with one of the following transfer protocols:

* SCP
* SFTP
* RSYNC (via SSH)

The destination for sensitive data on the cluster must also be encrypted at rest under one of the follow secure locations:

* /dev/shm/ - This location is in RAM, so it does not exist at rest (ensure proper ACLs)
* /secure - This location is encrypted at rest with AES 256 key length (ensure proper ACLs)
* /usr/tmp/$USER/unencrypted - This location is managed by the individual $USER (gocryptfs) and is password protected


It is also possible to encrypt your files with GPG ([GPG Example](https://kb.iu.edu/d/awio)), before they are transferred.
Thus, during transfer they will be GPG encrypted. However, decryption must occur in one of the secure locations mentioned above.

> Note: Never store passphrases/passwords/masterkeys in an unsecure location (ie. a plain text script under /rhome).

### At Rest
There are 3 methods available on the cluster for encryption at rest:
  1. GPG encryption of files via the command line [GPG Example](https://kb.iu.edu/d/awio), however you must ensure proper ACLs and decryption must occur in a secure location.
  2. The location "/secure" is encrypted and is mounted on the head nodes, however you must ensure proper ACLs.
  3. Create your own location with [gocryptfs](https://nuetzlich.net/gocryptfs/forward_mode_crypto/), like so:

```bash
# Load cyptfs software
module load gocryptfs

# Create empty directory, must name it exactly as below:
mkdir ~/.encrypted
gocryptfs -aessiv -init ~/.encrypted

# Create unencrypted directory
mkdir -p /var/tmp/$USER/unencrypted

# Mount encrypted directory and open new shell within unencrypted directory
gocryptfssh ~/.encrypted /var/tmp/$USER/unencrypted

# Transfer files (ie. SCP,SFTP,RSYNC), Filezilla can be used
scp user@remote-server:sensitive_file.txt /var/tmp/$USER/unencrypted/sensitive_file.txt

# Exiting the above shell will automatically unmount the unencrypted directory
exit
```

For subsequent access to the encrypted space, (ie. computation or analysis) the follow procedure is recommended:

```bash
# Request a 2hr interactive job on an exclusive node, resources can be adjusted as needed
srun -p short --exclusive=user --pty bash -l

# Load cyptfs software
module load gocryptfs

# Create unencrypted directory
mkdir -p /var/tmp/$USER/unencrypted

# Get remaining time of job
squeue -j $SLURM_JOB_ID -h -O timeleft

# Mount encrypted filesystem, and unmount before job ends, be sure to repalce TIME_REMAINING with an appropriate amount of time
gocryptfs -ro -i TIME_REMAINING -sharedstorage ~/.encrypted /var/tmp/$USER/unencrypted

# Read test file, simulating your work or any analysis that you would do here
cd /var/tmp/unencrypted/
cat sensitive_file.txt

# Manually unmount and remove unencrypted directories, when analysis has completed, or no longer requires access
fusermount -u /var/tmp/$USER/unencrypted/
rmdir /var/tmp/$USER/unencrypted
rmdir /var/tmp/$USER
```

> WARNING: Avoid writing to the same file at the same time from different nodes. The encrypted file system cannot handle simultaneous writes and will corrupt the file. If simultaneous jobs are necessary then using write mode from a head node and read-only mode from compute nodes may be the best solution here.
 Also, be mindful of reamaining job time and make sure that you have unmounted the unencrypted directory before your job ends.

For another example on how to use gocrypfs on an HPC cluster: [Luxembourg HPC gocryptfs Example](https://hpc.uni.lu/blog/2018/sensitive-data-encryption-using-gocryptfs/)

## Deletion
To ensure the complete removal of data, it is best to `shred` files instead of removing them with `rm`. The `shred` program will overwrite the contents of a file with randomized data such that recovery of this file will be very difficult, if not impossible.

Instead of using the common `rm` command to delete something, please use the `shred` command, like so:
```
shred -u something
```
The above command will overwrite the file, and then remove (unlink) it.

