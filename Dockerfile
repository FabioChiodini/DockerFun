FROM alpine 
MAINTAINER Fabio Chiodini <@FabioChiodini> 

RUN apk --update add git python py-pip && rm -f /var/cache/apk/*
RUN pip install flask requests cfenv click Flask furl itsdangerous Jinja2 MarkupSafe orderedmultidict six Werkzeug wheel
COPY hello.py /tmp/
EXPOSE 80
ENTRYPOINT ["python","/tmp/hello.py"]
