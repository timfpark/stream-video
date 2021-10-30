FROM ubuntu

RUN apt-get update && apt-get install -y --assume-yes vlc

ENV VIDEO_PATH=$VIDEO_PATH
ENV PORT=$PORT

CMD ['cvlc', '${VIDEO_PATH}', ':v4l2-standard=', ':input-slave=alsa://hw:0,0', ':live-caching=300', ':sout="#transcode{vcodec=WMV2, vb=800, scale=1, acodec=wma2, ab=128, channels=2, samplerate=44100}:http{dst=:${PORT}/stream.wmv}"']
