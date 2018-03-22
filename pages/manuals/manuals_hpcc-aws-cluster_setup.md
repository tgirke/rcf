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


## 2. Run hpcc_cloud configure

```bash
hpcc_cloud configure
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
  * Choose any of the avaiable options
* Master Subnet ID
  * Choose any of the avaiable options
* IAM User Name 
  * Choose your IAM User Name from the list


## 3. Setup complete

Now that your config file is setup correctly. You can begin to create and interact with your own cluster (described in the Cluster Control and Operation section [Link](manuals_hpcc-aws-cluster_operation.html))

## Setup Walk Through

<script src="https://asciinema.org/a/ZeBM6yqO8cD0dhw7LwauXj943.js" id="asciicast-ZeBM6yqO8cD0dhw7LwauXj943" async data-autoplay="false" data-size="small" data-speed="3"></script>
