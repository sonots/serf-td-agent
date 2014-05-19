# serf-td-agent

td-agent process management with [serf](http://www.serfdom.io/)

## Installation

Use RubyGems:

```
gem install serf-td-agent
```

The `serf` command is bundled with this gem. You can find it in the `bin` directory of the gem. 

## How to Setup The Serf Cluster

Run the first serf at any of hosts to run td-agent like:

```bash
$ serf agent -event-handler=$(which serf-td-agent)
```

Run later serfs at other hosts to run td-agent like:

```bash
$ serf agent -join={the first serf address} -event-handler=$(which serf-td-agent)
```

## How to Start all td-agent via serf

Send a serf event from any of hosts running the serf like:

```bash
$ serf event start
```

This will propagate the `start` event to the entire serf cluster and execute `sudo /etc/init.d/td-agent start` on all hosts. 

You can also use  "start", "stop", "reload", "restart", "condrestart", "status", "configtest". 
