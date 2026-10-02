#!/usr/bin/env bash
# ==============================================================================
# Windows 11 Transformation Suite for KDE Plasma 6
# https://github.com/apravint/win11-kde-plasma
# ==============================================================================
set -e

REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}======================================================${NC}"
echo -e "${GREEN}  Windows 11 Transformation Suite for KDE Plasma 6${NC}"
echo -e "${BLUE}======================================================${NC}"

echo -e "\n${YELLOW}[1/5] Backing up current KDE Plasma configuration...${NC}"
BACKUP_DIR="$HOME/.config/plasma-backup-$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

for file in kdeglobals kwinrc plasmarc plasma-org.kde.plasma.desktop-appletsrc; do
    if [ -f "$HOME/.config/$file" ]; then
        cp "$HOME/.config/$file" "$BACKUP_DIR/"
    fi
done
echo "Backup saved to: $BACKUP_DIR"

echo -e "\n${YELLOW}[2/5] Installing Segoe UI fonts...${NC}"
mkdir -p "$HOME/.local/share/fonts/SegoeUI"
cp "$REPO_DIR/fonts/"*.ttf "$HOME/.local/share/fonts/SegoeUI/"
fc-cache -f "$HOME/.local/share/fonts/SegoeUI" >/dev/null 2>&1 || true

echo -e "\n${YELLOW}[3/5] Installing Windows 11 themes & window decorations...${NC}"
mkdir -p "$HOME/.local/share/aurorae/themes" "$HOME/.local/share/plasma/desktoptheme"
cp -r "$REPO_DIR/themes/aurorae/"* "$HOME/.local/share/aurorae/themes/"
cp -r "$REPO_DIR/themes/desktoptheme/"* "$HOME/.local/share/plasma/desktoptheme/"

echo -e "\n${YELLOW}[4/5] Installing Windows 11 wallpapers & icons...${NC}"
mkdir -p "$HOME/Pictures/Wallpapers" "$HOME/.local/share/icons"
cp "$REPO_DIR/assets/win11_bloom_dark.jpg" "$HOME/Pictures/Wallpapers/"
cp "$REPO_DIR/assets/windows11_start_logo.svg" "$HOME/.local/share/icons/"

echo -e "\n${YELLOW}[5/5] Applying Windows 11 Plasma configurations...${NC}"
mkdir -p "$HOME/.config"
cp "$REPO_DIR/config/kdeglobals" "$HOME/.config/"
cp "$REPO_DIR/config/kwinrc" "$HOME/.config/"
cp "$REPO_DIR/config/plasmarc" "$HOME/.config/"
cp "$REPO_DIR/config/plasma-org.kde.plasma.desktop-appletsrc" "$HOME/.config/"

# Reload Plasma & KWin if running in active Plasma session
if pgrep -x "plasmashell" >/dev/null 2>&1; then
    echo "Refreshing running Plasma shell..."
    kquitapp6 plasmashell 2>/dev/null || pkill plasmashell 2>/dev/null || true
    kwin_wayland --replace 2>/dev/null || true
    kstart plasmashell >/dev/null 2>&1 &
fi

echo -e "\n${BLUE}======================================================${NC}"
echo -e "${GREEN}🎉 Windows 11 Theme Applied Successfully!${NC}"
echo -e "${BLUE}======================================================${NC}"
echo -e "Features active:"
echo -e "  • Centered Windows 11 taskbar with glowing active indicators"
echo -e "  • Segoe UI Variable typography"
echo -e "  • Windows 11 caption buttons (minimize, maximize, close)"
echo -e "  • Dark Bloom 4K wallpaper"
echo -e "  • Show Desktop button at bottom-left corner"
echo -e "\nIf taskbar positioning needs a reload, simply log out and back in."
