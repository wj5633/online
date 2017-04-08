#!/bin/bash
set -e

uwsgi -i /online/conf/mx_uwsgi.ini  &

cd /online

celery -A online worker -l info  &