#!/usr/bin/env bash
# FlexOS Profile - XFCE + Glassmorphism

set -euo pipefail

iso_name="flexos"
iso_label="FLEXOS_$(date +%Y%m)"
iso_publisher="FlexOS Project"
iso_application="FlexOS Linux - XFCE Glassmorphism"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux' 'uefi.grub')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M')
file_permissions=(
  ["/etc/sudoers.d/10-flexos-live"]="0:0:440"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/usr/local/bin/flexos-live-setup"]="0:0:755"
  ["/usr/local/bin/flexos-session"]="0:0:755"
)
