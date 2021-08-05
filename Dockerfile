FROM jrei/systemd-ubuntu:latest

RUN apt-get update -y
RUN apt install openssh-server -y
RUN mkdir -p /var/run/sshd

# add default user
RUN useradd avikus
RUN echo 'avikus:avikus' | chpasswd

# copy
COPY src/test.service /lib/systemd/system/
COPY src/test-daemon.sh /opt/test-daemon.sh

# enable
RUN systemctl enable test.service

# nologin
RUN rm -rf /run/nologin

CMD ["/sbin/init"]
