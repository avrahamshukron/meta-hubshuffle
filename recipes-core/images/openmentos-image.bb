# Base this image on core-image-base
include recipes-core/images/core-image-base.bb

# Only allow for machines which start with "rpi"
COMPATIBLE_MACHINE = "^rpi$"

IMAGE_INSTALL += "\
openmentos-user \
sudo \
"

# Permissions
IMAGE_INSTALL += "\
udev-rules \
"

# Other useful features
IMAGE_FEATURES += "\
nfs-server \
"

IMAGE_INSTALL += "\
rsync \
samba \
ntfs-3g-ntfsprogs \
fuse-exfat \
"

# Configure timezone
IMAGE_INSTALL += "tzdata-europe tzdata"

# Only produce the "rpi-sdimg" image format
IMAGE_FSTYPES = "rpi-sdimg"
# Remove old builds
RM_OLD_IMAGE = "1"

# Customize the splash screen or disable
SPLASH = "psplash-raspberrypi"
IMAGE_FEATURES += "splash"

# Add ssh
IMAGE_FEATURES += " ssh-server-dropbear"

# Add support for wifi and bluetooth
IMAGE_INSTALL += "linux-firmware-bcm43430"

# Add mount.nfs
IMAGE_INSTALL += "nfs-utils"

# Add Network Manager
IMAGE_INSTALL += "\
networkmanager \
networkmanager-bash-completion \
networkmanager-nmtui"

# Install kodi
IMAGE_INSTALL += "kodi \
libavcodec \
libavfilter \
libavformat \
libavutil \
libswscale \
libswresample \
"

ENABLE_BINARY_LOCALE_GENERATION = "1"
