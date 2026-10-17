🦅 FalconGP V2 Installation Tutorial
<p align="center">
  <img src="https://i.postimg.cc/dQBhBwQg/file-00000000923881fdb18fb3005102c2a6.png" alt="FalconGP-PANEL Banner" width="100%">
</p>

<h1 align="center">🦅 𝐅𝐚𝐥𝐜𝐨𝐧𝐆𝐏 𝐕𝟐 𝐈𝐧𝐬𝐭𝐚𝐥𝐥𝐚𝐭𝐢𝐨𝐧 𝐓𝐮𝐭𝐨𝐫𝐢𝐚𝐥</h1>

<p align="center">
  <a href="https://falconxgp.indevs.in">
    <img src="https://img.shields.io/badge/𝐎𝐟𝐟𝐢𝐜𝐢𝐚𝐥%20𝐒𝐢𝐭𝐞-6f42c1?style=for-the-badge&logo=google-chrome&logoColor=white" alt="Official Site">
  </a>
  <a href="https://youtube.com/@superytplayz01">
    <img src="https://img.shields.io/badge/𝐘𝐨𝐮𝐓𝐮𝐛𝐞-red?style=for-the-badge&logo=youtube&logoColor=white" alt="YouTube">
  </a>
  <a href="https://discord.gg/kcW4f2c8CV">
    <img src="https://img.shields.io/badge/𝐃𝐢𝐬𝐜𝐨𝐫𝐝-5865F2?style=for-the-badge&logo=discord&logoColor=white" alt="Discord">
  </a>
  <a href="https://github.com/SuperYTPlayz01/FalconGP-PANEL/blob/main/FalconGPV2.zip">
    <img src="https://img.shields.io/badge/𝐃𝐨𝐰𝐧𝐥𝐨𝐚𝐝%20𝐅𝐚𝐥𝐜𝐨𝐧𝐆𝐏%20𝐕𝟐-2ea44f?style=for-the-badge&logo=github&logoColor=white" alt="Download FalconGP V2">
  </a>
</p>

> [!IMPORTANT]
> FalconGP V2 uses Docker as the default runtime for compatible Minecraft servers.
> Make sure Docker is installed and running before using Docker-based server features.

---
📁 𝟎. 𝐌𝐚𝐤𝐞 𝐚 𝐍𝐞𝐰 𝐅𝐨𝐥𝐝𝐞𝐫

mkdir FalconGPV2

📂 𝟎.𝟓. 𝐆𝐨 𝐭𝐨 𝐭𝐡𝐞 𝐅𝐚𝐥𝐜𝐨𝐧𝐆𝐏 𝐅𝐨𝐥𝐝𝐞𝐫

cd FalconGPV2

📦 𝟏. 𝐂𝐥𝐨𝐧𝐞 𝐅𝐚𝐥𝐜𝐨𝐧𝐆𝐏

wget https://github.com/SuperYTPlayz01/FalconGP-PANEL/raw/refs/heads/main/FalconGPV2.zip

🤐 𝟑. 𝐄𝐱𝐭𝐫𝐚𝐜𝐭 𝐅𝐚𝐥𝐜𝐨𝐧𝐆𝐏 𝐕𝟐

unzip FalconGPV2.zip

📥 𝟓. 𝐈𝐧𝐬𝐭𝐚𝐥𝐥 𝐃𝐞𝐩𝐞𝐧𝐝𝐞𝐧𝐜𝐢𝐞𝐬

npm install --production

🐳 𝟔. 𝐂𝐡𝐞𝐜𝐤 𝐃𝐨𝐜𝐤𝐞𝐫

docker --version

docker info

▶️ 𝟕. 𝐒𝐭𝐚𝐫𝐭 𝐅𝐚𝐥𝐜𝐨𝐧𝐆𝐏

PORT=5067 npm start

🚀 𝟖. 𝐒𝐭𝐚𝐫𝐭 𝐰𝐢𝐭𝐡 𝐏𝐌𝟐

📥 𝐈𝐧𝐬𝐭𝐚𝐥𝐥 𝐏𝐌𝟐

npm install -g pm2

▶️ 𝐒𝐭𝐚𝐫𝐭 𝐏𝐚𝐧𝐞𝐥

PORT=5067 pm2 start app.js --name FalconGP

💾 𝐒𝐚𝐯𝐞 𝐏𝐫𝐨𝐜𝐞𝐬𝐬

pm2 save

⚙️ 𝐄𝐧𝐚𝐛𝐥𝐞 𝐒𝐭𝐚𝐫𝐭𝐮𝐩

pm2 startup

📊 𝐂𝐡𝐞𝐜𝐤 𝐒𝐭𝐚𝐭𝐮𝐬

pm2 list

📜 𝐕𝐢𝐞𝐰 𝐋𝐨𝐠𝐬

pm2 logs FalconGP

🔄 𝐑𝐞𝐬𝐭𝐚𝐫𝐭 𝐏𝐚𝐧𝐞𝐥

pm2 restart FalconGP

🛑 𝐒𝐭𝐨𝐩 𝐏𝐚𝐧𝐞𝐥

pm2 stop FalconGP

�
𝐀𝐧𝐨𝐬𝐂𝐥𝐨𝐮𝐝™ — 𝐏𝐨𝐰𝐞𝐫𝐞𝐝 𝐁𝐲 𝐅𝐚𝐥𝐜𝐨𝐧𝐆𝐏
