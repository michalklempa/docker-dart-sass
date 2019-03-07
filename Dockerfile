FROM ubuntu:18.04 as build
ADD https://github.com/sass/dart-sass/releases/download/1.17.2/dart-sass-1.17.2-linux-ia32.tar.gz /opt/
RUN tar -C /opt/ -xzvf /opt/dart-sass-1.17.2-linux-ia32.tar.gz

FROM ubuntu:18.04 as final
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="dart-sass" \
      org.label-schema.description="sass/dart-sass docker image for web development purposes. Runs sass --watch on provided volumes." \
      org.label-schema.url="https://hub.docker.com/r/michalklempa/dart-sass" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/michalklempa/docker-dart-sass" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get -y install libc6-i386

COPY --from=build /opt/dart-sass /opt/dart-sass

CMD [ "/opt/dart-sass/sass", "--watch", "/sass:/css" ]
