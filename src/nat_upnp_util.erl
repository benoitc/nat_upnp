%%% -*- erlang -*-
%%% This file is part of nat_upnp released under the MIT license.
%%% See the NOTICE for more information.
%%%
%%% Copyright (c) 2013 Benoît Chesneau <benoitc@refuge.io>
%%%

-module(nat_upnp_util).

-export([require/1]).

-export([route/1,route/2 ,routes/0]).

%% @doc Start the given applications if they were not already started.
-spec require(list(module())) -> ok.
require([]) ->
	ok;
require([App|Rest]) ->
	case application:start(App) of
		ok -> ok;
		{error, {already_started, App}} -> ok
	end,
	require(Rest).

%% route code coming from the following snippet
%% https://gist.github.com/archaelus/1247174
%% from @archaleus (Geoff Cant)

route(Targ) ->
    route(Targ, routes()).

route(Targ, Routes) ->
    sort_routes(routes_for(Targ, Routes)).

routes_for(Targ, Routes) ->
    [ RT || RT = {_IF, {Addr, Mask}} <- Routes,
            tuple_size(Targ) =:= tuple_size(Addr),
            match_route(Targ, Addr, Mask)
    ].

sort_routes(Routes) ->
    lists:sort(fun ({_, {_AddrA, MaskA}}, {_, {_AddrB, MaskB}}) ->
                       MaskA > MaskB
               end,
               Routes).

match_route(Targ, Addr, Mask)
  when tuple_size(Targ) =:= tuple_size(Addr),
       tuple_size(Targ) =:= tuple_size(Mask) ->
    lists:all(fun (A) -> A end,
              [element(I, Targ) band element(I, Mask)
               =:= element(I, Addr) band element(I, Mask)
               || I <- lists:seq(1, tuple_size(Targ)) ]).

routes() ->
    {ok, IFData} = inet:getifaddrs(),
    lists:append([ routes(IF, IFOpts) || {IF, IFOpts} <- IFData ]).

routes(IF, Opts) ->
    {_,Routes} = lists:foldl(fun parse_opts/2, {undefined, []}, Opts),
    [{IF, Route}
     || Route <- Routes].

parse_opts({addr, Addr}, {undefined, Routes}) ->
    {{addr, Addr}, Routes};
parse_opts({netmask, Mask}, {{addr, Addr}, Routes})
  when tuple_size(Mask) =:= tuple_size(Addr) ->
    {undefined, [{Addr, Mask} | Routes]};
parse_opts(_, Acc) -> Acc.

%% ---- end route code fron @archaleus
