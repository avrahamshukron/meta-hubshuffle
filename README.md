This README file contains information on the contents of openmeta-mentos layer.


Dependencies
============
  * poky@dunfell
  * meta-raspberrypi@dunfell
  * meta-openembedded@dunfell
  * avrahamshukron/meta-kodi@dunfell

Configuration
============
 * Add your NetworkManager connection profiles under meta-mentos/recipes-networking/networkmanager/files/*.nmconnection and add those files to the SRC_URI variable in networkmanager_%.bbappend.
 * The root password is defined in meta-mentos/recipes-core/images/mentos-image-kodi.bb
 * The mentos user password is configured in meta-mentos/recipes-core/mentos-user/mentos-user.bb

ToDo
============
 * Permissions need to be configured to allow reboot/shutdown permissions, these options are missing from the Kodi exit menu.
 * Partitioning hasn't been configured.