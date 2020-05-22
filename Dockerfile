FROM isuhpc/centos-base-systemd

# Install mail components
RUN yum -y install postfix epel-release cronie opendkim mailx cyrus-sasl-plain

# Install syslog-ng to allow postfix logging
RUN yum -y install syslog-ng

# Install cerbot for automated SSL renewals
RUN yum -y install certbot

RUN mkdir /etc/templates
RUN cp -r /etc/opendkim /etc/templates/
RUN cp -r /etc/postfix /etc/templates/

RUN echo '#!/bin/bash' > /startup.sh  && echo "sleep infinity" >> /startup.sh
RUN chmod 755 /startup.sh


CMD ["/startup.sh"]

