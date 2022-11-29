FROM ubuntu
RUN apt update -y && apt install tor vim -y
RUN echo 'HiddenServiceDir /var/lib/tor/hidden_service/' >> /etc/tor/torrc
RUN echo 'HiddenServicePort 80 gitlab:80' >> /etc/tor/torrc
EXPOSE 80
CMD /usr/sbin/tor
