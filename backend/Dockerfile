FROM debian:sid-slim
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y icecast2 ezstream python3-pip ffmpeg mbuffer wget procps python3 redis-tools jq curl pv alsa-tools alsa-utils ncat
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN mkdir /src; chown nobody:root /src; mkdir /nonexistent; chmod 777 /nonexistent
WORKDIR /src
RUN wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp -O youtube-dl && chmod a+rx youtube-dl && chown nobody:root youtube-dl;
RUN usermod -G audio nobody
ADD . /src/
WORKDIR /src
RUN mkdir cache || true
RUN bash install-deps.sh
USER nobody
CMD ["/bin/bash", "/src/entrypoint.sh"]