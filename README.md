sass/dart-sass docker image for web development purposes. Runs sass --watch on provided volumes.

# How to use this image
To use this image in web development run this docker command:
```
docker run -v $PWD/sass:/sass/ -v $PWD/css:/css/ --init -it michalklempa/dart-sass:latest
```
Assuming we have ./sass folder with source files and ./css folder with desired generated CSS files.

Expected output:
```
Compiled sass/main.sass to css/main.css.
Sass is watching for changes. Press Ctrl-C to stop.
```

In our project main folder we can then run some other image to server our web. For example the https://hub.docker.com/r/jekyll/jekyll/.

# Building
This image is based on ubuntu:18.04.
Build stage pulls and untars https://github.com/sass/dart-sass/releases/download/1.17.2/dart-sass-1.17.2-linux-ia32.tar.gz into /opt/.

Final stage based on ubuntu:18.04 copies this folder into /opt/dart-sass. Final stage installs the libc6-i386 ubuntu package to run 32bit dart-sass binary.

Command run by the image:
```
/opt/dart-sass/sass --watch /sass:/css
```

