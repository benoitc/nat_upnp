

# Module nat_upnp_proto #
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

<a name="types"></a>

## Data Types ##




### <a name="type-nat_upnp">nat_upnp()</a> ###


<pre><code>
nat_upnp() = #nat_upnp{}
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#add_port_mapping-6">add_port_mapping/6</a></td><td></td></tr><tr><td valign="top"><a href="#delete_port_mapping-3">delete_port_mapping/3</a></td><td></td></tr><tr><td valign="top"><a href="#discover-0">discover/0</a></td><td></td></tr><tr><td valign="top"><a href="#discover-1">discover/1</a></td><td></td></tr><tr><td valign="top"><a href="#status_info-1">status_info/1</a></td><td></td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="add_port_mapping-6"></a>

### add_port_mapping/6 ###

`add_port_mapping(Nat_upnp, Protocol0, ExternalPort, InternalPort, Description, Timeout) -> any()`

<a name="delete_port_mapping-3"></a>

### delete_port_mapping/3 ###

`delete_port_mapping(Nat_upnp, Protocol0, ExternalPort) -> any()`

<a name="discover-0"></a>

### discover/0 ###

`discover() -> any()`

<a name="discover-1"></a>

### discover/1 ###

`discover(Timeout) -> any()`

<a name="status_info-1"></a>

### status_info/1 ###

`status_info(Nat_upnp) -> any()`

