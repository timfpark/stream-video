FROM ubuntu

RUN apt-get update && apt-get install -y --force-yes vlc

ENV VIDEO_PATH=$VIDEO_PATH

CMD ['cvlc', '${VIDEO_PATH}', ':v4l2-standard=', ':input-slave=alsa://hw:0,0', ':live-caching=300', ':sout="#transcode{vcodec=mp4v, vb=800, scale=1, acodec=mp4a, ab=128, channels=2, samplerate=44100}:http{dst=:8080/stream.wmv}"']
