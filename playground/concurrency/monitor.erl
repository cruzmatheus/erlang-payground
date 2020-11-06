-module(monitor).
-compile(export_all).

start_critic() -> spawn(?MODULE, restarter, []).

restarter() ->
  process_flag(trap_exit, true), % This acts like a monitor which will restart the process
  Pid = spawn_link(?MODULE, critic, []), % Will run on separated process
  register(critic, Pid), % give the process a name
  receive
    {'EXIT', Pid, normal} -> % not a crash
      ok;
    {'EXIT', Pid, shutdown} -> % manual termination, not a crash
      ok;
    {'EXIT', Pid, _} -> restarter()
  end.

judge(Band, Album) ->
  Ref = make_ref(),
  critic ! {self(), Ref, {Band, Album}},
  receive
    {Ref, Criticism} -> Criticism
  after 2000 ->
    timeout
  end.

critic() ->
  receive
    {From, Ref, {"Linkin Park", "Lying from you"}} ->
      From ! {Ref, "This song rocks"};
    {From, Ref, {"Slipknot", "Skeptical"}} ->
      From ! {Ref, "Hell yeah"};
    {From, Ref, {_Band, _Album}} ->
      From ! {Ref, "They are terrible"}
    end,
    critic().