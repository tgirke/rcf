---
layout: page
title: Access and rate structure
permalink: rates.html
summary: The following summarizes HPCC's rate structure for UCR users. Rates for external users are slightly higher. For more details consult the Recharging Rate document. 


---

Note: HPCC's latest Recharging Rates document is [here](http://hpcc.ucr.edu/docs.html). 

## User account requests

* Email user account request to [support@biocluster.ucr.edu](mailto:support@biocluster.ucr.edu). Please include email address and full name of both user and PI.
* An FAU for the annual registration fee (see below) is required if a PI's lab is not registered yet.

## Lab-based Registration Fee

An annual registration fee of $1,000 gives all members of a UCR lab access to our high-performance computing infrastructure.
The registration provides access to the following resources: 

  * Over 4.500 CPU cores (40% Intel and 60% AMD), ~60,000 cuda cores (Nvidia K80 GPU), ~2PB parallel GPFS-based disk space, 512GB-1TB of memory/node, etc. More details are available on the hardware page.
  * Over 1000 software packages and community databases. Details are available on the software page.
  * Free attendance of workshops offered by HPCC staff
  * Free consultation services (up to 1 hour per month)
  * Note: there is no extra charge for CPU usage but each user and lab have CPU quotas of 256 and 512 CPU cores, respectively. Computing jobs exceeding these quotas can be submitted but will stay in a queued state until resources within the quota limits become available. 

## Big data storage

* Standard user accounts have a storage quota of 20 GB. To gain access to much larger storage pools, PIs have the option to rent or own storage space.
* Storage rental option
    
    * $1000 per 10TB of usable and backed up storage space. Storage pool is shared among all user accounts of a registered lab.
 
## Ownership models

* Disk storage
        
    * Lab purchases storage hardware (_e.g._ hard drives) according to the specifications of the facility. Owned hard drives will be added to the facility's parallel GPFS storage system. The annual support fee for owned disk storage is $250 per 10TB of usable and backed-up storage space. The owned storage space is only available to the users of a PI or those a PI wishes to give access to.
    * Owned storage can be attractive for labs with storage needs above 40 TBs.

* Compute nodes
        
    * Lab purchases computer nodes according to the specifications of the facility. An example of a popular high-density architecture is [this one](http://www.thinkmate.com/system/hdx-xt24-5260v4-sas3) with 4 nodes each with two 16 core Intel chips (total physical core count 128), each node with 512GB of RAM, 1.2TB SSD and FDR-IB interconnect, discounted price ~$36,000. 
    * Nodes are administered under a priority queueing system that gives users from owner lab priority and also increases that labs overall CPU quota (see above) by the number of owned CPU cores.
    * Owned computer nodes are an attractive solution for labs requiring 24/7 access to hundreds of CPU cores with no or only minor waiting times in queue.

## Software install

* Registered users can email software install requests to HPCC's issue tracking system @ [support@biocluster.ucr.edu](mailto:support@biocluster.ucr.edu). Install requests are addressed in the order received. Simple installs are addressed within 1 to a few days. Complex installs may take longer.

## Startup packages for new PIs

Standard startup packages in the amount of $30K (N=1), $45K (N=2), $60K (N=3) and so on are available. Note: N refers to the number of HPC nodes below. The cost for these packages can be covered by the initial complement of new PIs. 

* N HPC node(s): owned by lab for 5 yrs and administered under priority queueing model. After this time the node becomes part of the shared HPCC cluster resources. 

    * Each node with 32* Intel CPU cores (64* logical cores), 512GB RAM and Infiniband interconnect. *the core numbers might nearly double when newer and less expensive Intel chip sets will be released this year.
    * Alternative node architecture (_e.g._ GPU) are available upon request

* HPCC subscription fee of $1000/yr covered for 5 yrs
* Big data storage of 10TB ($1000/yr) covered for 5 yrs; other buy-in options exist to support much larger data storage needs

Custom startup packages may be supported upon approval by HPCC.

## Department cluster membership with owned computing nodes

This option addresses the need of department-level HPC access where the standard 
PI-based membership is not practical, _e.g._ provide cluster access to large number of undergraduate
students in classes. Under this model a department purchases computer nodes
that will be administered similarly as described above under the _Ownership
model_. Due to the large number of expected users from departments, the
CPU quota per user is lower compared to the PI-based model.

## Facility description

   * The latest hardware/facility description (_e.g._ for grant applications) is available [here](https://goo.gl/43eOwQ).



