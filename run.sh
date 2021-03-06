#!/bin/sh

set -e

if [ -z $BASIC_AUTH_USERNAME ]; then
  echo >&2 "BASIC_AUTH_USERNAME must be set"
  exit 1
fi

if [ -z $BASIC_AUTH_PASSWORD ]; then
  echo >&2 "BASIC_AUTH_PASSWORD must be set"
  exit 1
fi

htpasswd -bBc /etc/nginx/.htpasswd $BASIC_AUTH_USERNAME $BASIC_AUTH_PASSWORD

sed  -e "s|##PROXY_PASS##|$PROXY_PASS|g" /etc/nginx/conf.d/default.conf > /etc/nginx/conf.d/default.conf
sed \
  -e "s|##PROXY_PASS##|$PROXY_PASS|g" \
  /nginx.conf.tmpl > /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"
