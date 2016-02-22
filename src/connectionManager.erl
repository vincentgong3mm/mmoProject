-module(connectionManager).
-export([start/0, procClientRequest/0]).
-import(tcpModule, [createServer/3]).

start() ->
    createServer(8088, 10, get_procClientRequest()).

procClientRequest() ->
    receive 
    {ok, BinRecv} ->
        io:format("connectionManager:procClientRequest Recv='~p'~n", [BinRecv]),
        procClientRequest();
    _ ->
        ok
    end.
    
get_procClientRequest() ->
    fun procClientRequest/0.
    