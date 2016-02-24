

# Module nat_upnp #
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

<a name="types"></a>

## Data Types ##




### <a name="type-protocol">protocol()</a> ###


<pre><code>
protocol() = tcp | udp
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#add_port_mapping-4">add_port_mapping/4</a></td><td></td></tr><tr><td valign="top"><a href="#add_port_mapping-5">add_port_mapping/5</a></td><td>Add a port mapping with an infinie release time.</td></tr><tr><td valign="top"><a href="#add_port_mapping-6">add_port_mapping/6</a></td><td>Add a port mapping and release after Timeout.</td></tr><tr><td valign="top"><a href="#delete_port_mapping-3">delete_port_mapping/3</a></td><td>Delete a port mapping from the router.</td></tr><tr><td valign="top"><a href="#discover-0">discover/0</a></td><td>discover the gateway and our IP to associate.</td></tr><tr><td valign="top"><a href="#discover-1">discover/1</a></td><td>discover the gateway and our IP to associate, stop to wait after
a timeout (default is infinity).</td></tr><tr><td valign="top"><a href="#status_info-1">status_info/1</a></td><td>get router status.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="add_port_mapping-4"></a>

### add_port_mapping/4 ###

<pre><code>
add_port_mapping(Context::<a href="nat_upnp_proto.md#type-nat_upnp">nat_upnp_proto:nat_upnp()</a>, Protocol::<a href="#type-protocol">protocol()</a>, Port::integer(), Description::string()) -&gt; ok | {error, term()}
</code></pre>
<br />

<a name="add_port_mapping-5"></a>

### add_port_mapping/5 ###

<pre><code>
add_port_mapping(Context::<a href="nat_upnp_proto.md#type-nat_upnp">nat_upnp_proto:nat_upnp()</a>, Protocol::<a href="#type-protocol">protocol()</a>, ExternalPort::integer(), InternalPort::integer(), Description::string()) -&gt; ok | {error, term()}
</code></pre>
<br />

Add a port mapping with an infinie release time

<a name="add_port_mapping-6"></a>

### add_port_mapping/6 ###

<pre><code>
add_port_mapping(Context::<a href="nat_upnp_proto.md#type-nat_upnp">nat_upnp_proto:nat_upnp()</a>, Protocol::<a href="#type-protocol">protocol()</a>, ExternalPort::integer(), InternalPort::integer(), Description::string(), Timeout::integer()) -&gt; ok | {error, term()}
</code></pre>
<br />

Add a port mapping and release after Timeout

<a name="delete_port_mapping-3"></a>

### delete_port_mapping/3 ###

<pre><code>
delete_port_mapping(Context::<a href="nat_upnp_proto.md#type-nat_upnp">nat_upnp_proto:nat_upnp()</a>, Protocol::<a href="#type-protocol">protocol()</a>, Port::integer()) -&gt; ok | {error, term()}
</code></pre>
<br />

Delete a port mapping from the router

<a name="discover-0"></a>

### discover/0 ###

<pre><code>
discover() -&gt; {ok, Context::<a href="nat_upnp_proto.md#type-nat_upnp">nat_upnp_proto:nat_upnp()</a>} | {error, term()}
</code></pre>
<br />

discover the gateway and our IP to associate

<a name="discover-1"></a>

### discover/1 ###

<pre><code>
discover(Timeout::integer()) -&gt; {ok, Context::<a href="nat_upnp_proto.md#type-nat_upnp">nat_upnp_proto:nat_upnp()</a>} | {error, term()}
</code></pre>
<br />

discover the gateway and our IP to associate, stop to wait after
a timeout (default is infinity).

<a name="status_info-1"></a>

### status_info/1 ###

<pre><code>
status_info(Context::<a href="nat_upnp_proto.md#type-nat_upnp">nat_upnp_proto:nat_upnp()</a>) -&gt; {Status::string(), LastConnectionError::string(), Uptime::string()} | {error, term()}
</code></pre>
<br />

get router status

