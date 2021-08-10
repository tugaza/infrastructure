FROM debian:sid-slim
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y icecast2 ezstream python3-pip amqp-tools ffmpeg mbuffer wget procps python3 redis-tools jq curl pv alsa-tools alsa-utils
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN mkdir /src; chown nobody:root /src; mkdir /nonexistent; chmod 777 /nonexistent
WORKDIR /src
RUN wget https://yt-dl.org/downloads/latest/youtube-dl -O youtube-dl && chmod a+rx youtube-dl && chown nobody:root youtube-dl;
RUN usermod -G audio nobody
USER nobody
ADD . /src/
CMD ["/bin/bash", "/src/entrypoint.sh"]