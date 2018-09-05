#!/bin/sh
#
# Flatpak Clean
# http://github.com/robloach/flatpak-clean
#
# This will uninstall all user and system Flatpak applications.
#
# Warning: USE AT OWN RISK.
#
# License: MIT

# Uninstall all Flatpak user-space applications.
APPS=$(flatpak list --user)
if [ -n "${APPS}" ]; then
	for i in $APPS ; do
		flatpak uninstall --user -y --force-remove $i || true
	done
fi

# Uninstall all Flatpak system-space applications.
APPS=$(flatpak list --system)
if [ -n "${APPS}" ]; then
	for i in $APPS; do
		flatpak uninstall --system -y --force-remove $i || true
	done
fi

# Remove the Flatpak app configurations.
rm -rf ~/.var/app
