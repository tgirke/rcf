## pre {

##   max-height: 300px;

##   overflow-y: auto;

## }

## 
## pre[class] {

##   max-height: 100px;

## }


## .scroll-100 {

##   max-height: 100px;

##   overflow-y: auto;

##   background-color: inherit;

## }


## srun --x11 --partition=short --mem=2gb --cpus-per-task 4 --ntasks 1 --time 1:00:00 --pty bash -l


## wget https://raw.githubusercontent.com/ucr-hpcc/ucr-hpcc.github.io/master/_support_docs/tutorials/nvim_demo.R


## #!/bin/bash -l

## #SBATCH --nodes=1

## #SBATCH --ntasks=1

## #SBATCH --cpus-per-task=1

## #SBATCH --mem-per-cpu=1G

## #SBATCH --time=1-00:15:00 # 1 day and 15 minutes

## #SBATCH --mail-user=useremail@address.com

## #SBATCH --mail-type=ALL

## #SBATCH --job-name="some_test"

## #SBATCH -p batch # Choose queue/partition from: intel, batch, highmem, gpu, short

## 
## Rscript my_script.R}


## sbatch script_name.sh

