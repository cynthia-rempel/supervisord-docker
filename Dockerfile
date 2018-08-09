FROM centos:centos7.5.1804

RUN yum -y install epel-release && \
    yum -y update

RUN yum -y install \
    audit \
    cronie-noanacron \
    dialog \
    rsyslog \
    supervisor && \
    yum clean all
RUN mkdir -p /run/systemd/journal
COPY etc/CIS.conf /etc/modprobe.d/CIS.conf
ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c","/etc/supervisord.conf"]

