## pre {

##   max-height: 300px;

##   overflow-y: auto;

## }

## 
## pre[class] {

##   max-height: 300px;

## }


## .scroll-300 {

##   max-height: 300px;

##   overflow-y: auto;

##   background-color: inherit;

## }


## srun --x11 --partition=short --mem=2gb --cpus-per-task 4 --ntasks 1 --time 1:00:00 --pty bash -l


## wget https://raw.githubusercontent.com/ucr-hpcc/ucr-hpcc.github.io/master/_support_docs/tutorials/nvim_demo.R


## ----nvim-r-tmux-demo_show, eval=FALSE, message=FALSE, warning=FALSE----------
## library(tidyverse)
## write_tsv(iris, "iris.txt") # Creates sample file
## read_tsv("iris.txt") %>% # Import with read_tbv from readr package
##     as_tibble() %>%
##     group_by(Species) %>%
##     summarize_all(mean) %>%
##     reshape2::melt(id.vars=c("Species"), variable.name = "Samples", value.name="Values") %>%
##     ggplot(aes(Samples, Values, fill = Species)) +
##     geom_bar(position="dodge", stat="identity")


## ----nvim-r-tmux-demo_run, echo=FALSE, eval=TRUE, message=FALSE, warning=FALSE----
library(tidyverse)                                                                                                                                                            
write_tsv(iris, "iris.txt") # Creates sample file                                                                                                                             
read_tsv("iris.txt") %>% # Import with read_tbv from readr package                                                                                                            
    as_tibble() %>%                                                                                                                                                           
    group_by(Species) %>%                                                                                                                                                     
    summarize_all(mean) %>%                                                                                                                                                   
    reshape2::melt(id.vars=c("Species"), variable.name = "Samples", value.name="Values") %>%                                                                                  
    ggplot(aes(Samples, Values, fill = Species)) +                                                                                                                            
    geom_bar(position="dodge", stat="identity")


## module avail R


## module load R/4.0.1


## module list


## #!/bin/bash -l

## #SBATCH --nodes=1

## #SBATCH --ntasks=1

## #SBATCH --cpus-per-task=1

## #SBATCH --mem-per-cpu=1G

## #SBATCH --time=1-00:15:00 # 1 day and 15 minutes

## #SBATCH --mail-user=useremail@address.com

## #SBATCH --mail-type=ALL

## #SBATCH --job-name="some_test"

## #SBATCH -p short # Choose queue/partition from: intel, batch, highmem, gpu, short

## 
## Rscript my_script.R


## sbatch script_name.sh

