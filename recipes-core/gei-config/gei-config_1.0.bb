SUMMARY = "Configuration spécifique GEI (point d'accès WiFi, fichiers /root)"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = " \
    file://moal.conf \
    file://moal-load.conf \
    file://hostapd.conf \
    file://udhcpd.conf \
    file://wifi-ap.service \
"

S = "${UNPACKDIR}"

inherit allarch systemd

SYSTEMD_SERVICE:${PN} = "wifi-ap.service"
SYSTEMD_AUTO_ENABLE:${PN} = "enable"

RDEPENDS:${PN} += "hostapd busybox iproute2 wireless-regdb-static"

do_install() {
    install -d ${D}${sysconfdir}/modprobe.d
    install -m 0644 ${UNPACKDIR}/moal.conf ${D}${sysconfdir}/modprobe.d/wifi.conf

    install -d ${D}${sysconfdir}/modules-load.d
    install -m 0644 ${UNPACKDIR}/moal-load.conf ${D}${sysconfdir}/modules-load.d/moal.conf

    install -d ${D}${sysconfdir}/gei
    install -m 0600 ${UNPACKDIR}/hostapd.conf ${D}${sysconfdir}/gei/hostapd-ap.conf
    install -m 0644 ${UNPACKDIR}/udhcpd.conf ${D}${sysconfdir}/gei/udhcpd-ap.conf

    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${UNPACKDIR}/wifi-ap.service ${D}${systemd_system_unitdir}/

#    install -d ${D}${ROOT_HOME}
#    install -m 0644 ${UNPACKDIR}/bashrc-extra ${D}${ROOT_HOME}/.bashrc_extra
}

FILES:${PN} += "${ROOT_HOME} ${sysconfdir} ${systemd_system_unitdir}"
