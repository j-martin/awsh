AWSH
----

Another SSH utility for AWS

## What does it do?

It gives you a list of hosts you have access to and preconfigure `ssh` with the
proper key and user (assuming they have not been overridden by a configuration
management tool). You can filter by instance name and if it matches only one
instance it will log to it.

Use cases
---------

- You are running elasticbeanstalk, EMR or something that creates it's own instance automatically.
- You are using different key-set for different instances and you can't remember which one does what.
- Instances are coming and going and you lost track of what is available.

## Requirements

- python 2 or 3
- boto3 (see requirements.txt)
- properly configured aws-cli (as in having a config here: `$HOME/.aws/config`

Usage
-----
```
$ awsh -h
usage: awsh [-h] [--users USERS [USERS ...]] [--region REGION] [-i KEY_PATH]
            [--keys KEYS] [--timeout TIMEOUT]
            [filter]

SSH into AWS instances. the default Assumes that everything runs on Ubuntu and
or Amazon's AMIs. ex: "awsh --users user1 user2 --region us-west-2 --keys
'~/.keys' instance-name". Note that "awsh --users user1 user2 instance-name"
will not be parsed properly due to the nature of nargs. In that case you may
want to do: "awsh instance-name --users user1 user2".

positional arguments:
  filter                Optional name filter. If only one instance is found,
                        it will connect to it directly.

optional arguments:
  -h, --help            show this help message and exit
  --users USERS [USERS ...]
                        Specify the users to try.
  --region REGION       Specify the aws region.
  -i KEY_PATH           Specific key path, overrides, --keys
  --keys KEYS           Directory of the private keys.
  --timeout TIMEOUT     SSH connection timeout.
```
