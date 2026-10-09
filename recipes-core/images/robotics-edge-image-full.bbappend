# Robotics Edge ROS2 Full image

# require recipes-nxp/images/nxp-image-real-time-edge.bb

# inherit ros_distro_${ROS_DISTRO}
# inherit ${ROS_DISTRO_TYPE}_image

# IMAGE_INSTALL:append = " \
#    packagegroup-robotics-arm-demo \
#    packagegroup-ros-base \
#    packagegroup-ros-base-demo \
#    packagegroup-ros-dev \
#    packagegroup-ros-gstreamer \
#    packagegroup-robotics-vslam-demo \
#"

# export IMAGE_BASENAME = "robotics-edge-image-full"

# Conflit de paquets dans rootfs
IMAGE_INSTALL:remove = "mdns mdns-libnss-mdns"
PACKAGE_EXCLUDE:append = " mdns-libnss-mdns"
#IMAGE_INSTALL:remove = "iptables"

# Paquets manquants
IMAGE_INSTALL:append = "git dtc nmap dnsmasq"
