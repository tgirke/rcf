---
layout: page
title: Linux Basics - Process Management
permalink: manuals_linux-basics_processes.html
---

## Process Management

```bash
top               # view top consumers of memory and CPU (press 1 to see per-CPU statistics)
who               # Shows who is logged into system
w                 # Shows which users are logged into system and what they are doing

ps                        # Shows processes running by user
ps -e                     # Shows all processes on system; try also '-a' and '-x' arguments
ps aux | grep <user_name> # Shows all processes of one user
ps ax --tree              # Shows the child-parent hierarchy of all processes
ps -o %t -p <pid>         # Shows how long a particular process was running.
                          # (E.g. 6-04:30:50 means 6 days 4 hours ...)

Ctrl z <enter>       # Suspend (put to sleep) a process
fg                   # Resume (wake up) a suspended process and brings it into foreground
bg                   # Resume (wake up) a suspended process but keeps it running
                     # in the background.

Ctrl c               # Kills the process that is currently running in the foreground
kill <process-ID>    # Kills a specific process
kill -9 <process-ID> # NOTICE: "kill -9" is a very violent approach.
                     # It does not give the process any time to perform cleanup procedures.
kill -l                      # List all of the signals that can be sent to a proccess
kill -s SIGSTOP <process-ID> # Suspend (put to sleep) a specific process
kill -s SIGCONT <process-ID> # Resume (wake up) a specific process

nice -n <nice_value> <cmd> # Run a program with lower priority. Be nice to other headnode users.
                           # Higher "nice" values mean lower priority. Range 0-20
renice -n <priority_value> <process-ID> # Changes the priority of an existing process.
```

### More on Terminating Processes

[DigitalOcean - How To Use ps, kill, and nice to Manage Processes in Linux](https://www.digitalocean.com/community/tutorials/how-to-use-ps-kill-and-nice-to-manage-processes-in-linux)
