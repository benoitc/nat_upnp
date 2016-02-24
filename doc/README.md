

# nat_upnp - Make your port public using UNP #

Copyright (c) 2013 Benoît Chesneau.

__Version:__ 0.1.0

# nat_upnp

**nat_upnp** is an Erlang library library that provides you a way to o
map a local port to the external using [UPnP
IGD](http://en.wikipedia.org/wiki/Internet_Gateway_Device_Protocol).

The usage of **nat_upnp** is pretty simple and just the minimum of the
UNP to map a local port to the external.

## Example of usage

### Discover the router

```
1> {ok, Context} = nat_upnp:discover().
{ok,{nat_upnp,"http://192.168.1.254:5678/control/wan_ip_connection",
              "192.168.1.45"}}
```

### Add a port mapping

```
2> Protocol = tcp,
2> ExternalPort = 5638,
2> InternalPort = 5638,
2> Description = "test nat upnp",
2> Timeout = 0,
2> ok = nat_upnp:add_port_mapping(Context, Protocol, ExternalPort, InternalPort, Description, Timeout).
ok
```

> Note: Timeout = 0 mean, the port will never be released (ie. infinite
> timeout)

### Remove a port mapping

```
3> ok = nat_upnp:delete_port_mapping(Context, Protocol, ExternalPort).
ok
```

> Note: don't forget to remove the port you registered to the router
> when you exit the application or close the port. For example you could
> monitor the process that maintain the socket and when it's closing,
> unregister the port. Of course there are many other way to achieve
> that purpose.

## Contribute

For issues, comments or feedback please [create an
issue](http://github.com/benoitc/nat_upnp/issues).

### Notes for developers

If you want to contribute patches or improve the doc, you will need to
build nat_unp using the `rebar_dev.config`  file. It can also be built
using the **Makefile**:

```
$ make dev ; # compile & get deps
$ make devclean ; # clean all files
```


## Modules ##


<table width="100%" border="0" summary="list of modules">
<tr><td><a href="nat_upnp.md" class="module">nat_upnp</a></td></tr>
<tr><td><a href="nat_upnp_proto.md" class="module">nat_upnp_proto</a></td></tr></table>

