FROM ubuntu:14.04
MAINTAINER Max Korenkov <mkorenkov@gmail.com> 

ADD ./pkg/utserver.tar.gz /opt
RUN apt-get update && apt-get install -y libssl0.9.8 libssl1.0.0 && \
    cd /opt/ && ln -s /opt/$(ls /opt/|tail -1) /opt/utorrent-server
COPY ./pkg/utserver.conf /opt/utorrent-server/utserver.conf

EXPOSE 8080 21212
VOLUME ["/data"]
ENTRYPOINT ["/opt/utorrent-server/utserver"]
CMD ["-settingspath", "/opt/utorrent-server/", "-configfile", "/opt/utorrent-server/utserver.conf"]
