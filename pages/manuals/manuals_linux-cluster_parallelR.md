---
layout: page
title: Parallel Evaluations in R 
permalink: manuals_linux-cluster_parallelR.html
---

# Overview
R provides a variety of packages for parallel computations. One of the most
comprehensive parallel computing environments for R is [`batchtools`](https://mllg.github.io/batchtools/articles/batchtools.html) 
(formerly `BatchJobs`). It supports both multi-core and multi-node computations with and
without schedulers. By making use of cluster template files, most schedulers
and queueing systems are also supported (e.g. Torque, Sun Grid Engine, Slurm). 

## Parallelization with batchtools 

The following introduces the usage of `batchtools` for a computer cluster using SLURM as scheduler (workload manager).

## Set up working directory for SLURM
First login to your cluster account, open R and execute the following lines. This will
create a test directory (here `mytestdir`), redirect R into this directory and then download
the required files: 

+ [`slurm.tmpl`](https://github.com/ucr-hpcc/ucr-hpcc.github.io/blob/master/_support_docs/tutorials/slurm.tmpl)
+ [`.batchtools.conf.R`](https://github.com/ucr-hpcc/ucr-hpcc.github.io/blob/master/_support_docs/tutorials/.batchtools.conf.R)

```r
dir.create("mytestdir")
setwd("mytestdir")
system("wget https://raw.githubusercontent.com/ucr-hpcc/ucr-hpcc.github.io/master/_support_docs/tutorials/.batchtools.conf.R")
system("wget https://raw.githubusercontent.com/ucr-hpcc/ucr-hpcc.github.io/master/_support_docs/tutorials/slurm.tmpl")
```

## Load package and define some custom function
```r
library(batchtools)
myFct <- function(x) {
	cbind(iris[x, 1:4,], node=system("hostname", intern=TRUE))
}
```

## Create registry, split jobs, define resource requests and submit jobs to SLURM
```r
reg <- makeRegistry(file.dir="myregdir", conf.file=".batchtools.conf.R")
Njobs <- 1:4 # Define number of jobs
ids <- batchMap(fun=myFct, x=Njobs) 
done <- submitJobs(ids, reg=reg, resources=list(partition="short", walltime=60, ntasks=1, ncpus=1, memory=1024))
waitForJobs() # Wait until jobs are completed
```

## Summarize job status 
```r
getStatus() # Summarize job status
showLog(Njobs[1])
# killJobs(Njobs)
```

## Access/assemble results
```r
readRDS("myregdir/results/1.rds") # reads from rds file first result chunk
loadResult(1) 
lapply(Njobs, loadResult)
reduceResults(rbind) # Assemble result chunks in single data.frame
do.call("rbind", lapply(Njobs, loadResult))
```

## Remove registry directory from file system
```r
clearRegistry() # Clear registry in R session
removeRegistry(wait=0, reg=reg) # Delete registry directory
# unlink("myregdir", recursive=TRUE) # Same as previous line
```

## Load registry into R to continue where you left off
```r
from_file <- loadRegistry("test", conf.file=".batchtools.conf.R")
reduceResults(rbind)
```


