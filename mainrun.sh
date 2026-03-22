#!/bin/bash

# cd ไปยัง directory ของ script ตัวเอง
cd "$(dirname "$0")"

INI_FILE="runapp.ini"

# check file exists
if [ ! -f "$INI_FILE" ]; then
  echo "ERROR: $INI_FILE not found"
  exit 1
fi

# read first line
#ข้าม comment (#) ข้ามบรรทัดว่าง เอา entry แรกที่ valid จริง
APP_FILE=$(grep -v '^\s*#' "$INI_FILE" | grep -v '^\s*$' | head -n 1 | xargs)

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