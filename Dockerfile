FROM alpine:latest

# Stick to stable packages for maximum compatibility
RUN apk add --no-cache \
    samba \
    samba-common-tools \
    bash \
    avahi \
    avahi-tools

COPY smb.conf /etc/samba/smb.conf
COPY entrypoint.sh /entrypoint.sh
COPY samba.service /etc/avahi/services/samba.service

RUN chmod +x /entrypoint.sh && mkdir -p /backups

EXPOSE 445 137/udp 138/udp 139 5353/udp

ENTRYPOINT ["/entrypoint.sh"]
