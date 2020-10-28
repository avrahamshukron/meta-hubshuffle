FILESEXTRAPATHS_prepend_openmentos := "${THISDIR}/files:"

SRC_URI_append_openmentos = " \
	file://home-wifi.nmconnection.in \
"

do_install_append_openmentos () {
	# Install "home wifi" connection config
	if [ -n "${OPENMENTOS_WIFI_SSID}" ] && [ -n "${OPENMENTOS_WIFI_PSK}" ]; then
		sed -e 's/@@OPENMENTOS_WIFI_SSID@@/${OPENMENTOS_WIFI_SSID}/' \
		    -e 's/@@OPENMENTOS_WIFI_PSK@@/${OPENMENTOS_WIFI_PSK}/' \
		    "${WORKDIR}/home-wifi.nmconnection.in" > "${WORKDIR}/home-wifi.nmconnection" 
		install -m 0600 ${WORKDIR}/home-wifi.nmconnection ${D}${sysconfdir}/NetworkManager/system-connections
	fi
}
