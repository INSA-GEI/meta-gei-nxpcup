# Fix compatibility with modern host GNU tar (e.g. Ubuntu 24.04 / tar 1.35)
# pseudo 1.9.0 does not correctly handle the newer *at()/openat2 syscalls.

SRCREV = "6c0d8c6b81ca7c2ef2b5a9a996605e1a51814442"
PV = "1.9.4+git"

# Remove patches from the older pseudo recipe which are not
# compatible with pseudo 1.9.4.
SRC_URI:remove = " \
    file://0001-configure-Prune-PIE-flags.patch \
    file://glibc238.patch \
    file://older-glibc-symbols.patch \
"
