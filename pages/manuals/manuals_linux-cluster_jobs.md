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
    * RAM: 16 GB min and 1024 GB max
    * Time (walltime): 48 hours (2 days) default
* gpu
    * Nodes: gpu01-gpu02
    * Cores: Intel, 16 per user
    * RAM: 128 GB default
    * Time (walltime): 100 hours  default
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
sbatch --qos=gpu -p gpu SBATCH_SCRIPT.sh
sbatch -p intel SBATCH_SCRIPT.sh
sbatch -p mygroup SBATCH_SCRIPT.sh
```

## Slurm
Slurm is now our default queuing system across all head nodes. [SSH directly into the cluster](#getting-started) and your connection will be automatically load balanced to a head node:

```bash
ssh -XY biocluster.ucr.edu
```

## Resources and Limits
To see your limits you can do the following:

```bash
sacctmgr show account $GROUP format=Account,User,Partition,GrpCPUs,GrpMem,GrpNodes --ass | grep $USER
```

In order to view your group limits, execute the following:

```bash
sacctmgr show account $GROUP format=Account,User,Partition,GrpCPUs,GrpMem,GrpNodes,GrpTRES%30 --ass | head -3
```

Check total number of cores used by your group in the all partitions:

```bash
echo $(squeue -A $GROUP -o '%C' -t Running | grep -P '^[0-9]' | tr '\n' '+' | sed 's/+$//g') | bc
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
squeue -u username
```

To list all the details of a specific job, run the following:

```bash
scontrol show job <JOBID>
```

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

### GPU Jobs
A single GPU job will no longer reserve an entire node. For each node there are 4-8 GPUs. This means that you need to request how many GPUs that you would like to use.
Non-Interactive:

```bash
srun --qos=gpu -p gpu --gres=gpu:1 --mem=100g --time=1:00:00 SBATCH_SCRIPT.sh
```

Interactive

```bash
srun --qos=gpu -p gpu --gres=gpu:4 --mem=100g --time=1:00:00 --pty bash -l
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
[Slurm Examples](http://biocluster.ucr.edu/~jhayes/slurm/examples/)

## Parallelization Software

### MPI Introduction

MPI stands for the Message Passing Interface. MPI is a standardized API typically used for parallel and/or distributed computing.
Biocluster has a custom compiled version of OpenMPI that allows users to run MPI jobs across multiple nodes.
These types of jobs have the ability to take advantage of hundreds of CPU cores symultaniously, thus improving compute time.

Many implementations of MPI exists, however we only support the following:
* [Open MPI](http://www.open-mpi.org/)
* [MPICH](http://www.mpich.org/)

If you need to compile an MPI application then please email support@biocluster.ucr.edu for assistance.

### NAMD Example

To run a NAMD2 process as an OpenMPI job on Biocluster:

1. Log-in to the cluster
1. Create SBATCH script

   ```bash
   #!/bin/bash -l

   #SBATCH -J c3d_cr2_md
   #SBATCH -p batch
   #SBATCH -n 32
   #SBATCH --mem=16gb
   #SBATCH --time=01:00:00

   # Load needed modules
   # You could also load frequently used modules from within your ~/.bashrc
   module load slurm # Should already be loaded
   module load openmpi # Should already be loaded
   module load namd

   # Run job utilizing all requested processors
   # Please visit the namd site for usage details: http://www.ks.uiuc.edu/Research/namd/
   mpirun --mca btl ^tcp namd2 run.conf &> run_bio.log
   ```

1. Submit SBATCH script to Slurm queuing system

   ```bash
   sbatch run_bio.sh
   ```

