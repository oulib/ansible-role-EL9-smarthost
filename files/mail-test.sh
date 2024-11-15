#!/bin/bash

## Require arguments
if [  -z "$1" ] || [ -z "$2" ]; then
    cat <<USAGE
sends a test email.
Usage: maili-test.sh \$from \$to
USAGE
  exit 1;
fi



FROM=$1
TO=$2
TIMESTAMP=$(date --iso-8601=seconds)
HOSTNAME=$(hostname)

sendmail -f "${FROM}" "${TO}" <<EOM
From: ${FROM}
Subject: ${HOSTNAME} mail test at ${TIMESTAMP}
This is a test message. 

If you aren't expecting it, you can probably ignore it.
.
EOM
