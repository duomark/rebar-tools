%%%-------------------------------------------------------------------
%%% @copyright (c) {{year}}, {{company}}.  All rights reserved.
%%% @author {{author}}
%%% @doc
%%%   Purpose of this gen_fsm...
%%% @since v{{since_vsn}}
%%% @end
%%%-------------------------------------------------------------------
-module({{module_name}}).
-copyright("(c) {{year}}, {{company}}.  All rights reserved.").
-author({{author_nick}}).

-behaviour(gen_fsm).

%% API
-export([start_link/0]).

%% gen_fsm callbacks
-export([
         init/1, terminate/3, code_change/4,
         handle_event/3, handle_sync_event/4, handle_info/3,
         'INITIAL_STATE'/2, 'INITIAL_STATE'/3
        ]).

-define(SERVER, ?MODULE).

-type gen_state() :: 'INITIAL_STATE'.
-record(state, {}).


%%%===================================================================
%%% API
%%%===================================================================

-spec start_link() -> {ok, pid()}.


%% @doc Starts, initializes and links gen_fsm.
start_link() ->
    gen_fsm:start_link({local, ?SERVER}, ?MODULE, {}, []).


%%%===================================================================
%%% init, terminate and code_change callbacks
%%%===================================================================

-spec init({}) -> {ok, gen_state(), #state{}}.
-spec terminate(atom(), gen_state(), #state{}) -> ok.
-spec code_change(string(), gen_state(), #state{}, any())
                 -> {ok, gen_state(), #state{}}.

%% @private
%% @doc Initialize internal gen_fsm state.
init({}) ->
    {ok, 'INITIAL_STATE', #state{}}.

%% @private
%% @doc Free any initialized resources before clearing gen_fsm state.
terminate(_Reason, _StateName, _State) ->
    ok.

%% @private
%% @doc Change running code.
code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.


%%%===================================================================
%%% State change callbacks
%%%===================================================================

-spec 'INITIAL_STATE'(any(), #state{}) -> {next_state, gen_state(), #state{}}.
-spec 'INITIAL_STATE'(any(), {pid(), reference()}, #state{})
                -> {reply, any(), gen_state(), #state{}}.

%% @private
%% @doc Handle asynch computation for state_name.
'INITIAL_STATE'(_Event, State) ->
    {next_state, 'INITIAL_STATE', State}.

%% @private
%% @doc Handle synch computation for state_name.
'INITIAL_STATE'(_Event, _From, State) ->
    Reply = ok,
    {reply, Reply, 'INITIAL_STATE', State}.


%%%===================================================================
%%% Generic event callbacks
%%%===================================================================

-spec handle_event(any(), gen_state(), #state{})
                  -> {next_state, gen_state(), #state{}}.
-spec handle_sync_event(any(), {pid(), reference()}, gen_state(), #state{})
                       -> {reply, any(), gen_state(), #state{}}.
-spec handle_info(any(), gen_state(), #state{})
                 -> {next_state, gen_state(), #state{}}.

%% @private
%% @doc Handle send_all_state_event/2.
handle_event(_Event, StateName, State) ->
    {next_state, StateName, State}.

%% @private
%% @doc Handle sync_send_all_state_event/[2,3]
handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    {reply, Reply, StateName, State}.

%% @private
%% @doc Handle TCP messages not sent through eventing.
handle_info(_Info, StateName, State) ->
    {next_state, StateName, State}.


%%%===================================================================
%%% Internal functions
%%%===================================================================




