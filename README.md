sass/dart-sass docker image for web development purposes. Runs sass --watch on provided volumes.

# How to use this image
To use this image in web development run this docker command:
```
docker run -v $PWD/sass:/sass/ -v $PWD/css:/css/ -it michalklempa/dart-sass:latest
```
Assuming we have ./sass folder with source files and ./css folder with desired generated CSS files.

Expected output:
```
Compiled sass/main.sass to css/main.css.
Sass is watching for changes. Press Ctrl-C to stop.
```

In our project main folder we can then run some other image to server our web. For example the https://hub.docker.com/r/jekyll/jekyll/.

# Building
This image is based on debian:buster-slim.

Command run by the image:
```
/opt/dart-sass/sass --watch /sass:/css
```

