#!/bin/bash

set -e

# Constants
VSCODE_VERSION="1.85.0"
VSCODE_DEB="code_${VSCODE_VERSION}-1702462153_amd64.deb"
DOWNLOAD_URL="https://update.code.visualstudio.com/${VSCODE_VERSION}/linux-deb-x64/stable"

echo "[*] Updating package lists..."
sudo apt-get update

echo "[*] Installing required dependencies..."
sudo apt-get install -y wget gpg apt-transport-https software-properties-common

echo "[*] Downloading Visual Studio Code ${VSCODE_VERSION}..."
wget -O "$VSCODE_DEB" "$DOWNLOAD_URL"

echo "[*] Installing the downloaded package..."
sudo dpkg -i "$VSCODE_DEB" || sudo apt-get -f install -y

echo "[*] Cleaning up..."
rm "$VSCODE_DEB"

echo "[✔] Visual Studio Code ${VSCODE_VERSION} installed successfully!"

