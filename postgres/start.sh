#!/bin/bash

#!/bin/bash
echo 'Starting PostgreSQL Database'
pg_ctl -D /usr/local/pgsql/data -l /usr/local/pgsql/data/logfile start -w

# Wait for PostgreSQL to be ready
sleep 3

# Execute the SQL script
psql -U postgres -f /scripts/init.sql

echo 'Database initialized'
env | grep POSTGRES || echo "No POSTGRES environment variables found"
tail -f /dev/null