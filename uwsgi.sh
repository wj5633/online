#!/bin/bash
set -e

uwsgi -s :8000 -w online -p 10