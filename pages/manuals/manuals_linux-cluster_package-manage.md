---
layout: page
title: Package Management
permalink: manuals_linux-cluster_package-manage.html
---

## Python
The scope of this manual is a brief introduction on how to manage Python packages.

### Python Versions
Different Python versions do not play nice with each other. It is best to only load one Python module at any given time.
For more information regarding our module system please refer to [Environment Modules](manuals_linux-cluster_start.html#modules).
The miniconda2 module for Python is the new default version. This will enable users to leverage the conda installer.
The older version of Python (python/2.7.5 ) is still available, however you must explicitly load this version if you wish to use it.

### Old Python
To revert back to the older 2.7.5 version of python, do the following:

```bash
module unload miniconda2
module load python/2.7.5
```

### New Python
To load the pre-installed Python packages, do the following:

```bash
conda activate hpcc-base #This may take a few seconds
```

### Virtual Environments
It is best to create your own environment in which you have full control over package installs.
Installing many packages can consume a large (ie. >20GB) amount of disk space, thus it is recommended to store conda environments under your bigdata space.
If you have bigdata, create the `.condarc` file (otherwise conda environments will be created under your home directory).

 Create the file `.condarc` in your home, with the following content:
```bash
channels:
  - defaults
pkgs_dirs:
  - ~/bigdata/.conda/pkgs
envs_dirs:
  - ~/bigdata/.conda/envs
```

Then create your Python 2 conda environment, like so:

```bash
conda create -n NameForNewEnv python=2.7.14 # Many Python versions are available
```

For Python 3, please use the miniconda3, like so:

```bash
module unload miniconda2
module load miniconda3
conda create -n NameForNewEnv python=3.6.4 # Many Python versions are available
```

#### Activating
Once your virtual environment has been created, you need to activate it before you can use it, like so:

```bash
conda activate NameForNewEnv
```

#### Deactivating
In order to exit from your virtual environment, do the following:

```bash
conda deactivate
```

#### Installing packages
Here is a simple example for installing packages under your Python virtual environment via conda:

```bash
conda install -n NameForNewEnv PackageName
```

You may need to enable an additional channel to install the package (refer to your package's documentation):

```bash
conda install -n NameForNewEnv -c ChannelName PackageName
```

#### Cloning
It is possible for you to copy an existing environment into a new environment:

```bash
conda create --name AnotherNameForNewEnv --clone NameForNewEnv
```

#### Listing Environments
Run the following to get a list of currently installed conda evironments:

```bash
conda env list
```

#### Removing
If you wish to remove a conda environment run the following:

```bash
conda env remove --name myenv
```

### Jupyter
We also have a service for interactive Python development, [Jupyter-Hub](https://jupyter.hpcc.ucr.edu).
In order to enable your environemnt within Jupyter you will need to do the following:

```bash
# Create a virtual environment, if you don't already have one
conda create -n ipykernel_py2 python=2 ipykernel

# Load the new environment
conda activate ipykernel_py2

# Install kernel
python -m ipykernel install --user --name myenv --display-name "JupyterPy2"
```

Now when you visit [Jupyter-Hub](https://jupyter.hpcc.ucr.edu) you should see the option "JupyterPy2" when you click the "New" dropdown menu in the upper left corner of the home page.

Multiple versions of Python and R are supported.
For instructions on how to configure your R environment please visit [IRkernel](https://github.com/IRkernel/IRkernel).
Since we should already have IRkernel install in the latest version of R, you would only need to do the following within R:

```R
IRkernel::installspec(name = 'ir44', displayname = 'R 3.5.0')
```

### R
This section is a automatically on how to manage R packages

#### Current R Version
Currently the default version of R is 3.5.0 and loaded automaticly for you.
This can be seen by running:

```bash
module list
```

#### Older R Versions
You can load older versions of R with the following:

```bash
module unload R
module load R/3.4.2
```

#### Installing R Packages
The default version of R has many of the most popular R packages available all ready installed.
It is also possible for you to install additional R packages in your local environments. 

##### Bioconductor Packages

```R
source("https://bioconductor.org/biocLite.R")
biocLite("package-to-install")
Update all/some/none? [a/s/n]: n
```

##### GitHub Packages

```R
library(devtools)
install_github("duncantl/RGoogleDocs") # replace name with the GitHub account/repo
```

##### Local Packages

```R
install.packages("http://hartleys.github.io/QoRTs/QoRTs_LATEST.tar.gz",repos=NULL,type="source") # replace URL with your URL or local path to your .tar.gz file
```

### More Info
For more information regarding conda please visit [Conda Docs](https://conda.io/docs/user-guide/).

