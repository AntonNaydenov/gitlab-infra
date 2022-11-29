FROM alpine
RUN apk update && apk add tor vim
RUN sed -i 's/#HiddenServiceDir \/var\/lib\/tor\/hidden_service\//HiddenServiceDir \/var\/lib\/tor\/hidden_service\//g' /etc/tor/torrc
RUN sed -i 's/HiddenServicePort 80 127.0.0.1:80/HiddenServicePort 80 gitlab:80/g' /etc/tor/torrc
EXPOSE 80
CMD /usr/sbin/tor
