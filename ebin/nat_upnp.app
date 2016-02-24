{application, nat_upnp, [
	{description, "library to use UPnP to be able to forward ports"},
	{vsn, "0.1"},
	{modules, ['nat_upnp','nat_upnp_proto']},
	{registered, []},
	{applications, [kernel,stdlib,inet_ext]}
]}.