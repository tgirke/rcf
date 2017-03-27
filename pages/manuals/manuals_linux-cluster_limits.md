---
layout: page
title: Resources and Limits
permalink: manuals_linux-cluster_limits.html
---

## Monitoring
The easiest way to find out what your group (or associated Slurm account) is with the following:

```bash
id -gn
```

The Above command will list your primary group.

It is possible to iterate over all the jobs in squeue and add up all the CPU cores to see how many are available for your group.
This will give you the total number of cores used by your group in the batch partition:

```bash
echo $(squeue -A $GROUP -p batch -o '%C' -t Running | grep -P '^[0-9]' | tr '\n' '+' | sed 's/+$//g') | bc
```

However this does not tell you when your job will start, since it depends on the duration of each job.
The best way to do this is with the "--start" flag on the squeue command:

```bash
squeue --start -u $USER
```

Also, if you want to see your limits you can do that with the following:

```bash
sacctmgr show account $GROUP format=Account,User,Partition,GrpCPUs,GrpMem,GrpNodes --ass | grep $USER
```

And for your overall CPU limit for the group:

```bash
sacctmgr show account $GROUP format=Account,User,Partition,GrpCPUs,GrpMem,GrpNodes --ass | head -3
```

