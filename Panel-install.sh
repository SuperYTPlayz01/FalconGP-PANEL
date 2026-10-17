#!/bin/bash

set -e

VERSION="2.0.0"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'
WHITE='\033[1;37m'
RESET='\033[0m'

V1_URL="https://github.com/SuperYTPlayz01/FalconGP-PANEL/raw/refs/heads/main/FalconGPV1.zip"
V2_URL="https://github.com/SuperYTPlayz01/FalconGP-PANEL/raw/refs/heads/main/FalconGPV2.zip"

# ───────────────────────────────────────────────────────────────
# Root Check
# ───────────────────────────────────────────────────────────────

if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}✖ Please run this installer as root.${RESET}"
    echo
    echo "Example:"
    echo "sudo bash Panel-install.sh"
    exit 1
fi

# ───────────────────────────────────────────────────────────────
# FalconGP Header
# ───────────────────────────────────────────────────────────────

clear

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

echo -e "${WHITE}              FalconGP Panel Installer${RESET}"
echo -e "${CYAN}                    Version ${VERSION}${RESET}"

echo
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo

echo -e "${WHITE}[1]${RESET} FalconGP V1"
echo -e "${WHITE}[2]${RESET} FalconGP V2"
echo -e "${WHITE}[3]${RESET} Exit"

echo
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo

read -rp "$(echo -e "${CYAN}Select an option: ${RESET}")" OPTION

# ───────────────────────────────────────────────────────────────
# V1 Installer
# ───────────────────────────────────────────────────────────────

install_v1() {

    echo
    echo -e "${CYAN}📁 0. Making FalconGPV1 folder...${RESET}"

    mkdir -p FalconGPV1
    cd FalconGPV1

    echo -e "${GREEN}✔ Folder created.${RESET}"

    echo
    echo -e "${CYAN}📦 1. Downloading FalconGP V1...${RESET}"

    wget -O FalconGPV1.zip "$V1_URL"

    echo -e "${GREEN}✔ FalconGP V1 downloaded.${RESET}"

    echo
    echo -e "${CYAN}🤐 3. Extracting FalconGP V1...${RESET}"

    unzip -o FalconGPV1.zip

    echo -e "${GREEN}✔ Extraction completed.${RESET}"

    echo
    echo -e "${CYAN}🚪 4. Entering FalconGPV1 folder...${RESET}"

    if [ -d "FalconGPV1" ]; then
        cd FalconGPV1
    fi

    echo -e "${GREEN}✔ Folder ready.${RESET}"

    echo
    echo -e "${CYAN}📥 5. Installing dependencies...${RESET}"

    npm install --production

    echo -e "${GREEN}✔ Dependencies installed.${RESET}"

    echo
    echo -e "${CYAN}▶️ 6. Starting FalconGP...${RESET}"
    echo
    echo -e "${YELLOW}Run manually if required:${RESET}"
    echo "PORT=5067 npm start"

    echo
    echo -e "${CYAN}🚀 7. Starting with PM2...${RESET}"

    echo
    echo -e "${CYAN}📥 Installing PM2...${RESET}"

    npm install -g pm2

    echo
    echo -e "${CYAN}▶️ Starting Panel...${RESET}"

    PORT=5067 pm2 start app.js --name FalconGP

    echo
    echo -e "${CYAN}💾 Saving Process...${RESET}"

    pm2 save

    echo
    echo -e "${CYAN}⚙️ Enabling Startup...${RESET}"

    pm2 startup || true

    echo
    echo -e "${CYAN}📊 Checking Status...${RESET}"

    pm2 list

    echo
    echo -e "${CYAN}📜 View Logs:${RESET}"

    echo "pm2 logs FalconGP"

    echo
    echo -e "${CYAN}🔄 Restart Panel:${RESET}"

    echo "pm2 restart FalconGP"

    echo
    echo -e "${CYAN}🛑 Stop Panel:${RESET}"

    echo "pm2 stop FalconGP"

    echo
    echo -e "${GREEN}✔ FalconGP V1 installation completed!${RESET}"
}

# ───────────────────────────────────────────────────────────────
# V2 Installer
# ───────────────────────────────────────────────────────────────

install_v2() {

    echo
    echo -e "${CYAN}📁 0. Making FalconGPV2 folder...${RESET}"

    mkdir -p FalconGPV2
    cd FalconGPV2

    echo -e "${GREEN}✔ Folder created.${RESET}"

    echo
    echo -e "${CYAN}📂 0.5 Entering FalconGPV2 folder...${RESET}"

    pwd

    echo
    echo -e "${CYAN}📦 1. Downloading FalconGP V2...${RESET}"

    wget -O FalconGPV2.zip "$V2_URL"

    echo -e "${GREEN}✔ FalconGP V2 downloaded.${RESET}"

    echo
    echo -e "${CYAN}🤐 3. Extracting FalconGP V2...${RESET}"

    unzip -o FalconGPV2.zip

    echo -e "${GREEN}✔ Extraction completed.${RESET}"

    echo
    echo -e "${CYAN}📥 5. Installing dependencies...${RESET}"

    npm install --production

    echo -e "${GREEN}✔ Dependencies installed.${RESET}"

    echo
    echo -e "${CYAN}🐳 6. Checking Docker...${RESET}"

    docker --version

    echo

    if docker info >/dev/null 2>&1; then
        echo -e "${GREEN}✔ Docker is running and accessible.${RESET}"
    else
        echo -e "${YELLOW}⚠ Docker daemon is not accessible.${RESET}"
        echo -e "${YELLOW}Make sure Docker is running before using Docker-based servers.${RESET}"
    fi

    echo
    echo -e "${CYAN}▶️ 7. Starting FalconGP...${RESET}"

    echo
    echo -e "${YELLOW}Manual start command:${RESET}"
    echo "PORT=5067 npm start"

    echo
    echo -e "${CYAN}🚀 8. Starting with PM2...${RESET}"

    echo
    echo -e "${CYAN}📥 Installing PM2...${RESET}"

    npm install -g pm2

    echo
    echo -e "${CYAN}▶️ Starting Panel...${RESET}"

    PORT=5067 pm2 start app.js --name FalconGP

    echo
    echo -e "${CYAN}💾 Saving Process...${RESET}"

    pm2 save

    echo
    echo -e "${CYAN}⚙️ Enabling Startup...${RESET}"

    pm2 startup || true

    echo
    echo -e "${CYAN}📊 Checking Status...${RESET}"

    pm2 list

    echo
    echo -e "${CYAN}📜 View Logs:${RESET}"

    echo "pm2 logs FalconGP"

    echo
    echo -e "${CYAN}🔄 Restart Panel:${RESET}"

    echo "pm2 restart FalconGP"

    echo
    echo -e "${CYAN}🛑 Stop Panel:${RESET}"

    echo "pm2 stop FalconGP"

    echo
    echo -e "${GREEN}✔ FalconGP V2 installation completed!${RESET}"
}

# ───────────────────────────────────────────────────────────────
# Option Handler
# ───────────────────────────────────────────────────────────────

case "$OPTION" in

    1)
        install_v1
        ;;

    2)
        install_v2
        ;;

    3)
        echo
        echo -e "${YELLOW}FalconGP Panel Installer closed.${RESET}"
        exit 0
        ;;

    *)
        echo
        echo -e "${RED}✖ Invalid option.${RESET}"
        exit 1
        ;;

esac

echo
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo
echo -e "${WHITE}🦅 FalconGP — Panel Installation Complete${RESET}"
echo -e "${CYAN}AnosCloud™ — Powered By FalconGP${RESET}"
echo
