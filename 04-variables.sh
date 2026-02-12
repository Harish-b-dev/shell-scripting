#!/bin/shell

start_time=$(date +%s)

start_timefull=$(date +%s)

echo "script executed at $start_time"

sleep 10 &

end_time=$(date +%s - $start_time)

echo "script completed at $end_time"

