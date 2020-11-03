# Most of the times the FILESEXTRAPATHS variable is used.
# Since kodi recipe use FILESPATH it prevents us to prioritize our files.
FILESPATH_prepend_openmentos := "${THISDIR}/files:"
EXTRA_OECMAKE += "\
    -DAPP_RENDER_SYSTEM=gles \
"