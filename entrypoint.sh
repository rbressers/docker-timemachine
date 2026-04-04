#!/bin/bash

USER=${TM_USER:-timemachine}
PASS=${TM_PASS:-password}
QUOTA=${TM_QUOTA:-1000G}
NAME=${TM_NAME:-NUC-TimeMachine}

echo "Configuring Time Machine: Name=$NAME, User=$USER, Quota=$QUOTA"

if ! id "$USER" &>/dev/null; then
    adduser -D -u 10000 -H "$USER"
fi

echo -e "$PASS\n$PASS" | smbpasswd -a -s "$USER"

sed -i "s/%%USER%%/$USER/g" /etc/samba/smb.conf
sed -i "s/%%QUOTA%%/$QUOTA/g" /etc/samba/smb.conf
sed -i "s/%%NAME%%/$NAME/g" /etc/samba/smb.conf

mkdir -p /var/run/avahi-daemon
chown avahi:avahi /var/run/avahi-daemon
avahi-daemon --daemonize --no-drop-root

# Using the correct flag for Samba 4.22+
exec smbd --foreground --no-process-group --debug-stdout
