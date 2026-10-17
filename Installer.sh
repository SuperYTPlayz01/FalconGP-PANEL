#!/bin/bash

# ═══════════════════════════════════════════════════════════════
# 🦅 FalconGP V2 Installer
# ═══════════════════════════════════════════════════════════════

set -u

VERSION="2.0.0"

PACKAGES_URL="https://raw.githubusercontent.com/SuperYTPlayz01/FalconGP-PANEL/main/Packages.sh"
PANEL_URL="https://raw.githubusercontent.com/SuperYTPlayz01/FalconGP-PANEL/main/Panel-install.sh"

# ───────────────────────────────────────────────────────────────
# Colors
# ───────────────────────────────────────────────────────────────

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'
WHITE='\033[1;37m'
RESET='\033[0m'

# ───────────────────────────────────────────────────────────────
# Clear Screen
# ───────────────────────────────────────────────────────────────

clear

# ───────────────────────────────────────────────────────────────
# FalconGP ASCII Art
# ───────────────────────────────────────────────────────────────

echo -e "${RED}"
cat <<'EOF'
███████╗ █████╗ ██╗      ██████╗ ██████╗ ███╗   ██╗
██╔════╝██╔══██╗██║     ██╔════╝██╔═══██╗████╗  ██║
█████╗  ███████║██║     ██║     ██║   ██║██╔██╗ ██║
██╔══╝  ██╔══██║██║     ██║     ██║   ██║██║╚██╗██║
██║     ██║  ██║███████╗╚██████╗╚██████╔╝██║ ╚████║
╚═╝     ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝
EOF
echo -e "${RESET}"

echo -e "${WHITE}                 FalconGP Installer${RESET}"
echo -e "${CYAN}                    Version ${VERSION}${RESET}"

echo
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"

echo -e "${WHITE}FalconGP V2 — Major Update${RESET}"
echo

echo -e "${GREEN}New Features:${RESET}"
echo -e " ${CYAN}•${RESET} Docker Management"
echo -e " ${CYAN}•${RESET} Falcon Journey Queue"
echo -e " ${CYAN}•${RESET} AI Integration"
echo -e " ${CYAN}•${RESET} Sound System"
echo -e " ${CYAN}•${RESET} Animation Settings"
echo -e " ${CYAN}•${RESET} Advanced Server Management"
echo -e " ${CYAN}•${RESET} Advanced File & Server Tools"
echo -e " ${CYAN}•${RESET} Bug Fixes & Improvements"

echo
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"

# ───────────────────────────────────────────────────────────────
# Menu
# ───────────────────────────────────────────────────────────────

echo
echo -e "${WHITE}[1]${RESET} Install Packages"
echo -e "${WHITE}[2]${RESET} Install FalconGP Panel"
echo -e "${WHITE}[3]${RESET} Exit"
echo

echo -ne "${CYAN}Select an option: ${RESET}"
read -r OPTION

# ───────────────────────────────────────────────────────────────
# Function: Download & Execute
# ───────────────────────────────────────────────────────────────

run_script() {
    local URL="$1"
    local NAME="$2"
    local TEMP_FILE="/tmp/${NAME}"

    echo
    echo -e "${CYAN}➜ Downloading ${NAME}...${RESET}"

    if ! curl -fsSL "$URL" -o "$TEMP_FILE"; then
        echo -e "${RED}✖ Failed to download ${NAME}.${RESET}"
        rm -f "$TEMP_FILE"
        exit 1
    fi

    echo -e "${GREEN}✔ Download completed.${RESET}"

    echo -e "${CYAN}➜ Starting ${NAME}...${RESET}"
    echo

    if ! bash "$TEMP_FILE"; then
        echo
        echo -e "${RED}✖ ${NAME} exited with an error.${RESET}"
        rm -f "$TEMP_FILE"
        exit 1
    fi

    rm -f "$TEMP_FILE"

    echo
    echo -e "${GREEN}✔ ${NAME} completed successfully.${RESET}"
}

# ───────────────────────────────────────────────────────────────
# Option Handler
# ───────────────────────────────────────────────────────────────

case "$OPTION" in

    1)
        run_script "$PACKAGES_URL" "FalconGP-Packages.sh"
        ;;

    2)
        run_script "$PANEL_URL" "FalconGP-Panel-install.sh"
        ;;

    3)
        echo
        echo -e "${YELLOW}FalconGP Installer closed.${RESET}"
        exit 0
        ;;

    *)
        echo
        echo -e "${RED}✖ Invalid option.${RESET}"
        echo -e "${YELLOW}Please run the installer again and choose 1, 2, or 3.${RESET}"
        exit 1
        ;;

esac
