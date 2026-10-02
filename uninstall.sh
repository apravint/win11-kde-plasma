#!/usr/bin/env bash
# ==============================================================================
# Windows 11 Transformation Suite - Uninstaller & Restorer
# https://github.com/apravint/win11-kde-plasma
# ==============================================================================
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}======================================================${NC}"
echo -e "${RED}  Windows 11 KDE Plasma - Uninstallation & Restore${NC}"
echo -e "${YELLOW}======================================================${NC}"

LATEST_BACKUP=$(ls -td "$HOME/.config"/plasma-backup-* 2>/dev/null | head -n 1 || true)

if [ -z "$LATEST_BACKUP" ]; then
    echo -e "${RED}No automatic backup directory found in ~/.config/plasma-backup-*${NC}"
    echo "Resetting to default Breeze theme instead..."
    plasma-apply-lookandfeel -a org.kde.breeze.desktop || true
else
    echo "Found backup: $LATEST_BACKUP"
    read -p "Restore this backup? (y/N): " -r CONFIRM
    if [[ "$CONFIRM" =~ ^[Yy]$ ]]; then
        cp -r "$LATEST_BACKUP/"* "$HOME/.config/"
        echo -e "${GREEN}Backup restored successfully!${NC}"
    fi
fi

# Clean installed themes
rm -rf "$HOME/.local/share/aurorae/themes/Win11OS-dark"
rm -rf "$HOME/.local/share/plasma/desktoptheme/Win11OS-dark"

echo -e "\n${GREEN}✔ Finished! Please log out and back in to apply original desktop.${NC}"
