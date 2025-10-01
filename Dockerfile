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
    netcat-openbsd \
    unzip \
    subversion \
    less

RUN wget https://github.com/namachan10777/whaleinit/releases/download/v0.0.4/whaleinit-$(uname -m)-linux-musl -O /whaleinit && \
    chmod 755 /whaleinit

COPY bastion.conf /etc/ssh/sshd_config.d/10-bastion.conf

RUN mkdir -p /local/home/rescue/.ssh
RUN useradd -M -d /local/home/rescue -G sudo rescue

COPY authorized_keys /local/home/rescue/.ssh/authorized_keys
COPY ssh_host_keys_gen.sh /usr/local/bin/ssh_host_keys_gen.sh
RUN chown -R rescue:rescue /local/home/rescue/.ssh
RUN chmod 700 /local/home/rescue/.ssh && chmod 600 /local/home/rescue/.ssh/authorized_keys
RUN mkdir -p /run/sshd
RUN echo 'work' > /etc/hostname

COPY nsswitch.conf /etc/nsswitch.conf
COPY nslcd.conf /etc/nslcd.conf

COPY whaleinit.toml /etc/whaleinit.toml

RUN rm /etc/ssh/ssh_host_*_key*

ENTRYPOINT [ "/whaleinit" ]
