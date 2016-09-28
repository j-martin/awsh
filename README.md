awsh
----

Another SSH utility for AWS

Installation
------------

    $ pip install awsh

If you never configured awscli before.

    $ aws configure

Alternatively it can be downloaded on [pypi](https://pypi.python.org/pypi/awsh).

Requirements
------------

- Python 2 or 3

What does it do?
----------------

It gives you a list of hosts you have access to and preconfigure `ssh` with the
proper key and user (assuming they have not been overridden by a configuration
management tool). You can filter by instance name and if it matches only one
instance it will log to it.

Use Cases
---------

- You are running Elasticbeanstalk, EMR or something that creates it's own
  instance automatically.
- You are using different key-set for different instances and you can't remember
  which one does what.
- Instances are coming and going and you lost track of what is available.

Usage
-----

```
usage: __init__.py [-h] [--users USERS [USERS ...]] [--region REGION]
                   [-i KEY_PATH] [-c COMMAND] [-r REMOTE_HOST]
                   [-p REMOTE_PORT] [-l LOCAL_PORT] [--keys KEYS]
                   [--timeout TIMEOUT] [--console-output] [--version]
                   [filter]

SSH into AWS instances. The default user list assumes that your instances runs
on Ubuntu and or Amazon's AMIs. ex: "awsh --users user1 user2 --region us-
west-2 --keys '~/.keys' instance-name". Note that "awsh --users user1 user2
instance-name" will not be parsed properly due to the nature of nargs. In that
case you may want to do: "awsh instance-name --users user1 user2".

positional arguments:
  filter                Optional name filter. If only one instance is found,
                        it will connect to it directly.

optional arguments:
  -h, --help            show this help message and exit
  --users USERS [USERS ...]
                        Specify the users to try.
  --region REGION       Specify the aws region.
  -i KEY_PATH, --key-path KEY_PATH
                        Specific key path, overrides, --keys
  -c COMMAND, --command COMMAND
                        Translates to ssh -C
  -r REMOTE_HOST, --remote-host REMOTE_HOST
                        Open a tunnels. Translates to ssh -L <local-port
                        >:<remote-host>:<remote-port> <selected-aws-host>
  -p REMOTE_PORT, --remote-port REMOTE_PORT
                        Port to use on the remote host.
  -l LOCAL_PORT, --local-port LOCAL_PORT
                        Port to use on the local host. Get overwritten by
                        remote port if not defined.
  --keys KEYS           Directory of the private keys.
  --timeout TIMEOUT     SSH connection timeout.
  --console-output      Display the instance console out before logging in.
  --version             Returns awsh's version.
```
