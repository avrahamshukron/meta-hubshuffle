do_install_append_openmentos () {
	# Allow sudo for mentos user
	echo "mentos ALL=(ALL) ALL" > ${D}${sysconfdir}/sudoers.d/mentos
}

FILES_${PN}_append_openmentos = " \
	${sysconfdir}/sudoers.d/mentos \
"
