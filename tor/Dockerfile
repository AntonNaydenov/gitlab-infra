FROM debian:bullseye-slim
ADD --chown=root ./run.sh /run.sh
RUN apt update && apt install tor vim curl gcc libsodium-dev make autoconf git iproute2 -y
RUN git clone https://github.com/cathugger/mkp224o && \
    cd mkp224o/ && \
    ./autogen.sh && \
    ./configure && \
    make && \
    mv mkp224o /usr/bin/mkp224o && \
    cd ..
EXPOSE 80 443
CMD /bin/sh /run.sh