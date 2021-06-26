FROM       ubuntu:latest

# UPDATE & INSTALL SOME REQUIRED PACKAGE
RUN apt update -y && apt upgrade -y
RUN apt-get install -y \
    sudo \
    openssh-server \
    openssl

# CREATE USER
RUN groupadd admin 
RUN useradd -rm -d /home/admin -s /bin/bash -g admin -G sudo -u 1001 admin -p $(openssl passwd -1 admin)
RUN mkdir /home/admin/.ssh
RUN chown -R admin:admin /home/admin

# SETTUP SSHD
RUN mkdir /var/run/sshd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config



# CLEAR
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]



