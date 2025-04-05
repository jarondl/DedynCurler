#!/bin/bash

# The secret file should be in the format 
# --user DOMAIN_NAME:TOKEN
#
# Where domain name is the full domain name, and the token you obtained from desec.io
# We pass this with -K to curl.

# Encrypt the file and store in in place.
systemd-creds --name dedyn_user encrypt ../dedyn_user -p  /usr/local/etc/dedyn_user.cred
