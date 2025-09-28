# ytmusicscrobbler
Scrobbles music from YouTube Music history to LastFM

## Setup
### YouTube Music Authentication 
Youtube music authentication is handled manually (by the user) via pasting cookie data to a Web UI.

Once the container is running, go to a web browser, and go to the URL of the container (i.e. http://{ip_address_of_server}:{docker_port}). You will see a page explaining how to get your cookies from YouTube Music and to the app, once you've done so, check the logs of the docker container (i.e. `docker logs ytmusicscrobbler` or the GUI/Web UI app of your choice). 

If you see nothing, that is an indicator that YT Music is successfully authenticated with this app, but if you see a python error or a error message, you'll have to try again on the previous URL.

### LastFM Authentication
Last FM  an API key, available here https://www.last.fm/api/authentication. Last FM authentication relies on the following environment variables

LASTFM_API_KEY

LASTFM_API_SECRET

LASTFM_USERNAME

LASTFM_PASSWORD

Optionally, you can set the TZ environment variable to get correct times in your log output.
