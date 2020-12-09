# Since we use NetworkManager to invoke dnsmask, we need to disable its service.
SYSTEMD_AUTO_ENABLE_${PN} = "disable"
