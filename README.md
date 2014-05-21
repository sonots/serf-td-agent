# serf-td-agent

td-agent process management with [serf](http://www.serfdom.io/)

## Installation

Assume you have installed [td-agent](http://docs.fluentd.org/categories/installation).

Use [fluent-gem](http://docs.fluentd.org/articles/faq#i-installed-td-agent-and-want-to-add-custom-plugins-how-do-i-do-it):

```
fluent-gem install serf-td-agent
```

The `serf` command is automatically downloaded and bundled into the `bin` directory of the gem.
Also, `serf-td-agent` command, which is a serf event handler, is located at there. Set the environment variable `PATH` as:

```
export PATH=$(fluent-gem path serf-td-agent)/bin:$PATH
```

## How to setup the serf cluster

Run the first serf at any of hosts running td-agent like:

```bash
$ serf agent -event-handler=serf-td-agent
```

Run later serfs at other hosts running td-agent like:

```bash
$ serf agent -join={the first serf address} -event-handler=serf-td-agent
```

Hint: `-log-level=debug` option would be helpful for debugging. 

## How to restart td-agent via serf

Send a serf event from any of hosts running the serf like:

```bash
$ serf event td-agent-restart
```

This will propagate the `td-agent-restart` event to the entire serf cluster and execute `sudo /etc/init.d/td-agent restart` at all hosts.

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
