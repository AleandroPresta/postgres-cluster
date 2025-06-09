#!/bin/bash
echo 'Starting PostgreSQL Database'
pg_ctl -D /usr/local/pgsql/data -l /usr/local/pgsql/data/logfile start
tail -f /dev/null