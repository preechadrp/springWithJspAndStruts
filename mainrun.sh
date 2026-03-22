#!/bin/bash

cd "$(dirname "$0")"

INI_FILE="runapp.ini"

if [ ! -f "$INI_FILE" ]; then
  echo "ERROR: $INI_FILE not found"
  exit 1
fi

APP_FILE=$(grep -v '^\s*#' "$INI_FILE" \
  | grep -v '^\s*$' \
  | head -n 1 \
  | tr -d '\r' \
  | xargs)

if [ -z "$APP_FILE" ]; then
  echo "ERROR: No app name in $INI_FILE"
  exit 1
fi

if [[ "$APP_FILE" != *.war ]]; then
  echo "ERROR: $APP_FILE is not a .war file"
  exit 1
fi

if [ ! -f "$APP_FILE" ]; then
  echo "ERROR: $APP_FILE not found"
  exit 1
fi

echo "Running $(pwd)/$APP_FILE ..."

java -jar "$APP_FILE"