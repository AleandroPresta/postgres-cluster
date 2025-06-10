#!/bin/bash

#!/bin/bash
echo 'Starting PostgreSQL Database'

# Configure PostgreSQL to listen on all interfaces
echo "listen_addresses = '*'" >> /usr/local/pgsql/data/postgresql.conf
echo "host all all 0.0.0.0/0 md5" >> /usr/local/pgsql/data/pg_hba.conf

pg_ctl -D /usr/local/pgsql/data -l /usr/local/pgsql/data/logfile start -w

# Wait for PostgreSQL to be ready
sleep 3

# Set password for postgres user
psql -U postgres -c "ALTER USER postgres PASSWORD '${POSTGRES_PASSWORD}';"

# Execute the SQL script
psql -U postgres -f /scripts/init.sql

echo 'Database initialized'
env | grep POSTGRES || echo "No POSTGRES environment variables found"
tail -f /dev/null