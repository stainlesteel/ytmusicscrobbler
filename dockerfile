FROM --platform=$BUILDPLATFORM python:3.12

LABEL Maintainer="micahfocht"

ENV LASTFM_API_KEY=''
ENV LASTFM_API_SECRET=''
ENV LASTFM_USERNAME=''
ENV LASTFM_PASSWORD=''
ENV SLEEP_TIME=45

EXPOSE 8000/tcp


WORKDIR /app
VOLUME [ "/config" ]

RUN python3 -m pip install git+https://github.com/sigma67/ytmusicapi@0d39603 pylast flask

COPY scrobble.py /app/

SHELL ["/bin/bash", "-c"]

CMD python3 -u scrobble.py

