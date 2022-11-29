FROM alpine
RUN apk update && apk add tor vim
EXPOSE 80
CMD /usr/sbin/tor
