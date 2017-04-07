#!/bin/bash
set -e

uwsgi -i conf/mx_uwsgi.ini  &

celery -A online worker -l info  &

exec "$@"


