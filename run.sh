#!/usr/bin/env bash

# Get the absolute path of the script
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Use the script directory to reference the configuration file
docker run --name my-nginx --rm \
  -v "$(pwd):/usr/share/nginx/html:ro" \
  -v "$script_dir/default.conf:/etc/nginx/conf.d/default.conf" \
  -e NGINX_WORKER_PROCESSES=1 \
  -p 8080:80 nginx
