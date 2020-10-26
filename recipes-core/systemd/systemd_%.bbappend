PACKAGECONFIG_remove_openmentos = "networkd backlight"
PACKAGECONFIG_append_openmentos = " coredump"

FILESEXTRAPATHS_prepend_openmentos := "${THISDIR}/files:"

SRC_URI_append_openmentos = " \
	file://timesyncd.conf \
"

do_install_append_openmentos () {
	# Install the custom conf files on target
	install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd

	# enable timesyncd service
	install -d ${D}${sysconfdir}/systemd/system/sysinit.target.wants
	ln -sf ${systemd_unitdir}/system/systemd-timesyncd.service \
		${D}${sysconfdir}/systemd/system/sysinit.target.wants/systemd-timesyncd.service
}
