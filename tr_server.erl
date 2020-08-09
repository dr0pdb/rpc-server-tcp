%%%-------------------------------------------------------------------
%%% @author Saurav <srv.twry@gmail.com>
%%% [https://sauravt.me]
%%% @copyright 2020 Saurav Tiwary
%%% @doc RPC over TCP server. This module defines a server process that
%%% listens for incoming TCP connections and allows the user to
%%% execute RPC commands via that TCP stream.
%%% @end
%%%-------------------------------------------------------------------

-module(tr_server).

-behaviour(gen_server).

%% API
-export([
    start_link/1,
    start_link/0,
    get_count/0,
    stop/0
]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-define(SERVER, ?MODULE).
-define(DEFAULT_PORT, 1055).

%% state of the process
-record(state, {port, lsock, request_count = 0}).

init(_Args) ->
    {ok, #state{dummy=1}}.

handle_call(stop, _From, State) ->
    {stop, normal, stopped, State};

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
