#!/bin/shell

start_time=$(date+%S)

start_timefull=$(date+%s)

echo "script executed at $start_time"

sleep 10 &

end_time=$($start_timefull - date+%s)

echo "script completed at $end_time"

