## Build
    $ erl -make

## Shell
    $ erl -pa ebin

## Shell commands

  ```erlang
    event_server:start().
    event_server:subscribe(self()).
    event_server:add_event("Hey there", "test", {{2020,12,31},{23,59,59}}).
    event_server:listen(5).
    event_server:cancel("Hey there").
    event_server:add_event("Hey there2", "test", {{2020,11,9},{13,1,59}}).
    event_server:listen(5).
  ```

## Supervisor

  ```erlang
    SupPid = sup:start(evserv, []). 
    > <0.43.0>
    whereis(evserv).
    > <0.44.0>
    exit(whereis(evserv), die).
    > true
    > Process <0.44.0> exited for reason die 5> 
    exit(whereis(evserv), die).
    > Process <0.48.0> exited for reason die true
    exit(SupPid, shutdown).
    > true
    whereis(evserv).
    > undefined
  ```