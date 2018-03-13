---
layout: page
title: HPCC AWS Cluster - HPCC cfnCluster Setup 
permalink: manuals_hpcc-aws-cluster_setup.html
---

## HPCC cfnCluster Setup.
This will show how to use your HPCC account to configure cfnCluster; allowing you to create and control your own clusters.

## 1. Login to the HPCC Cluster

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

* Cluster Template
  * Just hit enter to choose the default template
* AWS Access Key ID
  * YOUR-aws_access_key_id (found in your credentials file)
* AWS Secret Access Key ID 
  * YOUR-aws_secret_access_key (found in your credentials file)
* AWS Region ID
  * us-west-1
* Key Name
  * Choose your Key Name from the list
* VPC Name
  * Just hit enter to choose the default public
* VPC ID
  * Pick any of the avaiable options
* Master Subnet ID
  * Pick any of the avaiable options


## 4. Apply HPCC AWS Config

```bash
apply-hpcc-aws-config.py
```

## 4. Setup complete

Now that your config file is setup correctly. You can begin to create and interact with your own cluster (described in the Cluster Control and Operation section [Link](manuals_hpcc-aws-cluster_operation.html))

## Setup Walk Through

<script src="https://asciinema.org/a/RtQN15IaLyNr4t3Tj27fMxKB0.js" id="asciicast-RtQN15IaLyNr4t3Tj27fMxKB0" async data-autoplay="false" data-size="small" data-speed="3"></script>
