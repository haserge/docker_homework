#!/bin/bash

echo "Migrate the Database at startup of project"

while ! python manage.py migrate  2>&1; do
   echo "Migration is in progress status"
   sleep 3
done

while ! python manage.py loaddata bbk_data.json  2>&1; do
   echo "Load BBK data from json"
   sleep 3
done

echo "Django docker is fully configured successfully."

exec "$@"
