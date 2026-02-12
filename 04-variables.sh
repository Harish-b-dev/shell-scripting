#!/bin/shell

start_time=$(date)

echo "script executed at $start_time"

system_sleep=$(sleep 10 &)

echo "system will sleep for $system_sleep"

