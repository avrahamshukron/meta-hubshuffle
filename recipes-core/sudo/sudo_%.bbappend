do_install_append () {
  # Allow sudo for mentos user
  echo "mentos ALL=(ALL) ALL" > ${D}${sysconfdir}/sudoers.d/mentos
}

FILES_${PN} += " \
  ${sysconfdir}/sudoers.d/mentos \
"
