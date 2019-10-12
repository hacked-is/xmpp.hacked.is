#!/bin/bash
# Script that syncs all updated files to their corresponding directories

GIT_DIR="/home/user/git"
PROSODY_DATA_DIR="/var/lib/prosody"
ROOT_SCRIPTS_DIR="/root/scripts"

# Run chown-root.sh to force root ownership
bash "${GIT_DIR}"/hacked.is/scripts/chown-root.sh

# Prosody config
echo
echo "Syncing Prosody configs"
rsync -av "${GIT_DIR}"/hacked.is/etc/prosody/ /etc/prosody/

# Hiawatha config
echo
echo "Syncing Hiawatha configs"
rsync -av "${GIT_DIR}"/hacked.is/etc/hiawatha/ /etc/hiawatha/

# Dehydrated config
echo
echo "Syncing Dehydrated configs"
rsync -av "${GIT_DIR}"/hacked.is/home/user/git/dehydrated/ "${GIT_DIR}"/dehydrated/

# Tor config
echo
echo "Syncing Tor configs"
rsync -av "${GIT_DIR}"/hacked.is/etc/tor/ /etc/tor/

# Apt config
echo
echo "Syncing Apt configs"
rsync -av "${GIT_DIR}"/hacked.is/etc/apt/ /etc/apt/

# Logrotate
echo
echo "Syncing logrotate configs"
rsync -av "${GIT_DIR}"/hacked.is/etc/logrotate.d/ /etc/logrotate.d/

# OpenSSL
echo
echo "Syncing OpenSSL configs"
rsync -av "${GIT_DIR}"/hacked.is/etc/ssl/ /etc/ssl/

# Webroot
echo
echo "Syncing /var/www/"
rsync -av "${GIT_DIR}"/hacked.is/var/www/ /var/www/

# Mercurial
echo
echo "Syncing /etc/mercurial"
rsync -av "${GIT_DIR}"/hacked.is/etc/mercurial/ /etc/mercurial/

# Prosody Modules

# prosody_web_registration_theme
echo
echo "Syncing prosody_web_registration_theme"
rsync -av "${GIT_DIR}"/prosody_web_registration_theme /etc/prosody/register-templates/

# mod_register_web
echo
echo "Syncing mod_register_web"
rsync -av "${GIT_DIR}"/mod_register_web/ /var/lib/prosody/modules/mod_register_web/

# Cron
echo
echo "Syncing crontabs"
crontab -u root "${GIT_DIR}"/hacked.is/var/spool/cron/crontabs/root
crontab -u user "${GIT_DIR}"/hacked.is/var/spool/cron/crontabs/user
