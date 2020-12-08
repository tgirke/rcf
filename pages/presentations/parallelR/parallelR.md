---
title: "R on HPC Systems"
author: Jordan Hayes and Thomas Girke
date: December 22, 2020
output: 
  ioslides_presentation:
    keep_md: yes
    logo: ./images/ucr_logo.png
    widescreen: yes
    df_print: paged
    smaller: true
subtitle: "Tutorial for R Users" 
bibliography: bibtex.bib
---

<!---
- ioslides manual: 
   https://bookdown.org/yihui/rmarkdown/ioslides-presentation.html

- Compile from command-line
Rscript -e "rmarkdown::render('parallelR.Rmd'); knitr::knit('parallelR.Rmd', tangle=TRUE)"
-->

<!---
  Note: following css chunks are required for scrolling support beyond slide boundaries
-->

<link rel="shortcut icon" href="{./images/favicon.ico}" />

<style>
slides > slide {
  overflow-x: auto !important;
  overflow-y: auto !important;
}
</style>

<style type="text/css">
pre {
  max-height: 300px;
  overflow-y: auto;
}

pre[class] {
  max-height: 100px;
}
</style>

<style type="text/css">
.scroll-100 {
  max-height: 100px;
  overflow-y: auto;
  background-color: inherit;
}
</style>


# Outline

- <div class="white">__Neovim-based IDE for R__</div>
- Parallel R with `batchtools`

## R on Cluster of HPCC 

- Knowledge of command-line interface is essential for working on a computer cluster efficiently 
- Advantage: language agnostic approach that works with most computer languages. GUI applications like RStudio are limited to R. 
- This tutorial introduces the Nvim-R-Tmux environment
- Users of Emacs may want to consider using ESS instead. 
- Alternative for beginners: RStudio Server instance on HPCC/biocluster
    - The URL is: [https://rstudio.hpcc.ucr.edu](https://rstudio.hpcc.ucr.edu)
    - Username and password: same as for HPCC

## Nim-R-Tmux: Terminal-based R Environment

__Animated Screenshot of Nvim-R (from [here](https://github.com/jalvesaq/Nvim-R)):__

<center><img title="Nvim-R-Tmux" src="https://raw.githubusercontent.com/jalvesaq/Nvim-R/master/Nvim-R.gif" ></center> 

## Introduction to Nvim-R-Tmux

- Continue on Nvim-R-Tmux tutorial [here](http://hpcc.ucr.edu/manuals_linux-cluster_terminalIDE.html)
- After ssh into cluster headnode, log in to one of the nodes


```bash
srun --x11 --partition=short --mem=2gb --cpus-per-task 4 --ntasks 1 --time 1:00:00 --pty bash -l
```

Upload demo file to HPCC/biocluster:


```bash
wget https://raw.githubusercontent.com/ucr-hpcc/ucr-hpcc.github.io/master/_support_docs/tutorials/nvim_demo.R
```

# Outline

- Neovim-based IDE for R
- <div class="white">__Parallel R with `batchtools`__</div>

## Parallel R

- R provides a large number of packages for parallel evaluations on multi-core systems as well as computer clusters
- For a package overview see [here](https://cran.r-project.org/web/views/HighPerformanceComputing.html)
- One of the most comprehensive parallel computing environments for R is
  [batchtools](https://mllg.github.io/batchtools/articles/batchtools.html#migration) (formerly BatchJobs). It supports both multi-core and multi-node
  computations with and without schedulers. By making use of cluster template
  files, most schedulers and queueing systems are supported (e.g. Torque, Sun
  Grid Engine, Slurm). 

## Traditional Job Submission for R

1. Create Slurm submission script, here called `sscript_name.sh` with:



```bash
#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1G
#SBATCH --time=1-00:15:00 # 1 day and 15 minutes
#SBATCH --mail-user=useremail@address.com
#SBATCH --mail-type=ALL
#SBATCH --job-name="some_test"
#SBATCH -p batch # Choose queue/partition from: intel, batch, highmem, gpu, short

Rscript my_script.R}
```

2. Submit script with:


```bash
sbatch script_name.sh
```

## Parallel Evaluations on Clusters with `batchtools` {.flexbox .vcenter .center}

Continue on `batchtools` tutorial [here](https://hpcc.ucr.edu/manuals_linux-cluster_parallelR.html)


## References {.smaller}

