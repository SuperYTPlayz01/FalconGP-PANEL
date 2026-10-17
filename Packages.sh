#!/bin/bash

# ═══════════════════════════════════════════════════════════════
# 🦅 FalconGP V2 — Required Packages Installer
# ═══════════════════════════════════════════════════════════════

set -e

VERSION="2.0.0"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'
WHITE='\033[1;37m'
RESET='\033[0m'

# ───────────────────────────────────────────────────────────────
# Root Check
# ───────────────────────────────────────────────────────────────

if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}✖ Please run this installer as root.${RESET}"
    echo
    echo "Example:"
    echo "sudo bash Packages.sh"
    exit 1
fi

# ───────────────────────────────────────────────────────────────
# Header
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

echo -e "${WHITE}          FalconGP V2 — Package Installer${RESET}"
echo -e "${CYAN}                    Version ${VERSION}${RESET}"

echo
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo

# ───────────────────────────────────────────────────────────────
# Basic VPS Packages
# ───────────────────────────────────────────────────────────────

echo -e "${CYAN}🧰 1. Installing Basic VPS Packages...${RESET}"

apt update
apt upgrade -y

apt install -y \
    curl \
    wget \
    git \
    unzip \
    zip \
    tar \
    nano \
    ca-certificates \
    gnupg \
    software-properties-common \
    apt-transport-https \
    screen \
    rsync \
    gzip \
    file \
    lsof

echo -e "${GREEN}✔ Basic packages installed.${RESET}"
echo

# ───────────────────────────────────────────────────────────────
# Node.js 20 + NPM
# ───────────────────────────────────────────────────────────────

echo -e "${CYAN}🟢 2. Installing Node.js 20 & NPM...${RESET}"

curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt install -y nodejs

echo
echo -e "${WHITE}Node.js:${RESET} $(node -v)"
echo -e "${WHITE}NPM:${RESET} $(npm -v)"

echo -e "${GREEN}✔ Node.js and NPM installed.${RESET}"
echo

# ───────────────────────────────────────────────────────────────
# Docker Engine
# ───────────────────────────────────────────────────────────────

echo -e "${CYAN}🐳 3. Installing Docker Engine...${RESET}"

apt install -y docker.io

systemctl enable --now docker

echo
echo -e "${WHITE}Docker:${RESET}"
docker --version

echo
echo -e "${CYAN}➜ Checking Docker daemon...${RESET}"

if systemctl is-active --quiet docker; then
    echo -e "${GREEN}✔ Docker daemon is running.${RESET}"
else
    echo -e "${RED}✖ Docker daemon is not running.${RESET}"
fi

echo

# ───────────────────────────────────────────────────────────────
# Minecraft Java Runtime
# ───────────────────────────────────────────────────────────────

echo -e "${CYAN}☕ 4. Installing Minecraft Java Runtimes...${RESET}"

echo -e "${YELLOW}➜ Installing Java 8...${RESET}"
apt install -y openjdk-8-jre-headless

echo -e "${YELLOW}➜ Installing Java 17...${RESET}"
apt install -y openjdk-17-jre-headless

echo -e "${YELLOW}➜ Installing Java 21...${RESET}"
apt install -y openjdk-21-jre-headless

echo -e "${YELLOW}➜ Installing Java 25...${RESET}"
apt install -y openjdk-25-jre-headless

echo
echo -e "${GREEN}✔ Java runtimes installed.${RESET}"

echo
java -version

echo
echo -e "${YELLOW}Available Java installations:${RESET}"

update-alternatives --list java || true

echo

# ───────────────────────────────────────────────────────────────
# Networking Packages
# ───────────────────────────────────────────────────────────────

echo -e "${CYAN}🌐 5. Installing Networking Packages...${RESET}"

apt install -y \
    iproute2 \
    iputils-ping \
    dnsutils \
    net-tools \
    lsof

echo -e "${GREEN}✔ Networking packages installed.${RESET}"
echo

