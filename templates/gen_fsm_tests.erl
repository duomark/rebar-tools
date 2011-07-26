%%%-------------------------------------------------------------------
%%% @copyright (c) 2011, Solevo, L.L.C.  All rights reserved
%%% @author {{author}}
%%% @doc
%%%   Eunit tests for {{module_name}}.
%%% @since v0.2.8
%%% @end
%%%-------------------------------------------------------------------
-module({{module_name}}_tests).
-copyright("(c) 2011, Solevo, L.L.C.  All rights reserved").
-author({{author_nick}}).

-include_lib("eunit/include/eunit.hrl").

-define(TM, {{module_name}}).
-record(state, {}).

start_fsm() -> fun() -> ?TM:start_link() end.
stop_fsm() ->  fun({ok, P1}) ->
                       unlink(P1),
                       unregister(?TM),
                       process_flag(trap_exit, true),
                       case exit(P1, kill) of
                           true -> ok
                       end,
                       ok
               end.

%%--------------------------------------------------------------------
%% @doc
%%    Start the server and verify the children.
%% @end
%%--------------------------------------------------------------------
start_test_() ->
    {setup, start_fsm(), stop_fsm(),
     {with, [fun check_init/1, fun check_terminate/1,
             fun check_code_change/1]}
    }.

check_init({ok, P1}) when is_pid(P1) ->
    ?assertMatch({ok, 'INITIAL_STATE', #state{}}, ?TM:init({})),
    ?assert(is_process_alive(P1)),
    ?assertMatch(P1, whereis(?TM)).

check_terminate({ok, _P1}) ->
    ?assertMatch(ok, ?TM:terminate(crash, state_name, #state{})).

check_code_change({ok, _P1}) ->
    ?assertMatch({ok, state_name, #state{}},
                  ?TM:code_change("Upgrade", state_name,
                                  #state{}, {extra, data})).
