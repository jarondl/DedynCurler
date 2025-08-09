
install -m 0644 dedyn_curler@.{service,timer} /etc/systemd/system/ &&
	install dedyn_curler.sh /usr/local/bin/ &&
  systemctl daemon-reload

