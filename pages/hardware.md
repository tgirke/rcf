---
layout: page
title: Hardware
---

## Storage
* Four enterprise class HPC storage systems
* Approximately 2 PB (2048 TB) of network storage
* GPFS (NFS and SAMBA via GPFS)
* Automatic snapshots and archival backups

## Network
* Ethernet
    * 1 Gb/s switch x 5
    * 1 Gb/s switch 10 Gig uplink
    * 10 Gb/s switch for campus-wide science DMZ
    * Redundant, load balanced, robust mesh topology
* Interconnect
    * 56 Gb/s InfiniBand (FDR)

## Head Nodes
All users should access the cluster via SSH through `biocluster.ucr.edu`. This address will automatically balance traffic to one of the available head nodes.

* Penguin
    * Resources: 8 cores, 64 GB memory
    * Primary function: submitting jobs to the queuing system (Torque/Maui)
    * Secondary function: development; code editing and running small (under 50 % CPU and under 30 % RAM) sample jobs
* Pigeon
    * Resources: 16 cores, 128 GB memory
    * Primary function: submitting jobs to the queuing system (Torque/Maui)
    * Secondary function: development; code editing and running small (under 50 % CPU and under 30 % RAM) sample jobs
* Pelican
    * Resources: 32 cores, 64 GB memory
    * Primary function: submitting jobs to the queuing system (Torque/Maui)
    * Secondary function: development; code editing and running small (under 50 % CPU and under 30 % RAM) sample jobs
* Owl
    * Resources: 16 cores, 64 GB memory
    * Primary function: testing; running test sets of jobs
    * Secondary function: submitting jobs to the queuing system (Torque/Maui)
* Globus
    * Resources: 32 cores, 32 GB memory
    * Primary function: submitting jobs to the queuing system (Slurm)
    * Secondary function: development; code editing and running small (under 50 % CPU and under 30 % RAM) sample jobs

## Worker Nodes
* Batch
    * c01-c48: each with 64 AMD cores and 512 GB memory
* Highmem
    * h01-h06: each with 32 Intel cores and 1024 GB memory
* GPU
    * gpu01-gpu02: each with 32 (HT) cores Intel Haswell CPUs and 2 x NVIDIA Tesla K80 GPUs (~10000 CUDA cores) and 128 GB memory
* Intel
    * i01-i12: each with 32 Intel Broadwell cores and 512 GB memory
