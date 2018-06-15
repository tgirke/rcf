#################################################
## Test code for batchtools with SLURM cluster ##
#################################################
## Author: Thomas Girke
## Date: 15-Jun-18

## Set up working directory for SLURM
dir.create("mytestdir")
setwd("mytestdir")
system("wget https://raw.githubusercontent.com/ucr-hpcc/ucr-hpcc.github.io/master/_support_docs/tutorials/.batchtools.conf.R")
system("wget https://raw.githubusercontent.com/ucr-hpcc/ucr-hpcc.github.io/master/_support_docs/tutorials/slurm.tmpl")

## Load package and define some custom function

library(batchtools)
myFct <- function(x) {
	cbind(iris[x, 1:4,], node=system("hostname", intern=TRUE))
}

## Submit jobs from R to cluster
reg <- makeRegistry(file.dir="myregdir", conf.file=".batchtools.conf.R")
Njobs <- 1:4 # Define number of jobs (here 4)
ids <- batchMap(fun=myFct, x=Njobs) 
done <- submitJobs(ids, reg=reg, resources=list(partition="short", walltime=60, ntasks=1, ncpus=1, memory=1024))
waitForJobs() # Wait until jobs are completed

## Summarize job status 
getStatus() # Summarize job status
showLog(Njobs[1])
# killJobs(Njobs)

## Access/assemble results
readRDS("myregdir/results/1.rds") # reads from rds file first result chunk
loadResult(1) 
lapply(Njobs, loadResult)
reduceResults(rbind) # Assemble result chunks in single data.frame
do.call("rbind", lapply(Njobs, loadResult))

## Remove registry directory from file system
clearRegistry() # Clear registry in R session
removeRegistry(wait=0, reg=reg) # Delete registry directory
# unlink("myregdir", recursive=TRUE) # Same as previous line

## Load registry into R 
from_file <- loadRegistry("myregdir", conf.file=".batchtools.conf.R")
reduceResults(rbind)


