#!/usr/bin/env bash

ENVIRONMENT="
DJANGO_ALLOWED_HOSTS=${WEB_DOMAIN}
DJANGO_DB_NAME=mailape
DJANGO_DB_USER=mailape
DJANGO_DB_PASSWORD=${DJANGO_DB_PASSWORD}
DJANGO_DB_HOST=${DJANGO_DB_HOST}
DJANGO_DB_PORT=5432
DJANGO_LOG_FILE=/var/log/mailape/mailape.log
DJANGO_SECRET_KEY=${DJANGO_SECRET}
DJANGO_SETTINGS_MODULE=config.production_settings
MAIL_APE_FROM_EMAIL=admin@blvdplatform.com
EMAIL_HOST=${EMAIL_HOST}
EMAIL_HOST_USER=mailape
EMAIL_HOST_PASSWORD=${EMAIL_HOST_PASSWORD}
EMAIL_HOST_PORT=587
EMAIL_HOST_TLS=true
"

INI_FILE="[mod_wsgi]
${ENVIRONMENT}
"

echo "${INI_FILE}" | sudo tee "/etc/mailape/mailape.ini"
echo "${ENVIRONMENT}" | sudo tee "/etc/mailape/celery.env"
