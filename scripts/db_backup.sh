#!/bin/bash
#v01-20250530.0

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

docker compose exec mariadb bash -c "./backup.sh"
