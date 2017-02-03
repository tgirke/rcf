---
layout: page
title: Manuals
permalink: linux-basics.html
folder: /manuals/
---
## Linux Cluster

### Introduction
This manual provides an introduction to the usage of the HPCC cluster.
All servers and compute resources of the HPCC cluster are available to researchers from all departments and colleges at UC Riverside for a minimal recharge fee [(see rates)](http://biocluster.ucr.edu/~rkaundal/Documents/Recharge_Rates.pdf).
To request an account, please contact Thomas Girke [tgike@ucr.edu](mailto:tgirke.ucr.edu).
The latest hardware/facility description for grant applications is available here: [Facility Description](http://biocluster.ucr.edu/~rkaundal/Documents/HPC_Facility_Description.pdf).

#### Overview

##### Storage
* Four enterprise class HPC storage systems
* Approximately 2 PB (2048 TB) of network storage
* GPFS (NFS and SAMBA via GPFS)
* Automatic snapshots and archival backups

##### Network
* Ethernet
    * 1 Gb/s switch x 5
    * 1 Gb/s switch 10 Gig uplink
    * 10 Gb/s switch for Campus wide Science DMZ
    * redundant, load balanced, robust mesh topology
* Interconnect
    * 56 Gb/s InfiniBand (FDR)

##### Head Nodes
All users should access the cluster via ssh through biocluster.ucr.edu, this address will automatically balance traffic to one of the available head nodes.

* Penguin
    * Resources: 8 cores, 64 GB memory
    * Primary function: submitting jobs to the queuing system (Torque/Maui)
    * Secondary function: development; code editing and running small (under 50 % CPU and under 30 % RAM) sample jobs
* Pigeon
    * Resources: 16 cores, 128 GB memory
    * Primary function: submitting jobs to the queuing system (Torque/Maui)
    * Secondary function: development; code editing and running small (under 50 % CPU and under 30 % RAM) sample jobs
* Pelican
    * Resources: 32 cores, 64 GB memory
    * Primary function: submitting jobs to the queuing system (Torque/Maui)
    * Secondary function: development; code editing and running small (under 50 % CPU and under 30 % RAM) sample jobs
* Owl
    * Resources: 16 cores, 64 GB memory
    * Primary function: testing; running test sets of jobs
    * Secondary function: submitting jobs to the queuing system (Torque/Maui)
* Globus
    * Resources: 32 cores, 32 GB memory
    * Primary function: submitting jobs to the queuing system (Slurm)
    * Secondary function: development; code editing and running small (under 50 % CPU and under 30 % RAM) sample jobs

##### Worker Nodes
* Batch
    * c01-c48: each with 64 AMD cores and 512 GB memory
* Highmem
    * h01-h06: each with 32 Intel cores and 1024 GB memory
* GPU
    * gpu01-gpu02: each with 32 (HT) cores Intel Haswell CPUs and 2 x NVIDIA Tesla K80 GPUs (~10000 CUDA cores) and 128 GB memory
* Intel
    * i01-i12: each with 32 Intel Broadwell cores and  512 GB memory

### Getting Started
The initial login, brings users into a Biocluster head node (i.e. pigeon, penguin, owl). From there, users can submit jobs via qsub to the compute nodes or log into owl to perform memory intensive tasks.
Since all machines are mounting a centralized file system, users will always see the same home directory on all systems. Therefore, there is no need to copy files from one machine to another.

#### Login from Mac, Linux, Cygwin
Open the terminal and type

```
ssh -X username@biocluster.ucr.edu
```

#### Login from Windows
Please refer to the login instructions of our [Linux Basics manual](#linux-basics).

#### Change Password
1. Log-in via SSH using the Terminal on Mac/Linux or Putty on Windows
+  Once you have logged in type the following command:
```
passwd
```
+ Enter the old password (the random characters that you were given as your initial password)
+ Enter your new password

The password minimum requirements are:
* Total length at least 8 characters long
* Must have at least 3 of the following:
    * Lowercase character
    * Uppercase character
    * Number
    * Punctuation character

#### Modules
All software used on Biocluster is managed through a simple module system.
You must explicitly load and unload each package as needed.
More advanced users may want to load modules within their bashrc, bash_profile, or profile files.

##### Available Modules
To list all available software modules, execute the following:

```
module avail
```

This should output something like:

```
------------------------- /usr/local/Modules/versions --------------------------
3.2.9
--------------------- /usr/local/Modules/3.2.9/modulefiles ---------------------
BEDTools/2.15.0(default) modules
PeakSeq/1.1(default) python/3.2.2
SOAP2/2.21(default) samtools/0.1.18(default)
bowtie2/2.0.0-beta5(default) stajichlab
cufflinks/1.3.0(default) subread/1.1.3(default)
matrix2png/1.2.1(default) tophat/1.4.1(default)
module-info
```

##### Using Modules
To load a module, run:

```
module load <software name>[/<version>]
```

To load the default version of the tophat module, run:

```
module load tophat
```

##### Show Loaded Modules

To show what modules you have loaded at any time, you can run:

```
module list
```

Depending on what modules you have loaded, it will produce something like this:

```
Currently Loaded Modulefiles:
  1) vim/7.4.1952                  3) slurm/16.05.4                 5) R/3.3.0                       7) less-highlight/1.0            9) python/3.6.0
  2) tmux/2.2                      4) openmpi/2.0.1-slurm-16.05.4   6) perl/5.20.2                   8) iigb_utilities/1
```

##### Unloading Software

Sometimes you want to no longer have a piece of software in path. To do this you unload the module by running:

```
module unload <software name>
```

##### Additional Features
There are additional features and operations that can be done with the module command. Please run the following to get more information:

```
module help
```

### Quotas

#### CPU
Currently, the maximum number of CPU cores a user can use simultaneously on biocluster is 256 CPU cores when the load on the cluster is <30% and 128 CPU cores when the load is above 30%. If a user submits jobs for more than 256/128 CPU cores then the additional requests will be queued until resources within the user's CPU quota become available. Upon request a user's upper CPU quota can be extended temporarily, but only if sufficient CPU resources are available. To avoid monopolisation of the cluster by a small number of users, the high load CPU quota of 128 cores is dynamically readjusted by an algorithm that considers the number of CPU hours accumulated by each user over a period of 2 weeks along with the current overall CPU usage on the cluster. If the CPU hour average over the 2 week window exceeds an allowable amount then the default CPU quota will be reduced for such a heavy user to 64 CPU cores, and if it exceeds the allowable amount by two-fold it will be reduced to 32 CPU cores. Once the average usage of a heavy user drops again below those limits, the upper CPU limit will be raised accordingly. Note: when the overall CPU load on the cluster is below 70% then the dynamically readjusted CPU quotas are not applied. At those low load times every user has the same CPU quota: 256 CPU cores at <30% load and 128 CPU cores at 30-70% load.

#### Data Storage
A standard user account has a storage quota of 20GB. Much more storage space, in the range of many TBs, can be made available in a user account's bigdata directory. The amount of storage space available in bigdata depends on a user group's annual subscription. The pricing for extending the storage space in the bigdata directory is available [here](/home).

#### Memory
From the Biocluster head node users can submit jobs to the batch queue or the highmem queue. The nodes associated with the batch queue are mainly for CPU intensive tasks, while the nodes of the highmem queue are dedicated to memory intensive tasks. The batch nodes allow a 1GB RAM minimum limit on jobs and and the highmem nodes allow 16GB-512GB RAM jobs.

### What's Next?
You should now know the following:

1. Basic orginization of Biocluster
+  How to login to Biocluster
+  How to use the Module system to gain access to Biocluster software
+  CPU, storage, and memory limitations (quotas and hardware limits)

Now you can start using Biocluster.
The recommended way to run your jobs (scripts, pipelines, experiments, etc...) is to submit them to the queuing system by using sbatch.
Biocluster uses the Slurm queuing system.
Please do not run ANY computationally intensive tasks on any head node that starts with the letter "P" (i.e. penguin, pigeon, parrot). If this policy is violated, your jobs will be killed to limit the negative impact on others.
The head nodes are a shared resource and should be accessible by all users. Negatively impacting performance would affect all users on the system and will not be tolerated.

However you may run memory intensive jobs on Owl.
Login to Owl like so:

```
ssh -X owl.ucr.edu
```

### Managing Jobs
Submitting and managing jobs is at the heart of using the cluster.  A 'job' refers to the script, pipeline or experiment that you run on the nodes in the cluster.

#### Partitions
In the past we used queues under the old Torque system, we now refer to these logically grouped nodes as partitions. There are several different partitions available for cluster users to send jobs to:

* batch
    * Nodes: c01-c48
    * Cores: AMD, 256 per user
    * RAM: 1 GB default
    * Time (walltime): 168 hours (7 days) default
* highmem
    * Nodes: h01-h04
    * Cores: Intel, 32 per user
    * RAM: 16 GB min and 1024 GB max
    * Time (walltime): 48 hours (2 days) default
* gpu
    * Nodes: gpu01-gpu02
    * Cores: Intel, 16 per user
    * RAM: 128 GB default
    * Time (walltime): 100 hours  default
* intel
    * Default partition
    * Nodes: i01-i12
    * Cores: Intel, 64 per user
    * RAM: 1 GB default
    * Time (walltime): 168 hours (7 days) default
* Group Partition
    * This partition is unique to the group, if your lab has purchased nodes then you will have a priority partition with the same name as your group (ie. girkelab).
In order to submit a job to different partitions add the optional '-p' parameter with the name of the partition you want to use:

```
sbatch -p batch SBATCH_SCRIPT.sh
sbatch -p highmem SBATCH_SCRIPT.sh
sbatch -p gpu SBATCH_SCRIPT.sh
sbatch -p intel SBATCH_SCRIPT.sh
sbatch -p mygroup SBATCH_SCRIPT.sh
```

#### Slurm
Slurm is now our default queuing system across all head nodes. [SSH directly into the cluster](#getting-started) and your connection will be automatically load balanced to a head node:

```
ssh -XY biocluster.ucr.edu
```

##### Submitting Jobs
There are 2 basic ways to submit jobs; non-interactive, interactive. Slurm will automatically start within the directory where you submitted the job from, so keep that in mind when you use relative file paths.
Non-interactive submission of a SBATCH script:

```
sbatch SBATCH_SCRIPT.sh
```

Here is an example of an SBATCH script:

```
#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1G
#SBATCH --time=1-00:15:00     # 1 day and 15 minutes
#SBATCH --output=my.stdout
#SBATCH --mail-user=useremail@address.com
#SBATCH --mail-type=ALL
#SBATCH --job-name="just_a_test"
#SBATCH -p intel # This is the default partition, you can use any of the following; intel, batch, highmem, gpu


# Print current date
date

# Load samtools
module load samtools

# Change directory to where you submitted the job from, so that relative paths resolve properly
cd $SLURM_SUBMIT_DIR

# Concatenate BAMs
samtools cat -h header.sam -o out.bam in1.bam in2.bam

# Print name of node
hostname
```

The above job will request 1 node, 10 task (1 cpu core per task), 10GB of memory (1GB per task), for 1 day and 15 minutes. All STDOUT will be redirected to a file called "my.stdout" as well as an email sent to the user when the status of the job changes.

Interactive submission:

```
srun --pty bash -l
```

If you do not specify a partition then the intel partition is used by default.

Here is a more complete example:

```
srun --x11 --mem=1gb --cpus-per-task 1 --ntasks 1 --time 10:00:00 --pty bash -l
```

The above example enables X11 forwarding and requests, 1GB of memory, 1 cores, for 10 hours within an interactive session.

##### Monitoring Jobs
To check on your jobs states, run the following:

```
squeue -u username
```

To list all the details of a specific job, run the following:

```
scontrol show job <JOBID>
```

##### Advanced Jobs
There is a third way of submitting jobs by using steps.
Single Step submission:

```
srun <command>
```

Under a single step job your command will hang until appropriate resources are found and when the step command is finished the results will be sent back on STDOUT. This may take some time depending on the job load of the cluster.
Multi Step submission:

```
salloc -N 4 bash -l
srun <command>
...
srun <command>
exit
```

Under a multi step job the salloc command will request resources and then your parent shell will be running on the head node. This means that all commands will be executed on the head node unless preceeded by the srun command. You will also need to exit this shell in order to terminate your job.

##### GPU Jobs
A single GPU job will no longer reserve an entire node. For each node there are 4 GPUs. This means that you need to request how many GPUs that you would like to use.
Non-Interactive:

```
srun -p gpu --mem=100g --time=1:00:00 SBATCH_SCRIPT.sh
```

Interactive

```
srun -p gpu --gres=gpu:4 --mem=100g --time=1:00:00 --pty bash -l
```

Of course you should adjust the time argument according to your job requirements.

Once your job starts your code must reference the environment variable "CUDA_VISIBLE_DEVICES" which will indicate which GPUs have been assigned to your job. Most CUDA enabled software, like MegaHIT, will check this environment variable and automatically limit accordingly.

For example, when reserving 4 GPUs for a NAMD2 job:

```
    echo $CUDA_VISIBLE_DEVICES
    0,1,2,3
    namd2 +idlepoll +devices $CUDA_VISIBLE_DEVICES MD1.namd
```

Each user is limited to a maximum of 4 GPUs on the gpu partition. Please be respectful of others and keep in mind that the GPU nodes are a limited shared resource.
Since the CUDA libraries will only run with GPU hardware then development and compiling of code must be done within a job session on a GPU node, examples mentioned above.

Here are a few more examples of jobs that utilize more complex features (ie. array, dependency, MPI etc):
[Slurm Examples](http://biocluster.ucr.edu/~jhayes/slurm/examples/)

### Data Storage
HPCC cluster users are able to check on their home and bigdata storage usage from the [Dashboard Portal](https://dashboard.bioinfo.ucr.edu).

#### Home
Home directories are where you start each session on biocluster and where your jobs start when running on the cluster.  This is usually where you place the scripts and various things you are working on.  This space is very limited.  Please remember that the home storage space quota per user account is 20 GB.

Path                 | /rhome/<username>
-------------------- | ----------------
User  Availability   | All Users
Node  Availability   | All Nodes
Quota Responsibility | User

#### Bigdata
Bigdata is an area where large amounts of storage can be made available to users. A lab purchases bigdata space separately from access to the cluster. This space is then made available to the lab via a shared directory and individual directories for each user.

__Lab Shared Space__
This directory can be accessed by the lab as a whole.

Path                 | /bigdata/<labname>/shared
-------------------- | --------------------------
User Availability    | Labs that have purchased space.
Node Availability    | All Nodes
Quota Responsibility | Lab

__Individual User Space__
This directory can be accessed by specific lab members.

Path                 | /bigdata/<labname>/<username>
-------------------- | -----------------------------
User Availability    | Labs that have purchased space.
Node Availability    | All Nodes
Quota Responsibility | Lab

#### Non-Persistent Space
Frequently, there is a need to do things like, output a significant amount of intermediate data during a job, access a dataset from a faster medium than bigdata or the home directories or write out lock files. These types of things are well suited to the use of non-persistent spaces. Below are the filesystems available on biocluster.

__RAM Space__
This type of space takes away from physical memory but allows extremely fast access to the files located on it. When submitting a job you will need to factor in the space your job is using in RAM as well. For example, if you have a dataset that is 1G in size and use this space, it will take at least 1G of RAM.

Path                 | /dev/shm
-------------------- | ---------
User Availability    | All Users
Node Availability    | All Nodes
Quota Responsibility | N/A

__Temporary Space__
This is a standard space available on all Linux systems. Please be aware that it is limited to the amount of free disk space on the node you are running on.

Path                 | /tmp
-------------------- | ---------
User Availability    | All Users
Node Availability    | All Nodes
Quota Responsibility | N/A

__SSD Backed Space__
This space is much faster than the standard temporary space, but slower than using RAM based storage.

Path                 | /scratch
-------------------- | --------
User Availability    | All Users
Node Availability    | All Nodes
Quota Responsibility | N/A

### Usage and Quotas
To quickly check your usage and quota limits:

```
check_quota home
check_quota bigdata
```

To get the usage of your current directory, run the following command:

```
du -sh .
```

To calculate the sizes of each separate sub directory, run:

```
du -shc *
```

This may take some time to complete, please be patient.

For more information on your home directory, please see the Orientation section in the  Linux Basics manual.

#### Sharing data with other users
It is useful to share data and results with other users on the cluster, and we encourage collaboration  The easiest way to share a file is to place it in a location that both users can access. Then the second user can simply copy it to a location of their choice. However, this requires that the file permissions permit the second user to read the file.
Basic file permissions on Linux and other Unix like systems are composed of three groups: owner, group, and other. Each one of these represents the permissions for different groups of people: the user who owns the file, all the group members of the group owner, and everyone else, respectively  Each group has 3 permissions: read, write, and execute, represented as r,w, and x. For example the following file is owned by the user 'jhayes' (with read, write, and execute), owned by the group 'operations' (with read and execute), and everyone else cannot access it.

```
jhayes@pigeon:~$ ls -l myFile
-rwxr-x---   1 jhayes bioinfo 1.6K Nov 19 12:32 myFile
```

If you wanted to share this file with someone outside the 'operations' group, read permissions must be added to the file for 'other'.
Set Default Permissions

In Linux, it is possible to set the default file permission for new files. This is useful if you are collaborating on a project, or frequently share files and  you do not want to be constantly adjusting permissions  The command responsible for this is called 'umask'. You should first check what your default permissions currently are by running 'umask -S'.

```
jhayes@pigeon:~$ umask -S
u=rwx,g=rx,o=rx
```

To set your default permissions, simply run umask with the correct options. Please note, that this does not change permissions on any existing files, only new files created after you update the default permissions. For instance, if you wanted to set your default permissions to you having full control, your group being able to read and execute your files, and no one else to have access, you would run:

```
jhayes@pigeon:~$ umask u=rwx,g=rx,o=
```

It is also important to note that these settings only affect your current session. If you log out and log back in, these settings will be reset. To make your changes permanent you need to add them to your '.bashrc' file, which is a hidden file in your home directory (if you do not have a '.bashrc' file, you will need to create an empty file called '.bashrc' in your home directory). Adding umask to your .bashrc file is as simple as adding your umask command (such as 'umask u=rwx,g=rx,o=r') to the end of the file. Then simply log out and back in for the changes to take affect. You can double check that the settings have taken affect by running 'umask -S'.
