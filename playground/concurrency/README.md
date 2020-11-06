## For monitor
  
  ```erlang
    monitor:start_critic(). % starts in separated process
    monitor:judge("artist","song"). 
    > "They are terrible"
    exit(whereis(critic),kill). % kill the critics process thus tried to kill the restart process as well. Restarting is done.
    > true
    monitor:judge("Linkin Park","Lying from you").
    > "This song rocks"
  ```