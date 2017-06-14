FROM debian:8.8
MAINTAINER Massimo Musumeci <massmux@denali.uk>

# Install base packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -yq install \
        curl \
	supervisor \  
        git  &&\
    rm -rf /var/lib/apt/lists/*


# Install SSHD
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install openssh-server pwgen  && \
       mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
       sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

## copy config files
COPY ./src /src/
RUN  mv /src/run.sh /run.sh && \
     mv /src/supervisord.conf /etc/supervisor/conf.d/supervisord.conf && \
     chmod +x /run.sh

ENV AUTHORIZED_KEYS **None**
ENV CONTAINER_ROOT_PASS **None**

EXPOSE 22

# running setup commands + supervisord
CMD ["/run.sh"]
