---
layout: page
title: Linux Cluster - Managing Jobs
permalink: manuals_linux-cluster_jobs.html
---

## What is a Job?
Submitting and managing jobs is at the heart of using the cluster.  A 'job' refers to the script, pipeline or experiment that you run on the nodes in the cluster.

## Partitions
In the past we used queues under the old Torque system, we now refer to these logically grouped nodes as partitions. There are several different partitions available for cluster users to send jobs to:

* batch
    * Nodes: c01-c48
    * Cores: AMD, 256 per user
    * RAM: 1 GB default
    * Time (walltime): 168 hours (7 days) default
* highmem
    * Nodes: h01-h04
    * Cores: Intel, 32 per user
    * RAM: 100 GB min and 1000 GB max
    * Time (walltime): 48 hours (2 days) default
* gpu
    * Nodes: gpu01-gpu04
    * GPUs: 8 per group
    * RAM: 1 GB default
    * Time (walltime): 48 hours (2 days) default
* intel
    * Default partition
    * Nodes: i01-02,i17-i40
    * Cores: Intel, 256 per user
    * RAM: 1 GB default
    * Time (walltime): 168 hours (7 days) default
* short
    * Nodes: i01-i40
    * Cores: Intel, 256 per user
    * RAM: 1 GB default
    * Time (walltime): 2 hours Maximum
* Group Partition
    * This partition is unique to the group, if your lab has purchased nodes then you will have a priority partition with the same name as your group (ie. girkelab).
In order to submit a job to different partitions add the optional '-p' parameter with the name of the partition you want to use:

```bash
sbatch -p batch SBATCH_SCRIPT.sh
sbatch -p highmem SBATCH_SCRIPT.sh
sbatch -p gpu SBATCH_SCRIPT.sh
sbatch -p intel SBATCH_SCRIPT.sh
sbatch -p mygroup SBATCH_SCRIPT.sh
```

