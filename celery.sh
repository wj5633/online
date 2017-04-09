#!/bin/bash
set -e

celery -A online worker -l info