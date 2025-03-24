FROM ubuntu:noble

RUN apt-get update && \
    apt-get install -y \
    iproute2 \
    iputils-ping \
    dnsutils \
    fish \
    neovim \
    openssh-server \
    libnss-ldapd \
    libpam-ldapd \
    ldap-utils

COPY bastion.conf /etc/ssh/sshd_config.d/10-bastion.conf

RUN mkdir -p /local/home/rescue/.ssh
RUN useradd -M -d /local/home/rescue -G sudo rescue

COPY authorized_keys /local/home/rescue/.ssh/authorized_keys
COPY entrypoint.sh /entrypoint.sh

RUN chown -R rescue:rescue /local/home/rescue/.ssh
RUN chmod 700 /local/home/rescue/.ssh && chmod 600 /local/home/rescue/.ssh/authorized_keys
RUN chmod 755 /entrypoint.sh
RUN ssh-keygen -A
RUN mkdir -p /run/sshd

COPY nsswitch.conf /etc/nsswitch.conf
COPY nslcd.conf /etc/nslcd.conf

ENTRYPOINT [ "/entrypoint.sh" ]
