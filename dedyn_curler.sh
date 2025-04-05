#!/bin/bash

ip="$(curl -s --fail-with-body https://api.ipify.org)"
if (( $? != 0 )) || [[ -z "$ip" ]]; then
  echo "Did not find ipv4" >&2
  exit 1
fi

ipv6="$(curl -s --fail-with-body https://api6.ipify.org)"
if (( $? != 0 )) || [[ -z "$ipv6" ]]; then
  echo "Did not find ipv6" >&2
  exit 1
fi

curl -s --fail-with-body -K "${CREDENTIALS_DIRECTORY}/dedyn_user" "https://update.dedyn.io/?myipv4=${ip}&myipv6=${ipv6}"
if (( $? != 0 )) then
  echo "Update failed" >&2
  exit 1
fi

