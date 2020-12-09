HOME_SRCREV = "91a02f35e6bbbfe6b586aee14bfb0136c8959fd2"
SRC_URI += "\
    git://gitlab.com/shukron/home.git;protocol=https;rev=${HOME_SRCREV}\
"
LIC_FILES_CHKSUM += "\
    file://git/LICENSE;md5=d88e9e08385d2a17052dac348bde4bc1\
"

do_install_append () {
    install -m 0755 ${WORKDIR}/git/.bashrc ${D}${sysconfdir}/skel/.bashrc
    install -m 0755 ${WORKDIR}/git/.bash_aliases ${D}${sysconfdir}/skel/.bash_aliases
    install -m 0755 ${WORKDIR}/git/.inputrc ${D}${sysconfdir}/skel/.inputrc
}
