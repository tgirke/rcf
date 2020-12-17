---
title: "Cluster Usage"
author: Jordan Hayes
date: December 18, 2020
output: 
  ioslides_presentation:
    keep_md: yes
    widescreen: yes
    df_print: paged
    smaller: true
subtitle: "Just the Basics" 
---
<!--
- ioslides manual: 
   https://bookdown.org/yihui/rmarkdown/ioslides-presentation.html

- Compile from command-line
jupyter nbconvert Cluster_Usage.ipynb --to markdown && Rscript -e "rmarkdown::render('Cluster_Usage.md'); knitr::knit('Cluster_Usage.md', tangle=TRUE)"

- Jupyter formats
#jupyter nbextension enable splitcell/splitcell
#jupyter nbconvert HPCC_Intro.ipynb --to slides --reveal-prefix reveal.js
#jupyter nbconvert HPCC_Intro.ipynb --to slides --reveal-prefix "https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.3.0"
-->

## Summary

* Filesystem
  * Paths
  * Quotas
  * Usage

* Software
  * Module System
  * Installs
  * Management
  
* Job Scheduling
  * Node
  * Partition
  * Limits
  * Jobs
  
<hr style='clear:both;'>

## Filesystem: Paths

<img src="https://docs.google.com/drawings/d/e/2PACX-1vRjaVs9P2GF9oXUem-NNRH6gUD-VQ_N03wKYYHlJ373Qrqb9KPd_oZuFkTzHVFUawNX9ShIHW4u-u2l/pub?w=936&amp;h=380">

<hr style='clear:both;'>

## Filesystem: Paths

__Case sensitive__

All paths and commands are case sensitive, an uppercase letter is not the same as a lowercase letter.

__Path Types__

  * Absolute path - Full path from root to current working directory

  * Relative path - Partial path or non-absolute path) - Current working directory is implied
  
<hr style='clear:both;'>

## Filesystem: Paths

Absolute paths for `bigdata`:

```
/rhome/username/bigdata/
/bigdata/labname/username/
```


Relative path for `bigdata` (assume currently in `/rhome/username`):

```
bigdata/
```

<hr style='clear:both;'>

## Filesystem: Quotas

All storage has limits.

* __Local Storage__ (ie. laptop)

  Only exists on a single machine (node) and is limited by disk size.


* __Shared Storage__ (ie. Cloud)

  Exists accross all machines (nodes) and is limited by a quota.
  
<hr style='clear:both;'>

## Filesystem: Quotas

__Shared Storage__

<img src="https://docs.google.com/drawings/d/e/2PACX-1vQWU7EGfVNGIhebu953CqTx3y-jufY-0ja6zcV65LN3KWLX5hBY7R2mEavvy34Gbq9fnDQeT80jEqfT/pub?w=933&amp;h=401">

<hr style='clear:both;'>

## Filesystem: Usage

Make workshop directory, if it does not already exist:


```bash
mkdir -p ~/workshop_dir
```

Check <span style='font-weight:bold;color:black;'>directory</span> size:


```bash
du -hs ~/workshop_dir
```

Check <span style='font-weight:bold;color:#1a9988;'>local</span> node storage:


```bash
df -h /tmp
```


```bash
df -h /scratch
```

<hr style='clear:both;'>

## Filesystem: Usage

Check <span style='font-weight:bold;color:blue;'>GPFS</span> storage, _"blocks"_ is used space and available space is _"quota"_:


```bash
check_quota home
```


```bash
check_quota bigdata
```

