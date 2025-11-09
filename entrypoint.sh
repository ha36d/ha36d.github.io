#!/bin/bash
set -e

if [ ! -f Gemfile ]; then
  echo "No Gemfile found. Exiting..."
  exit 1
fi

exec "$@"