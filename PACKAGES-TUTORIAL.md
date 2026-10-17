<p align="center">
  <img src="https://i.postimg.cc/dQBhBwQg/file-00000000923881fdb18fb3005102c2a6.png" alt="FalconGP V2 Banner" width="100%">
</p>

<h1 align="center">🦅 𝐅𝐚𝐥𝐜𝐨𝐧𝐆𝐏 𝐕𝟐 — 𝐑𝐞𝐪𝐮𝐢𝐫𝐞𝐝 𝐏𝐚𝐜𝐤𝐚𝐠𝐞𝐬</h1>

<p align="center">
  <strong>𝐄𝐬𝐬𝐞𝐧𝐭𝐢𝐚𝐥 𝐏𝐚𝐜𝐤𝐚𝐠𝐞𝐬 𝐟𝐨𝐫 𝐅𝐚𝐥𝐜𝐨𝐧𝐆𝐏 𝐕𝟐 𝐚𝐧𝐝 𝐌𝐢𝐧𝐞𝐜𝐫𝐚𝐟𝐭 𝐒𝐞𝐫𝐯𝐞𝐫𝐬</strong>
</p>

<p align="center">
  <a href="https://falconxgp.indevs.in">
    <img src="https://img.shields.io/badge/𝐎𝐟𝐟𝐢𝐜𝐢𝐚𝐥%20𝐒𝐢𝐭𝐞-6f42c1?style=for-the-badge" alt="Official Site">
  </a>
  <a href="https://youtube.com/@superytplayz01">
    <img src="https://img.shields.io/badge/𝐘𝐨𝐮𝐓𝐮𝐛𝐞-red?style=for-the-badge&logo=youtube&logoColor=white" alt="YouTube">
  </a>
  <a href="https://discord.gg/kcW4f2c8CV">
    <img src="https://img.shields.io/badge/𝐃𝐢𝐬𝐜𝐨𝐫𝐝-5865F2?style=for-the-badge&logo=discord&logoColor=white" alt="Discord">
  </a>
</p>

> [!NOTE]
> FalconGP V2 uses Docker as the default runtime for compatible Minecraft servers.
> Java is only required on the host when using the local Java runtime.
> Native Bedrock servers require a Linux host.

---

## 🧰 𝟏. 𝐁𝐚𝐬𝐢𝐜 𝐕𝐏𝐒 𝐏𝐚𝐜𝐤𝐚𝐠𝐞𝐬

apt update && apt upgrade -y

bash apt install -y curl wget git unzip zip tar nano ca-certificates gnupg software-properties-common apt-transport-https screen rsync gzip file lsof

🟢 𝟐. 𝐍𝐨𝐝𝐞.𝐣𝐬 𝟐𝟎 & 𝐍𝐏𝐌

FalconGP V2 requires Node.js 20 or newer 24.

curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt install -y nodejs

Check Node.js

node -v
npm -v

🐳 𝟑. 𝐃𝐨𝐜𝐤𝐞𝐫 𝐄𝐧𝐠𝐢𝐧𝐞

Docker is the default runtime for new compatible FalconGP V2 servers.

apt install -y docker.io

Enable Docker:

systemctl enable --now docker Or Open a Screen Terminal and type "dockerd" You're Done If It Says Succesfull

Check Docker:

docker --version

docker info

Test Docker:

docker run --rm hello-world

[!IMPORTANT] The FalconGP process must have permission to access the Docker daemon.

☕ 𝟒. 𝐌𝐢𝐧𝐞𝐜𝐫𝐚𝐟𝐭 𝐉𝐚𝐯𝐚 𝐑𝐮𝐧𝐭𝐢𝐦𝐞

Java is required when using FalconGP's local Java runtime.
Java 8
For older Minecraft versions and legacy servers.

apt install -y openjdk-8-jre-headless
Java 17

Recommended for Minecraft 1.18 – 1.20.4.

apt install -y openjdk-17-jre-headless
Java 21

Recommended for Minecraft 1.20.5 – 1.21.x.

apt install -y openjdk-21-jre-headless
Java 25
For Minecraft versions requiring Java 25.

apt install -y openjdk-25-jre-headless

Check Java

java -version

Select Default Java

update-alternatives --config java

🌐 𝟓. 𝐍𝐞𝐭𝐰𝐨𝐫𝐤𝐢𝐧𝐠 𝐏𝐚𝐜𝐤𝐚𝐠𝐞𝐬

apt install -y iproute2 iputils-ping dnsutils net-tools lsof

📁 𝟔. 𝐅𝐢𝐥𝐞 & 𝐀𝐫𝐜𝐡𝐢𝐯𝐞 𝐓𝐨𝐨𝐥𝐬

apt install -y file rsync gzip tar zip unzip

🔐 𝟕. 𝐒𝐞𝐜𝐮𝐫𝐢𝐭𝐲

UFW is optional and should be configured according to your server's networking requirements.

apt install -y ufw

Check status:

ufw status

[!WARNING] Do not enable UFW without first allowing SSH and the required FalconGP/Minecraft ports.

⚙️ 𝟖. 𝐏𝐌𝟐 — 𝐎𝐩𝐭𝐢𝐨𝐧𝐚𝐥

PM2 can be used to keep FalconGP running in the background.

npm install -g pm2

Check:

pm2 -v

Start FalconGP:

pm2 start app.js --name FalconGP

Save the process:

pm2 save

🌍 𝟗. 𝐁𝐞𝐝𝐫𝐨𝐜𝐤 𝐑𝐮𝐧𝐭𝐢𝐦𝐞

Native Bedrock servers run directly on Linux.
No Java runtime is required for native Bedrock servers.
Bedrock, proxy servers, and other unsupported software may use FalconGP's legacy local runtime.

🤖 𝟏𝟎. 𝐎𝐩𝐭𝐢𝐨𝐧𝐚𝐥 𝐀𝐈 𝐂𝐨𝐧𝐟𝐢𝐠𝐮𝐫𝐚𝐭𝐢𝐨𝐧

FalconGP V2 includes AI-powered features.
AI providers and API keys should be configured through the FalconGP environment/configuration system when required.
Do not hard-code API keys into the source code.

✅ 𝟏𝟏. 𝐅𝐢𝐧𝐚𝐥 𝐒𝐲𝐬𝐭𝐞𝐦 𝐂𝐡𝐞𝐜𝐤

node -v

npm -v

docker --version

java -version

git --version

curl --version

wget --version

Check Docker:

docker info

Check available Java runtimes:

update-alternatives --list java

�
🦅 𝐅𝐚𝐥𝐜𝐨𝐧𝐆𝐏 𝐕𝟐 — 𝐁𝐮𝐢𝐥𝐭 𝐁𝐢𝐠𝐠𝐞𝐫. 𝐁𝐮𝐢𝐥𝐭 𝐒𝐦𝐚𝐫𝐭𝐞𝐫. 

�
𝐀𝐧𝐨𝐬𝐂𝐥𝐨𝐮𝐝™ — 𝐏𝐨𝐰𝐞𝐫𝐞𝐝 𝐁𝐲 𝐅𝐚𝐥𝐜𝐨𝐧𝐆𝐏 
