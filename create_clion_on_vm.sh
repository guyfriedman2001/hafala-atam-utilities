sudo apt update
sudo apt install openjdk-17-jdk curl -y
curl -L https://download.jetbrains.com/cpp/CLion-2024.1.tar.gz -o clion.tar.gz
tar -xzf clion.tar.gz


cat <<EOF > /home/student/Desktop/clion.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=CLion
Exec=/home/student/Desktop/clion/bin/clion.sh
Icon=/home/student/Desktop/clion/bin/clion.svg
Comment=JetBrains CLion IDE
Categories=Development;IDE;
Terminal=false
EOF

chmod +x /home/student/Desktop/clion.desktop



cat <<EOF > ~/.local/share/applications/clion.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=CLion
Exec=/home/student/Desktop/clion/bin/clion.sh
Icon=/home/student/Desktop/clion/bin/clion.svg
Comment=JetBrains CLion IDE
Categories=Development;IDE;
Terminal=false
EOF


chmod +x ~/.local/share/applications/clion.desktop


cp ~/.local/share/applications/clion.desktop ~/Desktop/
chmod +x ~/Desktop/clion.desktop


echo "guy hamelech sider po clion blyat"

