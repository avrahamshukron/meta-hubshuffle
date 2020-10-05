inherit useradd
USERADD_PACKAGES = "${PN}"

USERADD_PARAM_${PN} = "-G audio,input,plugdev,sudo,video,shutdown,dialout -P mentos -u 1000 -d /home/mentos -m -r -s /bin/bash mentos;"

LICENSE = "CLOSED"

EXCLUDE_FROM_WORLD = "1"

S = "${WORKDIR}"

SRC_URI = "\
file://openmentos-fix-user-permissions.sh \
file://openmentos-fix-user-permissions.service \
"

do_install () {
  install -d ${D}${bindir}
  install -m 0755 ${WORKDIR}/openmentos-fix-user-permissions.sh ${D}${bindir}/

  install -d ${D}${systemd_unitdir}/system
  install -m 0644 ${WORKDIR}/openmentos-fix-user-permissions.service ${D}/${systemd_unitdir}/system
}

inherit systemd
SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE_${PN} = "openmentos-fix-user-permissions.service"

FILES_${PN} = " \
  ${bindir}/openmentos-fix-user-permissions.sh \
  ${systemd_unitdir}/system/openmentos-fix-user-permissions.service \
"
