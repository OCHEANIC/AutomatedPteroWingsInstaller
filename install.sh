echo ----------------------------------------------
echo Pterodactyl Wings Installer
echo Developed By OCHEANIC
echo ----------------------------------------------
echo [INSTALLER] Starting in 5 seconds... 
echo [INSTALLER] If you dont want to install wings then do CTRL + C now
sleep 5s
echo [INSTALLER] Starting...
curl -sSL https://get.docker.com/ | CHANNEL=stable bash
systemctl enable --now docker
GRUB_CMDLINE_LINUX_DEFAULT="swapaccount=1"
mkdir -p /etc/pterodactyl
curl -L -o /usr/local/bin/wings "https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_$([[ "$(uname -m)" == "x86_64" ]] && echo "amd64" || echo "arm64")"
chmod u+x /usr/local/bin/wings
apt install certbot
certbot certonly -d $HOSTNAME
echo [INSTALLER] Installed wings without errors
echo ----------------------------------------------
echo Installed Wings
echo You can now configure wings
echo SSL was created for the server's hostname
echo ----------------------------------------------
