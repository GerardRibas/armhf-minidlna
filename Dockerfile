IFROM armv7/armhf-archlinux
MAINTAINER Gerard Ribas <gerard.ribas.canals@gmail.com>

ENV PACMAN_PACKAGES gnutls nettle minidlna

RUN pacman -Sy --needed ${PACMAN_PACKAGES} --noconfirm

ENV RUN_USER   daemon
ENV RUN_GROUP  daemon

RUN chown -R ${RUN_USER}:${RUN_GROUP} /usr/bin/minidlnad \
    && chmod +x /usr/bin/minidlnad                       \
    && yes|pacman -Scc                                   \
    && rm -rf /usr/share/locale/*                        \
    && rm -rf /usr/share/man/*                           \
    && rm -rf /tmp/*

VOLUME /config
VOLUME /media

USER ${RUN_USER}:${RUN_GROUP}

CMD ["/usr/sbin/minidlnad", "-d", "-f", "/config/minidlna.conf"]
