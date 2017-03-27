---
layout: page
title: Communicating
permalink: manuals_linux-cluster_users.html
---

## Communicating with others

The cluster is a shared resource, and communicating with other users can help to schedule large computations.

__Looking-Up Specific Users__

A convenient overview of all users and their lab affiliations can be retrieved with the following command:

```bash
user_details.sh
```

You can search for specific users by running:

```bash
MATCH1='tgirke' # Searches by real name, and username, and email address and PI name
MATCH2='jhayes'
user_details.sh | grep -P "$MATCH1|$MATCH2"
```

__Listing Users with Active Jobs on the Cluster__
To get a list of usernames:

```bash
qstat | awk '{print $3}' | sort | uniq | grep "^[^-N]"
```

To get the list of real names:

```bash
grep <(user_details.sh | awk '{print $2,$3,$4}') -f <(qstat | awk '{print $3}' | sort | uniq | grep "^[^-N]") | awk '{print $1,$2}'
```

To get the list of emails:

```bash
grep <(user_details.sh | awk '{print $4,$5}') -f <(qstat | awk '{print $3}' | sort | uniq | grep "^[^-N]") | awk '{print $2}'
```

