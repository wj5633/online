#!/bin/bash
set -e

cd /online

celery -A online worker -l info