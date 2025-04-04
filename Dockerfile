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
    ldap-utils \
    wget \
    netcat-openbsd

RUN wget https://github.com/namachan10777/whaleinit/releases/download/v0.0.3/whaleinit-$(uname -m)-linux-musl -O /whaleinit && \
    chmod 755 /whaleinit

COPY bastion.conf /etc/ssh/sshd_config.d/10-bastion.conf

RUN mkdir -p /local/home/rescue/.ssh
RUN useradd -M -d /local/home/rescue -G sudo rescue

COPY authorized_keys /local/home/rescue/.ssh/authorized_keys
RUN chown -R rescue:rescue /local/home/rescue/.ssh
RUN chmod 700 /local/home/rescue/.ssh && chmod 600 /local/home/rescue/.ssh/authorized_keys
RUN ssh-keygen -A
RUN mkdir -p /run/sshd

COPY nsswitch.conf /etc/nsswitch.conf
COPY nslcd.conf /etc/nslcd.conf

COPY whaleinit.toml /etc/whaleinit.toml

ENTRYPOINT [ "/whaleinit" ]
