FROM alpine 
MAINTAINER Fabio Chiodini <@FabioChiodini> 

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

WORKDIR /

ONBUILD COPY . /
ONBUILD RUN virtualenv /env && /env/bin/pip install -r /app/requirements.txt

EXPOSE 80
CMD ["/env/bin/python", "hello.py"]
