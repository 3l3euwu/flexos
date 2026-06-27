#!/bin/bash
# FlexOS automated live setup

# Services
systemctl enable lightdm.service 2>/dev/null || true
systemctl enable NetworkManager.service 2>/dev/null || true
systemctl start lightdm.service 2>/dev/null || true
systemctl start NetworkManager.service 2>/dev/null || true

# Créer l'utilisateur live
if ! id "liveuser" &>/dev/null; then
    useradd -m -G wheel,power,storage,audio,video,network,input -s /bin/bash liveuser 2>/dev/null
    echo "liveuser:liveuser" | chpasswd 2>/dev/null
fi

# Copier les configs skel pour liveuser
if [ -d /home/liveuser ]; then
    cp -rn /etc/skel/. /home/liveuser/ 2>/dev/null || true
    chown -R liveuser:liveuser /home/liveuser/ 2>/dev/null || true
fi

xdg-user-dirs-update 2>/dev/null || true

# Thème XFCE
if command -v xfconf-query &> /dev/null; then
    su -c "xfconf-query -c xsettings -p /Net/ThemeName -s 'FlexOS' &>/dev/null" liveuser 2>/dev/null || true
    su -c "xfconf-query -c xsettings -p /Net/IconThemeName -s 'Papirus' &>/dev/null" liveuser 2>/dev/null || true
fi

# Desktop icon for installer
if [ -d /home/liveuser/Desktop ]; then
    cp /usr/share/applications/install-flexos.desktop /home/liveuser/Desktop/ 2>/dev/null || true
    chmod +x /home/liveuser/Desktop/install-flexos.desktop 2>/dev/null || true
    chown liveuser:liveuser /home/liveuser/Desktop/install-flexos.desktop 2>/dev/null || true
fi

echo ""
echo "  ╔══════════════════════════════════════╗"
echo "  ║     Bienvenue sur FlexOS Linux !     ║"
echo "  ║  Double-clique sur Installer pour    ║"
echo "  ║  installer FlexOS sur le disque dur  ║"
echo "  ╚══════════════════════════════════════╝"
echo ""
