DESCRIPTION = "Enable IMX219 Camera Module in linux-imx for i.MX8MP"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

#SRC_URI:append = " \
#    file://imx219_linux-imx_6.12.20_2.0.0.patch\
#    file://imx95-19x19-evk-imx219.dtso \
#    file://imx219.c \
#"

SRC_URI:append = " \
    file://imx219_linux-imx.patch\
    file://imx8mp-evk-imx219.dts \
"

# Exécuté avant l'application des patchs de SRC_URI,
# comme dans l'ordre d'origine (copie du driver, puis patch)
do_patch:prepend() {
    cp ${UNPACKDIR}/imx8mp-evk-imx219.dts ${S}/arch/arm64/boot/dts/freescale/
#    cp ${UNPACKDIR}/imx219.c ${S}/drivers/media/i2c/imx219.c
}

#---------------#

#SRC_IMX219 = "git://github.com/nxp-imx-support/imx-camera-sw-pack-source.git;protocol=https"
#SRC_BRANCH = "LF6.12.20_2.0.0"

#SRC_URI += " \
#        ${SRC_IMX219};branch=${SRC_BRANCH};destsuffix=src_imx219;fsl-eula=true;name=imx219;subpath=imx95-camera-sw-pack-imx219\
#"
#SRC_URI:append = "${SRC_IMX219};branch=${SRC_BRANCH};destsuffix=src_imx219;fsl-eula=true;name=imx219;subpath=imx95-camera-sw-pack-imx219"

#SRCREV_FORMAT = "imx219"
#SRCREV_imx219 = "b46692786eda78061e5d28fb4f4703af1ea8af90"

#S_IMX219 = "${UNPACKDIR}/src_imx219/linux-imx"

#PATCHTOOL = "git"
#do_patch:append() {
#      
#	cp ${S_IMX219}/imx95-19x19-evk-imx219.dtso ${S}/arch/arm64/boot/dts/freescale/
#	cp ${S_IMX219}/imx219.c ${S}/drivers/media/i2c/imx219.c
#        cp ${S_IMX219}/imx219_linux-imx_6.12.20_2.0.0.patch ${S}/
#        cd ${S}
#        git apply imx219_linux-imx_6.12.20_2.0.0.patch
#}
