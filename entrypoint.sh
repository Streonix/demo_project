#!/bin/bash

set -e

echo "Migrate the Database"

# Wait for few minute and run db migration
while ! python manage.py migrate --noinput 2>&1; do
   echo "Migration is in progress"
   sleep 3
done

echo "Django docker is fully configured successfully."

exec "$@"