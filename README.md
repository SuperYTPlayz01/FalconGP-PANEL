# 🦅 FalconGP V2

<p align="center">
  <img src="https://i.postimg.cc/dQBhBwQg/file-00000000923881fdb18fb3005102c2a6.png" alt="FalconGP banner" width="100%">
</p>

<p align="center">
  <strong>A modern Minecraft server hosting and management panel</strong><br>
  Create, manage, monitor, and customize Minecraft servers from one web interface.
</p>

<p align="center">
  <a href="https://falconxgp.indevs.in"><img src="https://img.shields.io/badge/Official%20Site-7C3AED?style=for-the-badge&logo=googlechrome&logoColor=white" alt="Official site"></a>
  <a href="https://youtube.com/@superytplayz01"><img src="https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white" alt="YouTube"></a>
  <a href="https://discord.gg/kcW4f2c8CV"><img src="https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white" alt="Discord"></a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Panel-Minecraft%20Hosting-EF233C?style=flat-square" alt="Minecraft hosting">
  <img src="https://img.shields.io/badge/Backend-Node.js-339933?style=flat-square&logo=node.js&logoColor=white" alt="Node.js">
  <img src="https://img.shields.io/badge/Database-SQLite-003B57?style=flat-square&logo=sqlite&logoColor=white" alt="SQLite">
  <img src="https://img.shields.io/badge/License-MIT-blue?style=flat-square" alt="MIT License">
</p>

FalconGP V2 builds on the original FalconGP panel with expanded server runtimes, administration tools, and reliability improvements. It is designed for hosting providers, server owners, and gaming communities that need a central place to operate Minecraft servers.

> **AnosCloud™ — Powered by FalconGP**

## Features

### Server management

- Create and manage Minecraft servers, with start, stop, and restart controls.
- Live server status, console output, command input, player lists, and resource statistics.
- Configure server startup options and edit `server.properties`.
- Manage players, including whitelist, ban, IP ban, and kick actions.
- Control server access with subusers and permissions.

### Docker and server runtimes

- New servers use the Docker runtime by default.
- Docker supports Vanilla, Paper, Purpur, Fabric, Forge, Quilt, and Spigot.
- Docker applies configured CPU and memory limits and persists server files in the server directory.
- Admins can inspect container health, resource usage, and recent logs; manage containers; and update images. FalconGP attempts to roll back if an image update fails to start.
- Bedrock servers run natively on Linux. Bedrock, proxy, and other unsupported software use the legacy local runtime.
- Graceful Docker shutdown avoids relying on an RCON `stop` command.

### Server tools

- File manager with upload, download, folder, and file operations.
- Backups and scheduled tasks.
- Plugin, mod, world, and marketplace management.
- Bedrock add-on search and installation workflows.
- Public IP and tunnel-related server pages.

### Falcon Journey queue

