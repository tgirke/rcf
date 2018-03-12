---
layout: page
title: HPCC AWS Cluster - HPCC cfnCluster Setup 
permalink: manuals_hpcc-aws-cluster_setup.html
---

## HPCC cfnCluster Setup.
This will show how to use your HPCC account to configure cfnCluster; allowing you to create and control your own clusters.

## 1. Login to the HPCC Cluster
The initial login brings users into the cluster head node (i.e. pigeon, penguin, owl). From there, users can submit jobs via qsub to the compute nodes or log into owl to
Since all machines are mounting a centralized file system, users will always see the same home directory on all systems. Therefore, there is no need to copy files from on

### From Mac, Linux, MobaXTerm

Open the terminal and type

```bash
ssh -X username@biocluster.ucr.edu
```

### From Windows
Please refer to the login instructions of our [Linux Basics manual](manuals_linux-basics_intro.html#windows).


## 2. Load cfncluster tools

```bash
module unload python/2.7.5
module load cfncluster
```

## 3. Run cfncluster configure

```bash
cfncluster configure
```

### Provide credentials
The configure script will ask for the following information which can be found in the credentials file you were given.

* aws_region_name = us-west-1
* aws_access_key_id
* aws_secret_access_key

Choose the default answers for the rest of the questions.

## 4. Edit config file
The configure script created a file in your home directory:

```bash
/rhome/<username>/.cfncluster/config
```

### Open your config file for editing

```bash
nano /rhome/<username>/.cfncluster/config
or
vim /rhome/<username>/.cfncluster/config
```

```bash
[aws]
aws_region_name = us-west-1
aws_access_key_id = XXXXXXXXXXXXXXXXXXXX
aws_secret_access_key = XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 

[cluster default]
vpc_settings = public
key_name = HPC2

[vpc public]
master_subnet_id = subnet-ab401df3
vpc_id = vpc-243b5540

[global]
update_check = true
sanity_check = true
cluster_template = default
```

### Remove your "cluster default" section and add some code to your config file.

Copy and paste the following into your config file.
Be sure to replace <YOUR KEY NAME> with the name of the key file us were given.

```bash
[cluster default]
vpc_settings = public
key_name = <YOUR KEY NAME>
compute_instance_type = c5.2xlarge
master_instance_type = c5.large
master_root_volume_size = 70
scheduler = slurm
initial_queue_size = 1
max_queue_size = 3
maintain_initial_size = true
post_install = http://biocluster.ucr.edu/~jhayes/aws/hpcc-bootstrap.sh
shared_dir = /hpcc
ebs_settings = hpcc


[ebs hpcc]
volume_size = 100
ebs_snapshot_id = snap-065792c207c5a93e0
volume_type = gp2

```

Final result

```bash
[aws]
aws_region_name = us-west-1
aws_access_key_id = XXXXXXXXXXXXXXXXXXXX
aws_secret_access_key = XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

[cluster default]
vpc_settings = public
key_name = <YOUR KEY NAME>
compute_instance_type = c5.2xlarge
master_instance_type = c5.large
master_root_volume_size = 70
scheduler = slurm
initial_queue_size = 1
max_queue_size = 3
maintain_initial_size = true
post_install = http://biocluster.ucr.edu/~jhayes/aws/hpcc-bootstrap.sh
shared_dir = /hpcc
ebs_settings = hpcc

[ebs hpcc]
volume_size = 100
ebs_snapshot_id = snap-065792c207c5a93e0
volume_type = gp2

[vpc public]
master_subnet_id = subnet-ab401df3
vpc_id = vpc-243b5540

[global]
update_check = true
sanity_check = true
cluster_template = default
```

### Save your config file changes
* Using nano - the command to close and save is:

```bash
CTRL-X
then
Y (to save the modified buffer)
```

* Using vim - the command to close and save is:

```bash
:wq
or
:x
```


## 4. Setup complete

Now that your config file is setup correctly. You can begin to create and interact with your own cluster (described in the Cluster Control and Operation section [Link](manuals_hpcc-aws-cluster_operation.html))

## Setup Walk Through

<script src="https://asciinema.org/a/Uh9030qKVHhSRICO42KsmzZz6.js" id="asciicast-Uh9030qKVHhSRICO42KsmzZz6" async data-autoplay="false" data-size="small" data-speed="3"></script>
