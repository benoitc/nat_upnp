PROJECT=nat_upnp
PROJECT_DESCRIPTION=library to use UPnP to be able to forward ports
PROJECT_VERSION=0.1

DEPS = inet_ext

dep_inet_ext = git https://github.com/benoitc/inet_ext 0.3.2

DOC_DEPS = edown
EDOC_OPTS = {doclet, edown_doclet}, \
			{top_level_readme, {"./README.md", "http://github.com/benoitc/nat_upnp"}}



all:: deps app rel

doc: edoc

distclean:: distclean-edown

distclean-edown:
	rm -rf doc/*.md

app:: rebar.config

include erlang.mk
