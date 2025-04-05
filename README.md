# DedynCurler

Update dedyn.io dynamic dns addresses using curl and systemd timers.

A very simple script to update desec.io dynamic dns A and AAAA records, using curl to obtain the ip from apify.org, and curl to update the dns. Uses systemd timers to run, systemd `DynamicUser` for no good reason, and systemd encrypted credentials to store the credentials.

I just needed this for myself, and am storing it in GitHub.
