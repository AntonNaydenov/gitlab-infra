FROM debian:bullseye-slim
#RUN apk update && apk add tor vim curl
RUN apt update && apt install tor vim curl -y
#RUN set -x && mv /etc/tor/torrc.sample /etc/tor/torrc
RUN sed -i "s/#HiddenServiceDir \/var\/lib\/tor\/hidden_service\//HiddenServiceDir \/var\/lib\/tor\/hidden_service\//g" /etc/tor/torrc
RUN sed -i "s/#HiddenServicePort 80 127.0.0.1:80/HiddenServicePort 80 10.5.0.5:80/" /etc/tor/torrc
EXPOSE 80
CMD /usr/bin/tor
