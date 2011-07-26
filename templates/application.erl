%%%-------------------------------------------------------------------
%%% @copyright (c) {{year}}, {{company}}.  All rights reserved.
%%% @author {{author}}
%%% @doc
%%%   Application {{module_name}} ...
%%% @since v{{since_vsn}}
%%% @end
%%%-------------------------------------------------------------------
-module({{module_name}}_tests).
-copyright("(c) {{year}}, {{company}}.  All rights reserved.").
-author({{author_nick}}).
-module(application).

-behaviour(application).

%% Application callbacks
-export([start/0, start/2, stop/1]).


%% ===================================================================
%% Application callbacks
%% ===================================================================

-spec start() -> {ok, pid()}.
-spec start(any(), any()) -> {ok, pid()}.
-spec stop([]) -> ok.

%% @doc Start the {{module_name}} root supervisor in erl listener.
start() ->
    {{module_name}}:start_link().

%% @doc Start the {{module_name}} root supervisor from a boot script.
start(_StartType, _StartArgs) ->
    {{module_name}}:start_link().

%% @doc Stop the application.
stop(_State) -> ok.
