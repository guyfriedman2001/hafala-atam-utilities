sudo dpkg -i github-desktop-*.deb
sudo apt-get install -f  # To fix any dependency issues

cat > ~/.local/share/applications/github-desktop.desktop <<EOF
[Desktop Entry]
Name=GitHub Desktop
Exec=github-desktop
Icon=github-desktop
Type=Application
Categories=Development;Git;
StartupNotify=true
Terminal=false
EOF

chmod +x ~/.local/share/applications/github-desktop.desktop

cp ~/.local/share/applications/github-desktop.desktop ~/Desktop/
chmod +x ~/Desktop/github-desktop.desktop

















sudo apt update
sudo apt install gdebi-core wget -y
wget https://github.com/shiftkey/desktop/releases/download/release-3.3.9-linux1/GitHubDesktop-linux-3.3.9-linux1.deb
sudo gdebi GitHubDesktop-linux-3.3.9-linux1.deb

cat <<EOF | sudo tee /usr/share/applications/github-desktop.desktop > /dev/null
[Desktop Entry]
Name=GitHub Desktop
Exec=/usr/bin/github-desktop
Icon=github-desktop
Type=Application
Categories=Development;
EOF






rm GitHubDesktop-linux-*.deb 2>/dev/null




sudo apt update
sudo apt install gdebi-core wget -y
wget https://github.com/shiftkey/desktop/releases/download/release-3.3.9-linux1/GitHubDesktop-linux-3.3.9-linux1.deb
sudo gdebi GitHubDesktop-linux-3.3.9-linux1.deb









# Import the GPG key
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null

# Add the repository to your sources list
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" | sudo tee /etc/apt/sources.list.d/shiftkey-packages.list

# Update package lists
sudo apt update

# Install GitHub
sudo apt install github-desktop





cat <<EOF > ~/.local/share/applications/github-desktop.desktop
[Desktop Entry]
Name=GitHub Desktop
Exec=/usr/bin/github-desktop
Icon=github-desktop
Type=Application
Categories=Development;Git;
StartupNotify=true
EOF

chmod +x ~/.local/share/applications/github-desktop.desktop



cp ~/.local/share/applications/github-desktop.desktop ~/Desktop/