# ───────────────────────────────────────────────────────────────
# File & Archive Tools
# ───────────────────────────────────────────────────────────────

echo -e "${CYAN}📁 6. Installing File & Archive Tools...${RESET}"

apt install -y \
    file \
    rsync \
    gzip \
    tar \
    zip \
    unzip

echo -e "${GREEN}✔ File and archive tools installed.${RESET}"
echo

# ───────────────────────────────────────────────────────────────
# UFW Security
# ───────────────────────────────────────────────────────────────

echo -e "${CYAN}🔐 7. Installing UFW...${RESET}"

apt install -y ufw

echo
echo -e "${WHITE}UFW Status:${RESET}"
ufw status || true

echo
echo -e "${YELLOW}⚠ UFW has NOT been enabled automatically.${RESET}"
echo -e "${YELLOW}  Configure SSH and required FalconGP/Minecraft ports first.${RESET}"
echo

# ───────────────────────────────────────────────────────────────
# PM2
# ───────────────────────────────────────────────────────────────

echo -e "${CYAN}⚙️ 8. Installing PM2...${RESET}"

npm install -g pm2

echo
echo -e "${WHITE}PM2:${RESET} $(pm2 -v)"

echo -e "${GREEN}✔ PM2 installed.${RESET}"
echo

# ───────────────────────────────────────────────────────────────
# Bedrock Runtime Information
# ───────────────────────────────────────────────────────────────

echo -e "${CYAN}🌍 9. Bedrock Runtime${RESET}"

echo -e "${WHITE}Native Bedrock servers do not require Java.${RESET}"
echo -e "${WHITE}FalconGP can use its legacy local runtime for Bedrock,${RESET}"
echo -e "${WHITE}proxy servers and other unsupported software.${RESET}"

echo

# ───────────────────────────────────────────────────────────────
# AI Configuration Information
# ───────────────────────────────────────────────────────────────

echo -e "${CYAN}🤖 10. AI Configuration${RESET}"

echo -e "${WHITE}FalconGP V2 includes AI-powered features.${RESET}"
echo -e "${WHITE}Configure AI providers/API keys through FalconGP's${RESET}"
echo -e "${WHITE}configuration system when required.${RESET}"

echo -e "${YELLOW}⚠ Never hard-code API keys into source code.${RESET}"

echo

# ───────────────────────────────────────────────────────────────
# Final System Check
# ───────────────────────────────────────────────────────────────

echo -e "${CYAN}✅ 11. Final System Check${RESET}"

echo
echo -e "${WHITE}Node.js:${RESET}"
node -v

echo
echo -e "${WHITE}NPM:${RESET}"
npm -v

echo
echo -e "${WHITE}Docker:${RESET}"
docker --version

echo
echo -e "${WHITE}Java:${RESET}"
java -version

echo
echo -e "${WHITE}Git:${RESET}"
git --version

echo
echo -e "${WHITE}cURL:${RESET}"
curl --version | head -n 1

echo
echo -e "${WHITE}Wget:${RESET}"
wget --version | head -n 1

echo
echo -e "${WHITE}Docker Daemon:${RESET}"

if docker info >/dev/null 2>&1; then
    echo -e "${GREEN}✔ Docker is working correctly.${RESET}"
else
    echo -e "${YELLOW}⚠ Docker daemon check failed.${RESET}"
    echo -e "${YELLOW}  Make sure Docker is running and accessible.${RESET}"
fi

echo
echo -e "${WHITE}Available Java Runtimes:${RESET}"

update-alternatives --list java || true

echo
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"

echo
echo -e "${GREEN}✔ FalconGP V2 package installation completed!${RESET}"

echo
echo -e "${WHITE}🦅 FalconGP V2 — Built Bigger. Built Smarter.${RESET}"
echo -e "${CYAN}AnosCloud™ — Powered By FalconGP${RESET}"

echo
