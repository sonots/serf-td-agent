# serf-td-agent

td-agent process management with [serf](http://www.serfdom.io/)

## Installation

Use RubyGems:

```
gem install serf-td-agent
```

The `serf` command is automatically downloaded and bundled with `gem install`. The command is located at the `bin` directory of the gem. 

## How to setup the serf cluster

Run the first serf at any of hosts to run td-agent like:

```bash
$ serf agent -event-handler=$(which serf-td-agent)
```

Run later serfs at other hosts to run td-agent like:

```bash
$ serf agent -join={the first serf address} -event-handler=$(which serf-td-agent)
```

## How to start td-agent via serf

Send a serf event from any of hosts running the serf like:

```bash
$ serf event td-agent-start
```

This will propagate the `start` event to the entire serf cluster and execute `sudo /etc/init.d/td-agent start` at all hosts.

## Available events

Following events are available: 

* `td-agent-start`
* `td-agent-stop`
* `td-agent-reload`
* `td-agent-restart`
* `td-agent-condrestart`
* `td-agent-status`
* `td-agent-configtest`

which corresponds with /etc/init.d/td-agent command. 

## ToDo

Use `serf query` for commands which requires responses like `status` and `configtest`. 

## ChangeLog

See [CHANGELOG.md](CHANGELOG.md) for details.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new [Pull Request](../../pull/new/master)

## Copyright

Copyright (c) 2014 Naotoshi Seo. See [LICENSE](LICENSE) for details.

The license of `serf` belongs to serf. See [serf/LICENSE](https://github.com/hashicorp/serf/blob/master/LICENSE). 
