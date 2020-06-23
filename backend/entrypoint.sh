#!/bin/sh
set -e

until PGPASSWORD=$DATABASE_PASSWORD psql -U $DATABASE_USER --host=$DATABASE_HOST $DATABASE_NAME '\l'; do
    >&2 echo "Postgres is unavailable - sleeping"
    sleep 1
done

>&2 echo "Postgres is up - continuing"

python manage.py migrate --noinput
python manage.py collectstatic --no-input --clear

exec "$@"