- Persistent FIFO queue for user-requested server starts and restarts.
- Queue entries and settings survive panel restarts; administrators can pause the queue, manage waiting entries, set priorities, and configure capacity.
- Optional estimated wait times, queue-page expiry, and cinematic or sound preferences.
- Administrators can tune queue behavior in **Admin Panel → Falcon Queue** or with environment variables (see [Configuration](#configuration)).

### Accounts and administration

- Login and registration, user profiles, notifications, and account activity.
- Admin dashboard and management of users, servers, roles, and panel settings.
- Support tickets, announcements, coupons, credits, and the resource store.
- Audit logs, Docker management, and server-management tools.

## Screenshots

<p align="center">
  <img src="https://i.postimg.cc/dQBhBwQg/file-00000000923881fdb18fb3005102c2a6.png" alt="FalconGP V2 panel" width="100%">
</p>

## Tech stack

| Component | Technology |
| --- | --- |
| Backend | Node.js, Express |
| Frontend | EJS, HTML, CSS, JavaScript |
| Database | SQLite |
| Realtime updates | Socket.IO |
| Minecraft runtime | Docker or local process |

## Requirements

- Node.js 20 or newer and npm.
- Docker Engine and permission to access its daemon for Docker-based servers.
- Java installed on the host for Java Edition servers using the local runtime.
- Linux for native Bedrock server runtime.

Docker pulls the `itzg/minecraft-server` image when a compatible Docker server is first started. Java does not need to be installed on the host for those Docker servers.

## Installation

```bash
git clone https://github.com/suprialmc/FalconGP.git
cd FalconGP
npm install
```

Set a strong session secret before starting the panel:

```bash
export SESSION_SECRET="$(openssl rand -hex 32)"
npm start
```

The panel listens on port `3000` by default. Set `PORT` to use another port:

```bash
PORT=5000 npm start
```

For development with automatic restarts:

```bash
npm run dev
```

The application creates and initializes its SQLite database (`database.db`) and required queue tables on startup. Keep the database and server data on persistent storage, and back them up regularly.

### Initial owner account

On a fresh database, FalconGP creates an initial panel owner account:

| Username | Password |
| --- | --- |
| `falcongp` | `falcongp123` |

**Change this password immediately after your first login.** Do not expose a fresh installation to the public internet while these credentials are still active.

## Configuration

Set environment variables in the shell or deployment platform before starting FalconGP. The application reads these values from its process environment.

| Variable | Default | Description |
| --- | --- | --- |
| `PORT` | `3000` | Web panel listening port. |
| `SESSION_SECRET` | Insecure built-in fallback | Secret used to sign sessions. Set a long, random value for every deployment. |
| `CURSEFORGE_API_KEY` | — | Optional; required for CurseForge search and automatic installation of Bedrock add-ons. |
| `FALCON_QUEUE_ENABLED` | `true` | Enable the start/restart queue. Set to `false` to send new requests directly to server actions. |
| `FALCON_QUEUE_MAX_CONCURRENT` | `1` | Maximum concurrent queued operations. |
| `FALCON_QUEUE_MAX_WAITING` | `0` | Maximum waiting entries; `0` means unlimited. |
| `FALCON_QUEUE_GRACE_PERIOD` | `60` | Seconds without a queue-page heartbeat before a waiting entry expires; `0` disables expiry. |
| `FALCON_QUEUE_ESTIMATION_ENABLED` | `true` | Show estimated queue wait time. |
| `FALCON_QUEUE_ESTIMATED_SECONDS_PER_SLOT` | `90` | Estimated duration per queue slot, in seconds. |
| `FALCON_QUEUE_CINEMATIC` | `true` | Enable queue-page cinematic effects. |
| `FALCON_QUEUE_SOUND_DEFAULT` | `false` | Enable the optional queue-page sound by default. |

Administrators can also adjust queue settings from **Admin Panel → Falcon Queue → Queue configuration**. Saved panel settings take precedence over environment defaults.

## Deployment notes

- Put the panel behind HTTPS in production.
- Use a dedicated operating-system account with only the permissions needed to run the panel and its selected server runtime.
- Restrict Docker daemon access; Docker access can grant powerful host-level capabilities.
- Persist and protect `database.db`, `servers/`, `backups/`, and uploaded files.
- Use strong account passwords, change the initial owner password, and keep Node.js and dependencies updated.
- Keep backups of panel data and Minecraft worlds, and verify that backups can be restored.

## Project layout

```text
FalconGP/
├── public/          # Static assets
├── views/           # EJS pages for users, servers, and administration
├── servers/         # Minecraft server data (created/used at runtime)
├── uploads/         # Uploaded assets
├── app.js           # Express application and panel logic
├── database.db      # SQLite database (created/used at runtime)
├── init-database.js # Database utility
├── package.json
└── README.md
```

## Contributing

Please get permission from the project maintainer before submitting contributions. You may fork the project, but do not present it as your own work. If you have permission to contribute, create a branch for your changes and open a pull request.

## License

FalconGP is distributed under the [MIT License](./LICENSE).

## Credits

Created by **SuperYTPlayz**.

<p align="center"><strong>AnosCloud™ — Powered by FalconGP</strong></p>
