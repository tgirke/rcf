---
layout: page
title: Linux Cluster - Queue Policies
permalink: manuals_linux-cluster_queue.html
---

## Start Times
Start times are a great way to track your jobs:
```bash
squeue -u $USER --start
```
Start times are rough estimates based on the current state of the queue.

## Fair-Share
Users that have not submitted any jobs in a long time usually have a higher priority over others that have ran jobs recently.
Thus the estimated start times can be extended to allow everyone their fair share of the system.
This prevents a few large groups from dominating the queuing system for long periods of time.

You can see with the `sqmore` command what priority your job has (list is sorted from lowest to highest priority).
You can also check to see how your group's priority is compared to other groups on the cluster with the "sshare" command.
For example:

```bash
sshare -A $GROUP -u $USER
             Account       User  RawShares  NormShares    RawUsage  EffectvUsage  FairShare 
-------------------- ---------- ---------- ----------- ----------- ------------- ---------- 
operations                               1    0.005587         101      0.000000   0.999987 
 operations              jhayes          1    0.000169           0      0.000000   0.999987 
 operations              jhayes          1    0.000169           3      0.000000   0.999974 
 operations              jhayes          1    0.000169           0      0.000000   0.999987 
 operations              jhayes          1    0.000169           0      0.000000   0.999987 
 operations              jhayes          1    0.000169           0      0.000000   0.999985 
 operations              jhayes          1    0.000169           4      0.000000   0.999968 
 operations              jhayes          1    0.000169           0      0.000000   0.999987
 ```
The FairShare score is a number between 0 and 1. The best score being 1, and the worst being 0.
The fairshare score approches zero the more resource you consume.
Your individual consumption of resources (usage) does affect your entire group's fiarshare score.

## Priority
The fairshare score is used to calculate your jobs priority, as well as the jobs queue wait time.
You can use the sprio command to check the priority of your jobs:
```
sprio -u $USER
```

## Backfill
Even if your group has a lower fairshare score, your job may still has a very high priority (the highest in the list of queued jobs).
This is likely due to the jobs queue wait time, and it should start as soon as possible.
Some small jobs may start before yours, only if they can complete before yours starts and thus not negatively affecting your start time.
