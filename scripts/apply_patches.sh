#!/bin/bash

# General patches
echo "Copying General patches..."
cp -f ${GITHUB_WORKSPACE}/patch/config/* config/kernel/
cp -f ${GITHUB_WORKSPACE}/patch/boards/* config/boards/
if [[ "${RELEASE}" =~ ^(bookworm|trixie)$ ]]; then
  rsync -av "${GITHUB_WORKSPACE}/patch/sbin/" packages/bsp/common/usr/sbin/
else
  rsync -av --exclude='install-pve' "${GITHUB_WORKSPACE}/patch/sbin/" packages/bsp/common/usr/sbin/
fi

echo "Patches applied successfully."
