FILESEXTRAPATHS_prepend_openmentos := "${THISDIR}/files:"

SRC_URI_append_openmentos = " \
	file://home-wifi.nmconnection.in \
	file://hotspot.nmconnection.in \
"

do_install_append_openmentos () {
	# Install "home wifi" connection config
	if [ -n "${OPENMENTOS_WIFI_HOME_SSID}" ] && [ -n "${OPENMENTOS_WIFI_HOME_PSK}" ]; then
		sed -e 's/@@OPENMENTOS_WIFI_HOME_SSID@@/${OPENMENTOS_WIFI_HOME_SSID}/' \
		    -e 's/@@OPENMENTOS_WIFI_HOME_PSK@@/${OPENMENTOS_WIFI_HOME_PSK}/' \
		    "${WORKDIR}/home-wifi.nmconnection.in" > "${WORKDIR}/home-wifi.nmconnection"
		install -m 0600 ${WORKDIR}/home-wifi.nmconnection ${D}${sysconfdir}/NetworkManager/system-connections
	fi

	# Install "hotspot" connection config
	if [ -n "${OPENMENTOS_WIFI_AP_SSID}" ] && [ -n "${OPENMENTOS_WIFI_AP_PSK}" ]; then
		sed -e 's/@@OPENMENTOS_WIFI_AP_SSID@@/${OPENMENTOS_WIFI_AP_SSID}/' \
		    -e 's/@@OPENMENTOS_WIFI_AP_PSK@@/${OPENMENTOS_WIFI_AP_PSK}/' \
		    "${WORKDIR}/hotspot.nmconnection.in" > "${WORKDIR}/hotspot.nmconnection"
		install -m 0600 ${WORKDIR}/hotspot.nmconnection ${D}${sysconfdir}/NetworkManager/system-connections
	fi
}
