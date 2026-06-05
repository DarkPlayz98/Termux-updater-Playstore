# Termux Updater & Dev Toolbox

[![Platform](https://img.shields.io/badge/Platform-Android-3DDC84?logo=android&logoColor=white)](https://termux.dev)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Maintained By](https://img.shields.io/badge/Maintained%20By-Itz__MeDark-7B1FA2)](https://github.com/DarkPlayz98)

A sleek, interactive command-line dashboard engineered to revive and modernize outdated Termux installations (such as the deprecated Google Play Store version). This utility automatically hijacks broken repository links, fixes security keyrings, connects to lightning-fast regional mirrors, and deploys a complete mobile development environment.

---

## 🚀 Features

* **Repository Hijacking:** Instantly bypasses dead Play Store package servers and redirects to official, active mirrors.
* **Cryptographic Fixes:** Automatically updates missing or expired repository signing keys (`termux-keyring`) without manual overrides.
* **Regional Mirror Selector:** Choose between Global CDN, Asia/India (Tsinghua), or Europe (Grimler) nodes for maximum download velocity.
* **Automated Dev Toolkit:** Deploys `Node.js`, `Python`, `Git`, and `build-essential` compilers in a single click.
* **Process Management:** Integrates `PM2` globally to ensure your Discord and AI bots run persistently in the background.
* **Aesthetic CLI Terminal Interface:** Features dynamic progress readouts paired with a polished, rainbow ASCII success banner.

---

## 📦 Installation & Execution

Open your Termux app and execute the following commands sequentially:

```bash
# Clone the repository
git clone [https://github.com/DarkPlayz98/termux-updater.git](https://github.com/DarkPlayz98/termux-updater-playstore.git)

# Navigate into the project directory
cd termux-updater

# Grant execution permissions to the script
chmod +x update.sh

# Launch the interactive toolbox
./update.sh
