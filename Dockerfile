FROM isuhpc/centos-base-systemd

RUN yum -y install postfix epel-release cronie opendkim
RUN yum -y install certbot

RUN mkdir /etc/templates
RUN cp -r /etc/opendkim /etc/templates/

RUN echo '#!/bin/bash' > /startup.sh  && echo "sleep infinity" >> /startup.sh
RUN chmod 755 /startup.sh


CMD ["/startup.sh"]

