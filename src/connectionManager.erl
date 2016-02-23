-module(connectionManager).
-export([start/0, procClientRequest/0]).
-import(tcpModule, [createServer/3]).

start() ->
    %%createServer(8088, 10, get_procClientRequest()).
    createServer(8088, 10, fun() -> procClientRequest() end).

procClientRequest() ->
    receive 
    {ok, BinRecv} ->
        io:format("connectionManager:procClientRequest Recv='~p'~n", [BinRecv]),
        procClientRequest();
    _ ->
        ok
    end.

%% 1. 이렇게 함수의 함수를 spawn에 넘기거나,  
%% 2. 아니면 spawn(fun() -> procClientRequest() end) 이렇게.
%% 2번이 더 편할것 같음.
%%get_procClientRequest() ->
%%    fun procClientRequest/0.
    