#!/bin/bash

# Tulis .env dari environment variables
cat > /app/.env << ENVEOF
APP_NAME=Laravel
APP_ENV=${APP_ENV:-production}
APP_KEY=${APP_KEY}
APP_DEBUG=${APP_DEBUG:-false}
APP_URL=${APP_URL:-http://localhost}

DB_CONNECTION=oltp
OLTP_DB_HOST=${OLTP_DB_HOST:-postgres}
OLTP_DB_PORT=${OLTP_DB_PORT:-5432}
OLTP_DB_DATABASE=${OLTP_DB_DATABASE:-tracer_oltp}
OLTP_DB_USERNAME=${OLTP_DB_USERNAME:-postgres}
OLTP_DB_PASSWORD=${OLTP_DB_PASSWORD}
OLAP_DB_HOST=${OLAP_DB_HOST:-postgres}
OLAP_DB_PORT=${OLAP_DB_PORT:-5432}
OLAP_DB_DATABASE=${OLAP_DB_DATABASE:-tracer_oltp}
OLAP_DB_USERNAME=${OLAP_DB_USERNAME:-postgres}
OLAP_DB_PASSWORD=${OLAP_DB_PASSWORD}

SESSION_DRIVER=database
CACHE_STORE=database
QUEUE_CONNECTION=database
ENVEOF

php artisan config:clear
php artisan migrate --force
php artisan serve --host=0.0.0.0 --port=8000
