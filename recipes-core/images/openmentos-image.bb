# Base this image on core-image-base
require recipes-core/images/core-image-base.bb

IMAGE_INSTALL_append = " \
	openmentos-user \
	sudo \
"

# Permissions
IMAGE_INSTALL_append = " \
	udev-rules \
"

# Other useful features
IMAGE_FEATURES += "nfs-server"

IMAGE_INSTALL_append = " \
	rsync \
	samba \
	ntfs-3g-ntfsprogs \
	fuse-exfat \
"

# Configure timezone
IMAGE_INSTALL_append = " \
	tzdata-europe \
	tzdata \
"

# Generate "rpi-sdimg" image format for rpi machines
IMAGE_FSTYPES_rpi += "rpi-sdimg"

# Enable splash screen
IMAGE_FEATURES += "splash"

# Add ssh
IMAGE_FEATURES += "ssh-server-openssh"

# Add mount.nfs
IMAGE_INSTALL_append = " nfs-utils"

# Networking
IMAGE_INSTALL_append = " \
	networkmanager \
	networkmanager-bash-completion \
	networkmanager-nmtui \
	tcpdump \
"

# Install kodi
IMAGE_INSTALL_append = " \
	kodi \
	libavcodec \
	libavfilter \
	libavformat \
	libavutil \
	libswscale \
	libswresample \
"