[https://hpcc.ucr.edu/manuals_linux-cluster_storage](https://hpcc.ucr.edu/manuals_linux-cluster_storage)

<hr style='clear:both;'>

## Software: Module System

This system allows multiple versions of software to be loaded and unloaded.

To view software that is available:


```bash
module avail
```

To search for a specific software:


```bash
module avail samtools
# OR
hpcc-software samtools
```

<hr style='clear:both;'>

## Software: Module System

Load software into current environment:


```bash
module load samtools
```

List currently loaded software modules:


```bash
module list
```

Remove software from current environment:


```bash
module unload samtools
```

[https://hpcc.ucr.edu/manuals_linux-cluster_start#modules](https://hpcc.ucr.edu/manuals_linux-cluster_start#modules)


<hr style='clear:both;'>

## Software: Installs

For a basic `Python` package you can use `pip` to install it:

```bash
pip install PKGNAME --user
```

For an `R` package you can use the built-in install function or the install function from `BiocManager`:

```r
install.packages('PKGNAME')
```

```r
BiocManager::install('PKGNAME')
```

[https://hpcc.ucr.edu/manuals_linux-cluster_package-manage.html](https://hpcc.ucr.edu/manuals_linux-cluster_package-manage.html)

<hr style='clear:both;'>

## Software: Management

* <span style='font-weight:bold;color:green;'>Conda</span> - A software management system that allows you to install thousands of software packages and tools, including `R` and `Python` languages.

* <span style='font-weight:bold;color:red;'>Singularity</span> - A Linux container system (similar to Docker) which allows users to prepare a Linux environment from scratch.

A previous workshop regarding custom software installs utilizing the above technologies can be found [here](https://bit.ly/2PXGWEq).

<hr style='clear:both;'>

## Software: Management

__Conda__

Install `Python` 3 environment:


```bash
conda create -n python3 python=3
```

Install Python package with conda:


```bash
conda install -n python3 numpy
```

If package fails to be found, search on the [Anaconda Website](https://anaconda.org/). After searching click on one of the results and the command for installing will be provided. Remember to add your `-n python3` environment name.

<hr style='clear:both;'>

## Job Scheduling: Node

__What is a Compute Node?__

<img src="https://docs.google.com/drawings/d/e/2PACX-1vQuTFQYXJmcIXx4873q1TlH0-44-yf1GwZicu6t7l5UrVnww08cMxD_ubYc0mpkfZ0Gsku43TT90DY0/pub?w=941&amp;h=250">

[https://hpcc.ucr.edu/hardware](https://hpcc.ucr.edu/hardware)

<hr style='clear:both;'>

## Job Scheduling: Partition

<img style="float:right;" width='350px' src="https://docs.google.com/drawings/d/e/2PACX-1vQcl8tr-Tsi6TlUrUMREbrEk5ygkhllfoq82ZzrItDF13uqY-FmPwLpUqcpRGBTE7VajnpgDBwgox-v/pub?w=417&amp;h=551">

__What is a Partition?__

Logical groups of nodes, to allow more efficient allocation and managment of resources.

__Intel Partition__

* CPU  - 2 cores Default, 256 Cores Max
* RAM - 1GB Default, 1TB Max
* Time - 7 days Default, 30 Days Max

<div style='clear:both'><a href='https://hpcc.ucr.edu/manuals_linux-cluster_jobs.html#partitions'>https://hpcc.ucr.edu/manuals_linux-cluster_jobs.html#partitions</a></div>

<hr style='clear:both;'>

## Scheduling: Partitions


* __Default?__

  Fallback to this value if not explicitly provided.
  

* __Maximum?__

  Upper limit of what can be requested.


For more details regarding our partitions, please review our [Cluster Jobs: Partitions](https://hpcc.ucr.edu/manuals_linux-cluster_jobs#partitions) manual page.

<hr style='clear:both;'>

## Scheduling: Status

List all jobs owned by you and status:


```bash
squeue -u $USER
```

List all group jobs and status:


```bash
squeue -A $GROUP
```

<hr style='clear:both;'>

## Scheduling: Limits

List current Slurm limits:


```bash
slurm_limits
```

List CPUs currently used by you:


```bash
user_cpus
```

List CPUs currently used by entire group (primary):


```bash
group_cpus
```

<hr style='clear:both;'>

## Scheduling: Jobs

__Submission__

Move into workshop directory:


```bash
cd ~/workshop_dir
```

Download example job submission script:


```bash
wget -O basic_job.sh https://bit.ly/33rozLX
```

Check job submission script contents:


```bash
cat basic_job.sh
```

<hr style='clear:both;'>

## Scheduling: Jobs

__Submission__

Submit as non-interactive job:


```bash
sbatch basic_job.sh
```

Submit interactive job:

```bash
srun -p short --pty bash -l
```

<hr style='clear:both;'>

## Scheduling: Jobs

__Status__

Check job status:


```bash
squeue -u $USER
```

Check results:


```bash
cat slurm-2909103.out
```

[https://hpcc.ucr.edu/manuals_linux-cluster_jobs.html#submitting-jobs](https://hpcc.ucr.edu/manuals_linux-cluster_jobs.html#submitting-jobs)

<hr style='clear:both;'>
