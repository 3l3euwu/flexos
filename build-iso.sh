#!/usr/bin/env bash
# FlexOS - Build ISO (XFCE + Glassmorphism)

set -euo pipefail

RED='\033[0;31m'; GREEN='\033[0;32m'; CYAN='\033[0;36m'; PURPLE='\033[0;35m'; NC='\033[0m'

echo -e "${PURPLE}"
echo "╔═══════════════════════════════════════════╗"
echo "║         FlexOS - ISO Builder              ║"
echo "║     XFCE + Glassmorphism Edition          ║"
echo "╚═══════════════════════════════════════════╝"
echo -e "${NC}"

if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}❌ Lance avec sudo.${NC}"; exit 1
fi

if ! command -v mkarchiso &> /dev/null; then
    echo -e "${RED}❌ Installe archiso: sudo pacman -S archiso${NC}"; exit 1
fi

echo -e "${CYAN}✅ archiso OK${NC}"

if [ -d "out" ]; then
    echo -e "${CYAN}🧹 Nettoyage...${NC}"; rm -rf out
fi

echo -e "${CYAN}🚀 Build FlexOS ISO...${NC}"
echo -e "${CYAN}⏳ ~20-30 minutes${NC}"

if mkarchiso -v "." 2>&1 | tee build.log; then
    echo -e "\n${GREEN}✅ Succès !${NC}"
    for f in out/flexos-*.iso; do
        [ -f "$f" ] && cp "$f" "../$(basename "$f")" && \
        echo -e "${GREEN}🎉 ../$(basename "$f") ($(du -h "../$(basename "$f")" | cut -f1))${NC}"
    done
    echo -e "\n  ${CYAN}dd:${NC} sudo dd if=flexos-*.iso of=/dev/sdX bs=4M status=progress && sync"
    echo -e "  ${CYAN}VM:${NC} qemu-system-x86_64 -cdrom flexos-*.iso -m 2048 -enable-kvm"
else
    echo -e "${RED}❌ Échec. Voir build.log${NC}"; exit 1
fi
