# apify-actor-docker

[![Build Status](https://travis-ci.org/apifytech/apify-actor-docker.svg)](https://travis-ci.org/apifytech/apify-actor-docker)

Public Docker images for Apify Actor serverless platform (https://www.apify.com/docs/actor)

The sources for the images are present in subdirectories that are named as the corresponding
Docker image. For example, the `node-basic` directory corresponds to the
[apify/actor-node-basic](https://hub.docker.com/r/apify/actor-node-basic/) Docker image.

The images are using the following tags:

Tag         | Description
----------- | -------------
`latest`    | Well-tested production version of the image.
`beta`      | Development version of the image.


## Maintenance

In order to build and publish a new version of the Docker images,
first ensure you're logged in to your Docker Hub account by running:

```bash
docker login
````

Then build the Docker image:

```bash
./build.sh node-basic
```

After the Docker image is well tested, it can be pushed with the `latest` tag:

```bash
docker push apify/actor-node-basic:latest
```

Then you can remove the images from your computer:
```bash
./clean.sh
```

*IMPORTANT*

If the `beta` images were built by Travis CI and are already available on Docker Hub
but not your local computer, then to publish them with the `latest` you need to
run the following script:

```bash
./publish_beta_as_latest.sh node-basic
```

Do the same for other images,

## yonny's image "node-chrome-xvfb-x11vnc"

Image is usable for local docker run debugging. User can see what is done inside running container.

Default x11vnc port (5900) must be redirected to localhost machine port.

```dcoker build . -t your_image_tag && docker run -p 5900:5900 your_image_tag```

and can be accessed by cmd e.g.:

```xtightvncviewer localhost:5900```
