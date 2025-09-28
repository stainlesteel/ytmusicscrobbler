# ytmusicscrobbler
Scrobbles music from YouTube Music history to LastFM

## Installation
### Docker Compose
This is the default docker compose yaml for ytmusicscrobbler.
```yaml
services:
  ytmusicscrobbler:
    container_name: ytmusicscrobbler
    image: micahfocht/ytmusicscrobbler:latest
    restart: unless-stopped
    volumes:
      - /path:/config # this is for saving the browser.json file and history.txt
    ports:
      - 8000:8000 # this is for the web ui
    environment:
      - TZ=Etc/UTC
      - LASTFM_API_KEY=
      - LASTFM_API_SECRET= # docs to get keys/secret are available below in setup header
```

### Docker Run
This is the default docker run command for ytmusicscrobbler.
```bash
docker run -d -p 8000:8000 --name ytmusicscrobbler -v /path:/config --restart unless-stopped -e TZ=Etc/UTC -e LASTFM_API_KEY= -e LASTFM_API_SECRET= micahfocht/ytmusicscrobbler:latest
```
## Setup
### YouTube Music Authentication 
Youtube music authentication is handled manually (by the user) via pasting cookie data to a Web UI.

Once the container is running, go to a web browser, and go to the URL of the container (i.e. http://{ip_address_of_server}:{docker_port}). You will see a page explaining how to get your cookies from YouTube Music and to the app, once you've done so, check the logs of the docker container (i.e. `docker logs ytmusicscrobbler` or the GUI/Web UI app of your choice). 

If you see nothing, that is an indicator that YT Music is successfully authenticated with this app, but if you see a python error or a error message, you'll have to try again on the previous URL.

### LastFM Authentication
Last FM requires an API key, available here https://www.last.fm/api/authentication. 
After claiming an API key and secret, you can add it to your docker configuration via these env variables. 

LASTFM_API_KEY

LASTFM_API_SECRET

After running the docker container (and you have authenticated YouTube Music), docker logs will request to enter a LastFM URL in your browser, to give access to this app. After you have done so, it will start to scrobble your YouTube Music history. 
### Optional Variables
There are two more environment variables you can add depending on your needs.

`TZ`: The timezone setting to get the correct scrobbling time for LastFM.

`SLEEP_TIME`: The amount of time spent doing nothing in between each song (to handle rate limits), default is 45.

