%%% -*- erlang -*-
%%% This file is part of nat_upnp released under the MIT license.
%%% See the NOTICE for more information.
%%%
%%% Copyright (c) 2013 Benoît Chesneau <benoitc@refuge.io>
%%%

-module(nat_upnp).

-export([discover/0,
         discover/1,
         status_info/1,
         add_port_mapping/4, add_port_mapping/5, add_port_mapping/6,
         delete_port_mapping/3]).


-type protocol() :: tcp | udp.
-export_type([protocol/0]).

%% @doc discover the gateway and our IP to associate
-spec discover() -> {ok, Context:: nat_upnp_proto:nat_upnp()}
                    | {error, term()}.
discover() ->
    nat_upnp_proto:discover().

%% @doc discover the gateway and our IP to associate, stop to wait after
%% a timeout (default is infinity).
-spec discover(integer()) -> {ok, Context :: nat_upnp_proto:nat_upnp()}
                             | {error, term()}.
discover(Timeout) ->
    nat_upnp_proto:discover(Timeout).

%% @doc get router status
-spec status_info(Context :: nat_upnp_proto:nat_upnp())
      -> {Status::string(), LastConnectionError::string(), Uptime::string()}
      | {error, term()}.
status_info(Context) ->
    nat_upnp_proto:status_info(Context).

%% Add a port mapping Externa; port and internal port are the same
-spec add_port_mapping(Context :: nat_upnp_proto:nat_upnp(),
                       Protocol:: protocol(),
                       Port :: integer(),
                       Description :: string())
    -> ok | {error, term()}.
add_port_mapping(Context, Protocol, Port, Description) ->
    add_port_mapping(Context, Protocol, Port, Port, Description, 0).

%% @doc Add a port mapping with an infinie release time

-spec add_port_mapping(Context :: nat_upnp_proto:nat_upnp(),
                       Protocol:: protocol(), ExternalPort :: integer(),
                       InternalPort :: integer(),
                       Description :: string())
    -> ok | {error, term()}.
add_port_mapping(Context, Protocol, ExternalPort, InternalPort,
                 Description) ->
    add_port_mapping(Context, Protocol, ExternalPort, InternalPort,
                     Description, 0).

%% @doc Add a port mapping and release after Timeout
-spec add_port_mapping(Context :: nat_upnp_proto:nat_upnp(),
                       Protocol:: protocol(), ExternalPort :: integer(),
                       InternalPort :: integer(),
                       Description :: string(),
                       Timeout :: integer())
    -> ok | {error, term()}.
add_port_mapping(Context, Protocol, ExternalPort, InternalPort,
                 Description, Timeout) ->
    nat_upnp_proto:add_port_mapping(Context, Protocol, ExternalPort,
                                    InternalPort, Description, Timeout).

%% @doc Delete a port mapping from the router
-spec delete_port_mapping(Context :: nat_upnp_proto:nat_upnp(),
                          Protocol :: protocol(), Port :: integer())
    -> ok | {error, term()}.
delete_port_mapping(Context, Protocol, ExternalPort) ->
    nat_upnp_proto:delete_port_mapping(Context, Protocol, ExternalPort).
