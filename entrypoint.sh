#!/bin/sh -l

HOST=$1
PASSWORD=$2
SHARING_ID=$3
UPLOADER_NAME=$4
FILE=$5

if [ -z "$HOST" ]
then
  echo "Invalid host"
  exit 1
fi

if [ -z "$SHARING_ID" ]
then
  echo "Invalid sharing ID"
  exit 1
fi

if [ -z "$FILE" ]
then
  echo "Invalid file"
  exit 1
fi

if [ -z "$UPLOADER_NAME" ]
then
  echo "Invalid uploader name"
  exit 1
fi

if [ ! -z "$PASSWORD" ]
then
  echo "Login to synology file share..."
  curl -s -L -X POST "$HOST/sharing/webapi/entry.cgi/SYNO.Core.Sharing.Login" \
      -j -c /tmp/syno_file_upload_cookies \
      -d "api=SYNO.Core.Sharing.Login&method=login&version=1&sharing_id=%22$SHARING_ID%22&password=%22$PASSWORD%22" > /dev/null
else
  echo "Initialize connection..."
  curl -s -L "$HOST/sharing/$SHARING_ID" \
    -j -c /tmp/syno_file_upload_cookies > /dev/null
fi

echo "Uploading the file..."
FILE_LAST_MODIFIED=$(date -r $FILE +%s%3N)
curl -s -L -X POST "$HOST/webapi/entry.cgi?api=SYNO.FileStation.Upload&method=upload&version=2&_sharing_id=%22$SHARING_ID%22" \
        -b /tmp/syno_file_upload_cookies \
        -F "overwrite=\"true\"" \
        -F "mtime=\"$FILE_LAST_MODIFIED\"" \
        -F "sharing_id=\"$SHARING_ID\"" \
        -F "uploader_name=\"$UPLOADER_NAME\"" \
        -F "size=\"undefined\"" \
        -F "file=@\"$FILE\"" > /dev/null

rm -f /tmp/syno_file_upload_cookies
