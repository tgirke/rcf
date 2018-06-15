---
layout: page
title: Parallel Evaluations in R 
permalink: manuals_linux-cluster_parallelR.html
---

# Overview
R provides a variety of packages for parallel computations.

## batchtools package 

The batchtools HTML manual can be found [here](https://mllg.github.io/batchtools/articles/batchtools.html)

## Set up working directory for scheduler
```r
wget ...
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


