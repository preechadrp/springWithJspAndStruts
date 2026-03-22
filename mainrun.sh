#!/bin/bash

INI_FILE="runapp.ini"

# check file exists
if [ ! -f "$INI_FILE" ]; then
  echo "ERROR: $INI_FILE not found"
  exit 1
fi

# read first line (trim space)
APP_FILE=$(head -n 1 "$INI_FILE" | tr -d '\r\n' | xargs)

# check empty
if [ -z "$APP_FILE" ]; then
  echo "ERROR: No app name in $INI_FILE"
  exit 1
fi

# check file exists
if [ ! -f "$APP_FILE" ]; then
  echo "ERROR: $APP_FILE not found"
  exit 1
fi

echo "Running $APP_FILE ..."

java -jar "$APP_FILE"