## Slurm
Slurm is now our default queuing system across all head nodes. [SSH directly into the cluster](#getting-started) and your connection will be automatically load balanced to a head node:

```bash
ssh -XY cluster.hpcc.ucr.edu
```

### Resources and Limits
To see your limits you can do the following:

```bash
slurm_limits
```

Check total number of cores used by your group in the all partitions:

```bash
group_cpus
```

However this does not tell you when your job will start, since it depends on the duration of each job.
The best way to do this is with the "--start" flag on the squeue command:

```bash
squeue --start -u $USER
```

### Submitting Jobs
There are 2 basic ways to submit jobs; non-interactive, interactive. Slurm will automatically start within the directory where you submitted the job from, so keep that in mind when you use relative file paths.
Non-interactive submission of a SBATCH script:

```bash
sbatch SBATCH_SCRIPT.sh
```

Here is an example of an SBATCH script:

```bash
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

```bash
srun --pty bash -l
```

If you do not specify a partition then the intel partition is used by default.

Here is a more complete example:

```bash
srun --x11 --mem=1gb --cpus-per-task 1 --ntasks 1 --time 10:00:00 --pty bash -l
```

The above example enables X11 forwarding and requests, 1GB of memory, 1 cores, for 10 hours within an interactive session.

### Monitoring Jobs
To check on your jobs states, run the following:

```bash
squeue -u $USER --start
```

To list all the details of a specific job, run the following:

```bash
scontrol show job JOBID
```

To view past jobs and their details, run the following:

```bash
sacct -u $USER -l
```

You can also adjust the start `-S` time and/or end `-E` time to view, using the YYYY-MM-DD format.
For example, the following command uses start and end times:

```bash
sacct -u $USER -S 2018-01-01 -E 2018-08-30 -l | less -S # Type 'q' to quit
```

### Canceling Jobs
In cancel/stop your job run the following:

```bash
scancel <JOBID>
```

You can also cancel multiple jobs:

```bash
scancel <JOBID1> <JOBID2> <JOBID3>
```

If you want to cancel/stop/kill ALL your jobs it is possible with the following:

```bash
# Be very careful when running this, it will kill all your jobs.
squeue --user $USER --noheader --format '%i' | xargs scancel
```

For more information please refer to [Slurm scancel documentation](https://slurm.schedmd.com/scancel.html "Slurm scancel doc").

### Advanced Jobs
There is a third way of submitting jobs by using steps.
Single Step submission:

```bash
srun <command>
```

Under a single step job your command will hang until appropriate resources are found and when the step command is finished the results will be sent back on STDOUT. This may take some time depending on the job load of the cluster.
Multi Step submission:

```bash
salloc -N 4 bash -l
srun <command>
...
srun <command>
exit
```

Under a multi step job the salloc command will request resources and then your parent shell will be running on the head node. This means that all commands will be executed on the head node unless preceeded by the srun command. You will also need to exit this shell in order to terminate your job.

### Highmem Jobs
The highmem partition does not have a default amount of memory set, however it does has a minimum limit of 100GB per job. This means that you need to explicity request at least 100GB or more of memory.

Non-Interactive:

```bash
sbatch -p highmem --mem=100g --time=24:00:00 SBATCH_SCRIPT.sh
```

Interactive

```bash
srun -p highmem --mem=100g --time=24:00:00 --pty bash -l
```

Of course you should adjust the time argument according to your job requirements.

### GPU Jobs
A single GPU job will no longer reserve an entire node. For each node there are 4-8 GPUs. This means that you need to request how many GPUs that you would like to use.

Non-Interactive:

```bash
sbatch -p gpu --gres=gpu:1 --mem=100g --time=1:00:00 SBATCH_SCRIPT.sh
```

Interactive

```bash
srun -p gpu --gres=gpu:4 --mem=100g --time=1:00:00 --pty bash -l
```

Of course you should adjust the time argument according to your job requirements.

Once your job starts your code must reference the environment variable "CUDA_VISIBLE_DEVICES" which will indicate which GPUs have been assigned to your job. Most CUDA enabled software, like MegaHIT, will check this environment variable and automatically limit accordingly.

For example, when reserving 4 GPUs for a NAMD2 job:

```bash
echo $CUDA_VISIBLE_DEVICES
0,1,2,3
namd2 +idlepoll +devices $CUDA_VISIBLE_DEVICES MD1.namd
```

Each group is limited to a maximum of 8 GPUs on the gpu partition. Please be respectful of others and keep in mind that the GPU nodes are a limited shared resource.
Since the CUDA libraries will only run with GPU hardward, development and compiling of code must be done within a job session on a GPU node.

Here are a few more examples of jobs that utilize more complex features (ie. array, dependency, MPI etc):
[Slurm Examples](https://cluster.hpcc.ucr.edu/~jhayes/slurm/examples/)

### Web Browser Access
#### Ports
Some jobs require web browser access in order to utilize the software effectively.
These kinds of jobs typically use (bind) ports in order to provide a graphical user interface (GUI) through a web browser.
Users are able to run jobs that use (bind) ports on a compute node.
Any port can be used on any compute node, as long as the port number is above 1000 and it is not already in use (bound).

#### Tunneling
Once a job is running on a compute node and bound to a port, you may access this compute node via a web browser.
This is accomplished by using 2 chained SSH tunnels to route traffic through our firewall.
This acts much like 2 runners in a relay race, handing the baton to the next runer, to get past a security checkpoint.

First we log into the pigeon headnode with a tunneled port (can be 8080, or anything above 1000):

```bash
ssh -L 8080:localhost:8081 labde005@pigeon.hpcc.ucr.edu
```

Port 8080 (first) is the local port you will be using on your laptop.
Port 8081 (second) is the remote port on pigeon that act as a bridge to the compute node.

After you have logged in with the above command, execute the following:

```bash
ssh  -L 8081:NodeName:8082 -N NodeName
```

Port 8081 (first) must be the same as the port you used in the previous command, since we are creating a bridge for traffic to come from that port.
Port 8082 (second) is whatever port your job is using.
Again, the NodeName and ports will be different depending on where your job runs and what port your job uses.

At this point you may need to provide a password to make the SSH tunnel.
Once this has succeeded, the command will hang (this is normal).
Leave this session connected, if you close it your tunnel will be closed.

Then open a browser on your local computer (PC/laptop) and point it to:

```
http://localhost:8080
```

If your job uses TSL/SSL, so you may need to try https if the above does not work:

```
https://localhost:8080
```

### VPN
We are currently exploring this to support easier connectivity to the cluster and it's resources.

### Licenses
The cluster currently supports [Commercial Software](software_commercial). Since most of the licenses are campus wide there is no need to track individual jobs. One exception is the Intel Parallel Suite, which contains the Intel compilers.

The `--licenses` flag is used to request a license for Intel compilers, for example:

```bash
srun --license=intel:1 -p short --mem=10g --cpus-per-task=10 --time=2:00:00 --pty bash -l
module load intel
icc -help
```

The above interactive submission will request 1 Intel license, 10GB of RAM, 10 CPU cores for 2 hours on the short partition.
The short parititon can only be used for a maximum of 2 hours, however for compilation this could be sufficient.
It is recommended that you separate your compilation job from your computation/analysis job.
This way you will only have the license checked out for the duration of compilation, and not the during the execution of the analysis.

## Parallelization
There are 3 major ways to parallelize work on the cluster:

   1. Batch
   2. Thread
   3. MPI

### Parallel Methods
For __batch__ jobs, all that is required is that you have a way to split up the data and submit multiple jobs running with the different chunks.
Some data sets, for example a FASTA file is very easy to split up (ie. fasta-splitter). This can also be more easily achieved by submitting an array job. For more details please refer to [Advanced Jobs](#advanced-jobs).

For __threaded__ jobs, your software must have an option referring to "number of threads" or "number of processors". Once the thread/processor option is identified in the software, (ie. blastn flag `-num_threads 4`) you can use that as long as you also request the same number of CPU cores (ie. slurm flag `--cpus-per-task=4`).

For __MPI__ jobs, your software must be MPI enabled. This generally means that it was compiled with MPI libraries. Please refer to the user manual of the software you wish to use as well as our documentation regarding [MPI](#mpi). It is important that the number of cores used is equal to the number requested.

In Slurm you will need 2 different flags to request cores, which may seem similar, however they have different purposes:

   * The `--cpus-per-task=N` will provide N number of virtual cores with locality as a factor.
     Closer virtual cores can be faster, assuming there is a need for rapid communication between threads.
     Generally, this is good for threading, however not so good for independent subprocesses nor for MPI.
   * The `--ntasks=N` flag will provide N number of physical cores on a single or even multiple nodes.
     These cores can be further away, since the need for physical CPUs and dedicated memory is more important.
     Generally this is good for independent subprocesses, and MPI, however not so good for threading.

Here is a table to better explain when to use these Slurm options:

|                   | Single Threaded                   | Multi Threaded (OpenMP) | MPI only | MPI + Multi Threaded (hybrid) |
| Slurm Flag        |                                   |                         |          |                               |
| ----------------- |:---------------------------------:|:-----------------------:|:--------:|:-----------------------------:|
| `--cpus-per-task` |                                   |                      X  |          |                             X |
| `--ntasks`        |                                   |                         |        X |                             X |

As you can see:

   1. A single threaded job would use neither Slurm option, since Slurm already assumes at least a single core.
   2. A multi threaded OpenMP job would use `--cpus-per-task`.
   3. A MPI job would use `--ntasks`.
   4. A Hybrid job would use both.

For more details on how these Slurm options work please review [Slurm Multi-core/Multi-thread Support](Note: https://slurm.schedmd.com/mc_support.html).

#### MPI

MPI stands for the Message Passing Interface. MPI is a standardized API typically used for parallel and/or distributed computing.
The HPCC cluster has a custom compiled versions of MPI that allows users to run MPI jobs across multiple nodes.
These types of jobs have the ability to take advantage of hundreds of CPU cores symultaniously, thus improving compute time.

Many implementations of MPI exists, however we only support the following:

   * [Open MPI](http://www.open-mpi.org/)
   * [MPICH](http://www.mpich.org/)
   * [IMPI](https://software.intel.com/en-us/mpi-developer-guide-linux)

For general information on MPI under Slurm look [here](https://slurm.schedmd.com/mpi_guide.html).
If you need to compile an MPI application then please email support@hpcc.ucr.edu for assistance.

__NAMD Example__

To run a NAMD2 process as an OpenMPI job on the cluster:

1. Log-in to the cluster
1. Create SBATCH script

   ```bash
   #!/bin/bash -l

   #SBATCH -J c3d_cr2_md
   #SBATCH -p batch
   #SBATCH --ntasks=32
   #SBATCH --mem=16gb
   #SBATCH --time=01:00:00

   # Load needed modules
   # You could also load frequently used modules from within your ~/.bashrc
   module load slurm # Should already be loaded
   module load openmpi # Should already be loaded
   module load namd

   # Run job utilizing all requested processors
   # Please visit the namd site for usage details: http://www.ks.uiuc.edu/Research/namd/
   mpirun --mca btl ^tcp namd2 run.conf &> run_namd.log
   ```

1. Submit SBATCH script to Slurm queuing system

   ```bash
   sbatch run_namd.sh
   ```

__Maker Example__

OpenMPI does not function properly with Maker, you must use MPICH.
Our version of MPICH does not use the mpirun/mpiexec wrappers, instead use srun:

```bash
module unload openmpi
module unload perl
module load maker
srun --time=5:00:00 --mem=50gb --ntasks=2 maker # Of course you will need to define appropriate job resources here
```

