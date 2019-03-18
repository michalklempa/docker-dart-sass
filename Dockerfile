FROM ubuntu:18.04 as build
ADD https://github.com/sass/dart-sass/releases/download/1.17.3/dart-sass-1.17.3-linux-x64.tar.gz /opt/
RUN tar -C /opt/ -xzvf /opt/dart-sass-1.17.3-linux-x64.tar.gz

FROM ubuntu:18.04 as final
ARG BRANCH
ARG COMMIT
ARG DATE
ARG URL
ARG VERSION

MAINTAINER michal.klempa@gmail.com

LABEL org.label-schema.schema-version="1.0" \
    org.label-schema.build-date=$DATE \
    org.label-schema.vendor="Michal Klempa" \
    org.label-schema.name="michalklempa/dart-sass" \
    org.label-schema.description="sass/dart-sass docker image for web development purposes. Runs sass --watch on provided volumes." \
    org.label-schema.url="https://hub.docker.com/r/michalklempa/dart-sass" \
    org.label-schema.docker.cmd="docker run -v $PWD/sass:/sass/ -v $PWD/css:/css/ --init -it michalklempa/dart-sass:latest" \
    org.label-schema.version="$VERSION" \
    org.label-schema.vcs-url=$URL \
    org.label-schema.vcs-branch=$BRANCH \
    org.label-schema.vcs-ref=$COMMIT

COPY --from=build /opt/dart-sass /opt/dart-sass

CMD [ "/opt/dart-sass/sass", "--watch", "/sass:/css" ]
