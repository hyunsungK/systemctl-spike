FROM ubuntu:18.04

RUN apt-get update -y
RUN apt install openssh-server -y
RUN   mkdir -p /var/run/sshd

# add default user
RUN useradd avikus
RUN echo 'avikus:avikus' |chpasswd

# 
RUN apt-get install -y --no-install-recommends systemd
 

# copy
COPY src/test.service /lib/systemd/system/
COPY src/test-daemon.sh /opt/test-daemon.sh

# enable
RUN systemctl enable test.service

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
