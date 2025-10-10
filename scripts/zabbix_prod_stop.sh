#!/bin/bash
#v01-20250530.0

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

function up() {
    docker compose -f "$SCRIPT_DIR/../compose.yaml" --env-file "$SCRIPT_DIR/../.env" up -d $1
}

function stop() {
    docker compose -f "$SCRIPT_DIR/../compose.yaml" --env-file "$SCRIPT_DIR/../.env" stop $1
}

stop phpmyadmin
stop traefik
stop zabbix-agent
stop zabbix-web
stop zabbix-server
stop mariadb
