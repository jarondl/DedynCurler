#!/bin/bash

# We accept a systemd template parameter, which will
# decide both the hostname and proto. Yes, this is very specific,
# but that's what I need in my case. If the hostname starts with
# ipv4, it will get ipv4, and if with ipv6, then ipv6.
hostname="$1"
if [[ -z "$hostname" ]] || [[ ! "$hostname" =~ ^(ipv4|ipv6) ]] ; then
  echo "hostname not specified, or wrong, ${hostname}" >&2
  exit 1
fi

echo "starting dedyn curler for ${hostname}"

case "$hostname" in
  ipv4*)
    ip="$(curl -s --fail-with-body https://api.ipify.org)"
    ;;
  ipv6*)
    ip="$(curl -s --fail-with-body https://api6.ipify.org)"
    ;;
esac
if (( $? != 0 )) || [[ -z "$ip" ]]; then
  echo "Did not find ip" >&2
  exit 1
fi

req="https://update.dedyn.io/?myip=${ip}&hostname=${hostname}"
echo "requesting curl ${req}"

curl -s --fail-with-body -K "${CREDENTIALS_DIRECTORY}/dedyn_user" "${req}"
if (( $? != 0 )) then
  echo "Update failed" >&2
  exit 1
fi

