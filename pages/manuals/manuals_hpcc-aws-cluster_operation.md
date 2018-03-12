---
layout: page
title: HPCC AWS Cluster - Cluster Operation
permalink: manuals_hpcc-aws-cluster_operation.html
---

## Login to HPCC

```bash
ssh username@biocluster.ucr.edu
```

## Load cfnCluster

```bash
module unload python/2.7.5
module load cfncluster
```

## Create a Cluster

```bash
cfncluster create <NameForYourCluster>
```

## Show running Clusters

```bash
cfncluster list
```

## Delete cluster

```bash
cfncluster delete <NameForYourCluster>
```

## Connecting to your cluster

Note - /path/to/your/key-file.pem = where you saved your AWS account key file

```bash
ssh -i /path/to/your/key-file.pem ec2-user@<MasterPublicIP>
```

## Uploading data to your cluster

This will transfer the local files to your home directory on the cluster.

```bash
scp -i /path/to/your/key-file.pem <local-files-to-copy> ec2-user@<MasterPublicIP>:.
```

## Downloading data/results

This would be called from the HPCC cluster and it will download the specified remote files to your current directory.

```bash
scp -i /path/to/your/key-file.pem ec2-user@<MasterPublicIP>:./<files-to-download> .
```

## Running a job on your cluster

This will show all the steps needed to create a cluster and run a simple batch job

### 1. Start a new cluster

```bash
cfncluster create new-cluster
```

### 2. Get the IP address of the new cluster

Once the cluster build is complete you will be presented with the status informatiom.
Note the "MasterPublicIP" Address from the output.
Use this IP Address when connecting to the cluster via "ssh" or uploading and downloading via "scp".

Output:

```bash
cfncluster create new-cluster
Beginning cluster creation for cluster: new-cluster
Creating stack named: cfncluster-new-cluster
Status: cfncluster-new-cluster - CREATE_COMPLETE                                
Output:"MasterPublicIP"="52.52.227.148"
Output:"MasterPrivateIP"="172.31.24.51"
Output:"GangliaPublicURL"="http://52.52.227.148/ganglia/"
Output:"GangliaPrivateURL"="http://172.31.24.51/ganglia/"
```
Find the "MasterPublicIP"

### 3. Upload your input files and slurm submission script

This will transfer the local files to your home directory on the cluster.

```bash
scp -i /path/to/your/key-file.pem <local-files-to-copy> ec2-user@<MasterPublicIP>:.
```

### 4. SSH to your new cluster

```bash
ssh -i /path/to/your/key-file.pem ec2-user@<MasterPublicIP>
```

### 5. Submit your job to the cluster

```bash
sbatch slurm-submission-script.sh
```

### 6. Monitor your job

```bash
squeue
```

### 7. Download results

This command would be called from the HPCC cluster and it will download the specified remote files to your current directory.

```bash
scp -i /path/to/your/key-file.pem ec2-user@<MasterPublicIP>:./<results-to-download> .
```

### 8. Delete cluster

```bash
cfncluster delete new-cluster 
```

## Start sample cluster walk through (sped up)

<script src="https://asciinema.org/a/uH2CH6RhWc7JHOBSl4yqra5n8.js" id="asciicast-uH2CH6RhWc7JHOBSl4yqra5n8" async data-speed="20" data-size="medium"></script>
