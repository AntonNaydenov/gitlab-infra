FROM ubuntu'
RUN apt update -y && apt install tor vim -y
RUN echo 'HiddenServiceDir /var/lib/tor/hidden_service/' >> /etc/tor/torrc
RUN echo 'HiddenServicePort 80 127.0.0.1:80' >> /etc/tor/torrc
